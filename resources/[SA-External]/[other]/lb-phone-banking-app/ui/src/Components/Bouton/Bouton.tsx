import React from 'react';
import './Bouton.css';
import { FaBeer } from 'react-icons/fa'; // Exemple d'icône, choisissez l'icône appropriée

interface BoutonProps {
	  Icon?: React.FC;
	  Text?: string;
  onClick: () => void;
}

const Bouton: React.FC<BoutonProps> = ({ Icon, Text, onClick }) => {
  return (
    <button className="button" onClick={onClick}>
      <Icon /><span>{Text}</span> {/* Affiche l'icône et le texte */}
	  
    </button>
  );
};

export default Bouton;