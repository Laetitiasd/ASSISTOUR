-- Insérer les techniciens d'assistance
INSERT INTO TechnicienAssistance (NomTA, prenomTA) VALUES
('BENTOU', 'Olivia');

-- Insérer les adhérents
INSERT INTO Adherent (nomAdh, prenomADH, adrAdh, codePostalAdh, villeAdh, telAdh) VALUES
('IVANOVITCH', 'Sacha', '14 boulevard du Temple', 75003, 'Paris', '06-92-88-29-53'),
('BELKACEM', 'Marwan', '2 rue Maspero', 75016, 'Paris', '06-73-93-99-05');

-- Insérer les types de contrat
INSERT INTO TypeContrat (nomTypeContrat, clauseContrat) VALUES
('Plénitude', 'Contrat premium couvrant tous les dommages'),
('Tous Risques ECO', 'Contrat économique couvrant les risques majeurs');

-- Associer les contrats aux adhérents
INSERT INTO Souscrire (idTypeContrat, numAdh, NegocierPrix) VALUES
(1, 1, 0),
(2, 2, 0);

-- Insérer les marques de voiture
INSERT INTO Marque (raisonSocial, NomMarque) VALUES
('Citroën', 'C3'),
('Renault', 'Kadjar'),
('Renault', 'Koleos');

-- Insérer les véhicules
INSERT INTO Vehicule (typeV, modele, dateMiseEnCirculation) VALUES
('Tourisme', 'C3', '2003-04-15'),
('Tourisme', 'Kadjar', '2019-10-10'),
('Tourisme', 'Koleos', '2020-01-03');

-- Associer les véhicules aux marques
INSERT INTO AvoirVehicule (immatriculation, numM) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insérer les sinistres
INSERT INTO Sinistre (DateS, HeureS, causeS, lieuS, nbrDePerso, idTA) VALUES
('2020-05-20', '13:27:00', 'Somnolence au volant', 'Route D2, 2km de Dinan (22100)', 1, 1),
('2020-06-03', '19:30:00', 'Collision avec un poids lourd', 'Route N145, Saint Vaury (23320)', 2, 1);

-- Insérer les garages
INSERT INTO Garage (NomG, adrG, numTelG, prix, fond) VALUES
('Garage De La Sansonnais', 'Rue du Général De Gaulle, 22100 LANVALLAY', '02-96-85-40-98', 210, 0),
('Garage Citroën Guéret', '22 Rue du Marechal Leclerc, 23000', '05-55-52-48-52', 190, 0);

-- Associer les sinistres aux garages
INSERT INTO PrendreEnCharge (numS, numG) VALUES
(1, 1),
(2, 2);

-- Insérer les hôtels
INSERT INTO Hotel (nomH, adrh, telH, prix) VALUES
('Hôtel du Théâtre', '2 rue Sainte Claire, Dinan', '02-96-39-06-91', 65),
('Hôtel Océan', '9 place du 11 novembre 1918, Dinan', '02-96-85-43-61', 79);

-- Associer les hôtels aux sinistres
INSERT INTO Heberger (numS, numH, nombreNuitee) VALUES
(1, 1, 4),
(1, 2, 1);

-- Insérer les rapatriements
INSERT INTO Rapatriement (numOrdre, cout, villeDep, villeArriv) VALUES
(1, 22, 'Saint Vaury', 'Guéret'),
(2, 23.80, 'Guéret', 'Limoges'),
(3, 68, 'Limoges', 'Paris-Austerlitz');

-- Associer les sinistres aux rapatriements
INSERT INTO Necessite (numS, numRapa) VALUES
(2, 1),
(2, 2),
(2, 3);

-- Insérer les partenaires de transport
INSERT INTO Partenaire (nomP, horaire, TypeTransport) VALUES
('BATY TAXI', '00:00:00', 'Taxi'),
('SNCF', '00:00:00', 'Train TER'),
('SNCF', '00:00:00', 'Intercites');

-- Associer les rapatriements aux partenaires
INSERT INTO Rapatrier (numRapa, idPart, modeTransport) VALUES
(1, 1, 'Taxi'),
(2, 2, 'Train TER'),
(3, 3, 'Intercites');
