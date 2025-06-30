import React from 'react';
import './Transaction.css'; // Assurez-vous de créer ce fichier CSS



function Transaction({ date, Icon, title, description, amount }) {
  return (
    <div className="transaction">
		<div className="transaction-icon">
		<Icon />
		</div>
      <div className="transaction-details">
        <h4>{title}</h4>
      </div>
	  {/* Afficher la date ici. Utilisez `formattedDate` si vous avez formaté la date */}
	  <div className="transaction-details" style={{alignItems: 'flex-end'}}>
    	  <div className="transaction-amount">{amount}</div>
		  </div>
    </div>
  );
}

export default Transaction;