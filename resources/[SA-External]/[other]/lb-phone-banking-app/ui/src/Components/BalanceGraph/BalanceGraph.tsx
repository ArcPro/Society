import React, { useState, useEffect } from 'react';
import { Line } from 'react-chartjs-2';
import {
	Chart as ChartJS,
	CategoryScale,
	LinearScale,
	PointElement,
	LineElement,
	Title,
	Tooltip,
	Filler,
	Legend,
} from 'chart.js';


ChartJS.register(
	CategoryScale,
	LinearScale,
	PointElement,
	LineElement,
	Title,
	Tooltip,
	Filler,
	Legend
);

const options = {
	responsive: true,
	plugins: {
		legend: {
			display: false,
		},
		title: {
			display: true,
			text: 'Evolution du solde quotidien',
		},
	},
	layout: {
		padding: {
			left: 10,
			right: 30,
		}
	},
};

var labels = ['2021-09-01', '2021-09-02', '2021-09-03'];
var dailyBalances = [
	1000, 1500, 800
];

const data = {
	labels,
	datasets: [
		{
			fill: false,
			label: 'Dataset 2',
			data: dailyBalances,
			borderColor: 'rgb(53, 162, 235)',
		},
	],
};


function BalanceGraph({ transactions, currentBalance }) {
	const [chartData, setChartData] = useState(data);
	
	// generate default data for the chart to load
	
	useEffect(() => {

		const calculateBalances = () => {
			const endDate = new Date();
			const startDate = new Date();

			startDate.setDate(endDate.getDate() - 7);
			
			let dailyBalances: { [key: string]: number } = {};
			dailyBalances[startDate.toISOString().split('T')[0]] = currentBalance;

			for (let d = new Date(startDate); d <= endDate; d.setDate(d.getDate() + 1)) {
				const key = d.toISOString().split('T')[0];
				if (d > startDate) {
					dailyBalances[key] = dailyBalances[new Date(d.getTime() - 86400000).toISOString().split('T')[0]];
				}
			}
			
			// Étape 1 : Initialiser l'objet pour stocker les sommes quotidiennes
			let dailySums = {};
			
			// Étape 2 : Parcourir toutes les transactions et calculer les sommes quotidiennes
			transactions.forEach((transaction) => {
				const [dayA, monthA, yearA] = transaction.date.split('/').map(Number);
				const transactionDate = new Date(yearA, monthA - 1, dayA).toISOString().split('T')[0];
				if (transactionDate >= startDate.toISOString().split('T')[0] && transactionDate <= endDate.toISOString().split('T')[0]) {
					if (!dailySums[transactionDate]) {
						dailySums[transactionDate] = 0;
					}
					const amount = parseFloat(transaction.amount.replace('$', ''));
					dailySums[transactionDate] += amount; // Assurez-vous que `transaction.amount` est un nombre
				}
			});
			
			// Étape 3 : Parcourir les sommes quotidiennes et mettre à jour les soldes quotidiens en partant du plus récent
			const dates = Object.keys(dailySums).sort((a, b) => new Date(b).getTime() - new Date(a).getTime());
			dates.forEach((date) => {
				currentBalance += dailySums[date] * -1;
				dailyBalances[date] = currentBalance;
			});

			return dailyBalances
		};
		
		const balances = calculateBalances();
		
		const labels = Object.keys(balances).map((label) => {
			const [year, month, day] = label.split('-').map(Number);
			return `${day}/${month}`;
		})

		let data = Object.values(balances);		
		
		// Analyze data and if the values are too big, divide them by 1000
		const max = Math.max(...data);
		if (max > 10000) {
			data = data.map((value) => value / 1000);
		}

		setChartData({
			labels,
			datasets: [
				{
					label: 'Solde',
					data: data,
					fill: false,
					backgroundColor: 'rgb(75, 192, 192)',
					borderColor: 'rgba(75, 192, 192, 0.2)',
				},
			],
		});
	}, [transactions, currentBalance]);
	
	return <Line options={options} data={chartData} />;;
}

export default BalanceGraph;