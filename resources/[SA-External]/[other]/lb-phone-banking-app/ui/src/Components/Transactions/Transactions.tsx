import React, { useState, useEffect } from 'react';
import Transaction from './Transaction';
import './Transactions.css'; // Assurez-vous de créer ce fichier CSS
import { IoMdClose } from 'react-icons/io';
import { FaFilterCircleXmark } from 'react-icons/fa6';



function Transactions({transactions}) {
  const [isVisible, setIsVisible] = useState(false);
  const [filter, setFilter] = useState("");
  const [filteredTransactions, setFilteredTransactions] = useState([]);

  const openTransactions = () => {
    setIsVisible(true); // Affiche le conteneur
  };

  const closeTransactions = () => {
    setIsVisible(false);
  };

  useEffect(() => {
    let result = transactions;
    console.log("Filter", filter)
    if (filter === "" || filter === null || filter === undefined) {
      setFilteredTransactions(result)
      return
    }

    // Filtrer les transactions (Object)
    result = transactions.filter(transaction => {
      // Remplacez `transactionField` par le champ réel de votre objet transaction à comparer
      return transaction.title.toLowerCase().includes(filter.toLowerCase()) || transaction.description.toLowerCase().includes(filter.toLowerCase()) || transaction.amount.toLowerCase().includes(filter.toLowerCase()) || transaction.date.toLowerCase().includes(filter.toLowerCase());
    });

    setFilteredTransactions(result);
  }, [isVisible, filter]);

  return (
    <>
      <button onClick={openTransactions}>Voir plus</button>
      <>
        <div className="transactions-background" style={{ display: isVisible ? "block" : 'none' }}>
          {/* Ajoutez un overlay pour empêcher les interactions pendant l'animation */}
        </div>
        <div className="transactions-container" style={{ transform: isVisible ? 'translateY(0)' : 'translateY(110%)' }}>
              <div className="transactions-header">
                <h3>Transactions</h3>
                <IoMdClose onClick={closeTransactions}/>
              </div>
              <div className='transactions-header'>
                <input type="text" placeholder="Rechercher une transaction" value={filter} onChange={(e) => setFilter(e.target.value)} />
                <FaFilterCircleXmark onClick={() => setFilter("")}/>
              </div>
            {filteredTransactions.map((transaction, index) => (
              <React.Fragment key={transaction.id}>
                {(index === 0 || (index > 0 && transaction.date !== filteredTransactions[index - 1].date)) && (
                  <div className="transaction-separator">{transaction.date}</div>
                )}
                <Transaction date={transaction.date} Icon={transaction.Icon} title={transaction.title} description={transaction.description} amount={transaction.amount} />
              </React.Fragment>
            ))}
        </div>
        </>
    </>
  );
}

export default Transactions;