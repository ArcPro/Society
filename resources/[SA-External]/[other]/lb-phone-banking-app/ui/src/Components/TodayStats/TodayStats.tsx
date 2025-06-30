import React, { useEffect, useState } from 'react';
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from "chart.js";
import { Doughnut } from "react-chartjs-2";
import "./TodayStats.css";
ChartJS.register(ArcElement, Tooltip, Legend);

const TodayStats = ({transactions}) => {
	const [soldeNet, setSoldeNet] = useState(0);
	const [expenses, setExpenses] = useState(0);
	const [income, setIncome] = useState(0);
	
	const options = {
		responsive: true,
		plugins: {
			legend: {
				display: false,
			},
			title: {
				display: false,
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


	let data = {
		labels: ["Dépenses", "Revenus"],
		datasets: [
			{
				label: "Dépenses",
				data: [expenses, income],
				backgroundColor: ["#fea57f", "#16697a"],
				hoverBackgroundColor: ["#fea57f", "#16697a"],
				borderWidth: 2,
				borderRadius: 10,
				cutout: "80%",
			},
		],
	};

	useEffect(() => {
		const today = new Date();
		const todayString = today.toISOString().split("T")[0];		
		const todayTransactions = transactions.filter((t) => {
			const [day, month, year] = t.date.split("/").map(Number);
			// Créez la date de la transaction sans tenir compte du fuseau horaire
			const transactionDate = new Date(Date.UTC(year, month - 1, day));
			// Comparez les dates en chaînes pour éviter les problèmes de fuseau horaire
			return transactionDate.toISOString().split("T")[0] === todayString;
		});


		let solde = 0;
		let exp = 0;
		let inc = 0;
		todayTransactions.forEach(t => {
			const amount = parseFloat(t.amount.replace("$", ""));
			solde += amount;
			if (amount < 0) {
				exp += amount;
			} else {
				inc += amount;
			}
		});
		console.log(exp, inc, solde);
		setSoldeNet(solde);
		setExpenses(exp);
		setIncome(inc);
		
		console.log(data);


	}, [transactions]);

  return (
    <div>
      <div className='doughnut-container'>
		<div className='doughnut-details'>
			<div>Dépenses: {expenses.toFixed(2)}</div>
			<div>Revenus: {income.toFixed(2)}</div>
		</div>
		<div className='doughnut'>
			<Doughnut options={options} data={data} />
		</div>
      </div>
    </div>
  );
};

export default TodayStats;