import React from 'react';
import './TransactionsPreview.css'; // Assurez-vous de créer ce fichier CSS
import Transaction from './Transaction';
import Transactions from './Transactions';

function TransactionsPreview({ transactions }) {

  const sortedTransactions = transactions.sort((a, b) => {
    const [dayA, monthA, yearA] = a.date.split('/').map(Number);
    const [dayB, monthB, yearB] = b.date.split('/').map(Number);
    const dateA = new Date(yearA, monthA - 1, dayA).getTime();
    const dateB = new Date(yearB, monthB - 1, dayB).getTime();
    return dateB - dateA;
  });

  return (
    <div className="transactions-preview">
      <h3>Aperçu des Transactions</h3>
      {sortedTransactions.slice(0, 5).map((transaction, index) => (
		<Transaction key={index} {...transaction} />
	  ))}
      <Transactions transactions={sortedTransactions} />
    </div>
  );
}

export default TransactionsPreview;