import React, { useEffect, useRef, useState } from "react"
import "./App.css"
import Bouton from "./Components/Bouton/Bouton"
import TransactionsPreview from "./Components/Transactions/TransactionsPreview"
// import icons for transfer and bills buttons
import { FaDollarSign, FaExchangeAlt, FaFileInvoiceDollar } from "react-icons/fa"
import { CiBank } from "react-icons/ci"
import BalanceGraph from "./Components/BalanceGraph/BalanceGraph"
const devMode = !window?.["invokeNative"]
import { FaBolt, FaCreditCard, FaGasPump, FaPhone, FaWater } from 'react-icons/fa';
import TodayStats from "./Components/TodayStats/TodayStats"

const App = () => {
	const [theme, setTheme] = useState("light")
	const [direction, setDirection] = useState("N")
	const [notificationText, setNotificationText] = useState("Notification text")
	const appDiv = useRef(null)

	const {
		setPopUp,
		setContextMenu,
		selectGIF,
		selectGallery,
		selectEmoji,
		fetchNui,
		sendNotification,
		getSettings,
		onSettingsChange,
		colorPicker,
		useCamera
	} = window as any

	const devTransactions = [
		{
		  "id": 1,
		  "Icon": FaCreditCard,
		  "title": "Paiement de facture",
		  "description": "Facture de téléphone",
		  "amount": "-$50.00",
		  "date": "12/06/2024"
		},
		{
		  "id": 2,
		  "Icon": FaWater,
		  "title": "Paiement de facture",
		  "description": "Facture d'eau",
		  "amount": "-$30.00",
		  "date": "08/06/2024"
		},
		{
		  "id": 3,
		  "Icon": FaGasPump,
		  "title": "Paiement de facture",
		  "description": "Facture de gaz",
		  "amount": "-$40.00",
		  "date": "05/06/2024"
		},
		{
		  "id": 4,
		  "Icon": FaBolt,
		  "title": "Paiement de facture",
		  "description": "Facture d'électricité",
		  "amount": "-$60.00",
		  "date": "15/06/2024"
		},
		{
		  "id": 5,
		  "Icon": FaPhone,
		  "title": "Recharge mobile",
		  "description": "Recharge pour le numéro +123456789",
		  "amount": "-$20.00",
		  "date": "10/06/2024"
		},
		{
		  "id": 6,
		  "Icon": FaCreditCard,
		  "title": "Achat en ligne",
		  "description": "Amazon Order #123456",
		  "amount": "-$120.00",
		  "date": "09/06/2024"
		},
		{
		  "id": 7,
		  "Icon": FaCreditCard,
		  "title": "Achat en ligne",
		  "description": "Ebay Order #654321",
		  "amount": "-$80.00",
		  "date": "07/06/2024"
		},
		{
		  "id": 8,
		  "Icon": FaWater,
		  "title": "Paiement de facture",
		  "description": "Facture de jardinage",
		  "amount": "-$25.00",
		  "date": "06/06/2024"
		},
		{
		  "id": 9,
		  "Icon": FaGasPump,
		  "title": "Plein d'essence",
		  "description": "Station Total",
		  "amount": "-$70.00",
		  "date": "04/06/2024"
		},
		{
		  "id": 10,
		  "Icon": FaBolt,
		  "title": "Paiement de facture",
		  "description": "Facture d'internet",
		  "amount": "-$55.00",
		  "date": "03/06/2024"
		},
		{
		  "id": 11,
		  "Icon": FaPhone,
		  "title": "Recharge mobile",
		  "description": "Recharge pour le numéro +987654321",
		  "amount": "-$15.00",
		  "date": "02/06/2024"
		},
		{
		  "id": 12,
		  "Icon": FaCreditCard,
		  "title": "Achat en ligne",
		  "description": "Steam Game Purchase",
		  "amount": "-$60.00",
		  "date": "01/06/2024"
		},
		{
		  "id": 13,
		  "Icon": FaWater,
		  "title": "Paiement de facture",
		  "description": "Facture de piscine",
		  "amount": "-$200.00",
		  "date": "11/06/2024"
		},
		{
		  "id": 14,
		  "Icon": FaGasPump,
		  "title": "Plein d'essence",
		  "description": "Station Shell",
		  "amount": "-$50.00",
		  "date": "13/06/2024"
		},
		{
		  "id": 15,
		  "Icon": FaBolt,
		  "title": "Paiement de facture",
		  "description": "Facture de chauffage",
		  "amount": "-$100.00",
		  "date": "14/06/2024"
		},
		{
		  "id": 16,
		  "Icon": FaPhone,
		  "title": "Recharge mobile",
		  "description": "Recharge pour le numéro +1122334455",
		  "amount": "-$25.00",
		  "date": "16/06/2024"
		},
		{
		  "id": 17,
		  "Icon": FaCreditCard,
		  "title": "Achat en ligne",
		  "description": "Newegg Order #789123",
		  "amount": "-$450.00",
		  "date": "17/06/2024"
		},
		{
		  "id": 18,
		  "Icon": FaWater,
		  "title": "Paiement de facture",
		  "description": "Facture d'arrosage automatique",
		  "amount": "-$35.00",
		  "date": "18/06/2024"
		},
		{
		  "id": 19,
		  "Icon": FaGasPump,
		  "title": "Plein d'essence",
		  "description": "Station BP",
		  "amount": "-$65.00",
		  "date": "19/06/2024"
		},
		{
		  "id": 20,
		  "Icon": FaBolt,
		  "title": "Paiement de facture",
		  "description": "Facture de climatisation",
		  "amount": "-$75.00",
		  "date": "20/06/2024"
		},
		{
			"id": 21,
			"Icon": FaDollarSign,
			"title": "Virement",
			"description": "Virement de salaire",
			"amount": "+$600.00",
			"date": "21/06/2024"
		},
		{
			"id": 22,
			"Icon": FaDollarSign,
			"title": "Virement",
			"description": "Virement pour des putes",
			"amount": "-$50.00",
			"date": "22/06/2024"
		},
		{
			id: 23,
			Icon: FaDollarSign,
			title: "Virement",
			description: "Virement pour des putes",
			amount: "-$50.00",
			date: "23/06/2024"
		},
		{
			id: 24,
			Icon: FaDollarSign,
			title: "Virement",
			description: "Virement pour des putes",
			amount: "-$70.00",
			date: "23/06/2024"
		},
		{
			id: 25,
			Icon: FaDollarSign,
			title: "Virement",
			description: "Virement de salaire",
			amount: "+$600.00",
			date: "23/06/2024"
		},
	]; 

	const currentBalance = 120456.67
	let yesterdayBalance = 120456.67

	const todayDate = new Date()
	const yesterdayDate = new Date()
	yesterdayDate.setDate(yesterdayDate.getDate() - 1)

	const filteredTransactions = devTransactions.filter((transaction: any) => {
		const [day, month, year] = transaction.date.split("/").map(Number)
		const transactionDate = new Date(year, month - 1, day)
		return (transactionDate.toDateString() === todayDate.toDateString() || transactionDate.toDateString() === yesterdayDate.toDateString())
	})
	filteredTransactions.forEach(transaction => {
		yesterdayBalance += parseFloat(transaction.amount.replace("$", "")) * -1
	})

	const balanceDifferencePercentage = (currentBalance - yesterdayBalance) / yesterdayBalance * 100



	useEffect(() => {
		if (devMode) {
			document.getElementsByTagName("html")[0].style.visibility = "visible"
			document.getElementsByTagName("body")[0].style.visibility = "visible"
			return
		} else {
			getSettings().then((settings: any) => setTheme(settings.display.theme))
			onSettingsChange((settings: any) => setTheme(settings.display.theme))
		}

		fetchNui("getDirection").then((direction: string) => setDirection(direction))

		window.addEventListener("message", (e) => {
			if (e.data?.type === "updateDirection") setDirection(e.data.direction)
		})
	}, [])

	useEffect(() => {
		if (notificationText === "") setNotificationText("Notification text")
	}, [notificationText])

	const handleButtonClick = () => {
		if (devMode) {
			console.log("Button clicked")
		}
	}

	return (
		<AppProvider>
			<div className="app" ref={appDiv} data-theme={theme}>

				<div className="bank-logo-container">
					<span className="bank-logo">
						<img alt="Bank Logo" src="https://files.catbox.moe/ya0v0y.jpeg" />
					</span>
					<span className="bank-customer-logo">
						<img alt="Customer Logo" src="https://files.catbox.moe/x9jq4o.webp" />
					</span>
				</div>
				{/* Le reste de votre application */}
				<div className="app-wrapper">
					<div className="balance-container">
						<div className="balance-title">Solde :</div>
						<div className="balance-value">
							{currentBalance.toLocaleString("en-US", { style: "currency", currency: "USD" })}
							<span className={balanceDifferencePercentage > 0 ? "positive" : "negative"}>
								{balanceDifferencePercentage > 0 ? "+" : ""}
								{balanceDifferencePercentage.toFixed(0)}%
							</span>
						</div>
						<div className="button-container">
							<Bouton onClick={handleButtonClick} Text="Transférer" Icon={FaExchangeAlt} />
							<Bouton onClick={handleButtonClick} Text="Mes factures" Icon={FaFileInvoiceDollar} />
						</div>

						<TodayStats transactions={devTransactions} />
					</div>

					

					<div className="container">
						<BalanceGraph transactions={devTransactions} currentBalance={currentBalance} />
					</div>
					<TransactionsPreview transactions={devTransactions}/>
				</div>
			</div>
		</AppProvider>
	)
}

const AppProvider: React.FC = ({ children }) => {
	if (devMode) {
		return <div className="dev-wrapper">{children}</div>
	} else return children
}

export default App
