-- Liste des hôtels qui ont hébergé M. IVANOVITCH (sinistre du 20/05/2020)
SELECT DISTINCT h.nomH, h.adrh, h.telH, h.prix
FROM Hotel h
JOIN Heberger he ON h.numH = he.numH
JOIN Sinistre s ON s.numS = he.numS
JOIN Adherent a ON a.numAdh = s.idTA
WHERE a.nomAdh = 'IVANOVITCH' AND a.prenomADH = 'Sacha' AND s.DateS = '2020-05-20';

-- Nombre total de nuitées à l'hôtel dont a bénéficié M. IVANOVITCH (sinistre du 20/05/2020)
SELECT SUM(he.nombreNuitee) AS totalNuitees
FROM Heberger he
JOIN Sinistre s ON s.numS = he.numS
JOIN Adherent a ON a.numAdh = s.idTA
WHERE a.nomAdh = 'IVANOVITCH' AND a.prenomADH = 'Sacha' AND s.DateS = '2020-05-20';

-- Liste ordonnée des trajets du rapatriement du couple BELKACEM (sinistre du 03/06/2020)
SELECT r.villeDep, r.villeArriv, r.cout, p.nomP, rp.modeTransport
FROM Rapatriement r
JOIN Necessite n ON r.numRapa = n.numRapa
JOIN Sinistre s ON s.numS = n.numS
JOIN Adherent a ON a.numAdh = s.idTA
JOIN Rapatrier rp ON rp.numRapa = r.numRapa
JOIN Partenaire p ON p.idPart = rp.idPart
WHERE a.nomAdh = 'BELKACEM' AND a.prenomADH = 'Marwan' AND s.DateS = '2020-06-03'
ORDER BY r.numOrdre;

-- Montant total dépensé pour le rapatriement du couple BELKACEM (sinistre du 03/06/2020)
SELECT SUM(r.cout) AS totalRapatriement
FROM Rapatriement r
JOIN Necessite n ON r.numRapa = n.numRapa
JOIN Sinistre s ON s.numS = n.numS
JOIN Adherent a ON a.numAdh = s.idTA
WHERE a.nomAdh = 'BELKACEM' AND a.prenomADH = 'Marwan' AND s.DateS = '2020-06-03';
