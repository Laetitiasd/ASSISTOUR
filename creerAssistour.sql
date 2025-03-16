USE assistour;

-- Table TechnicienAssistance
CREATE TABLE TechnicienAssistance (
    idTA INT PRIMARY KEY AUTO_INCREMENT,
    NomTA VARCHAR(250),
    prenomTA VARCHAR(250)
);

-- Table Sinistre
CREATE TABLE Sinistre (
    numS INT PRIMARY KEY AUTO_INCREMENT,
    DateS DATE,
    HeureS TIME,
    causeS VARCHAR(250),
    lieuS VARCHAR(250),
    nbrDePerso INT,
    idTA INT,
    FOREIGN KEY (idTA) REFERENCES TechnicienAssistance(idTA) ON DELETE SET NULL
);

-- Table Véhicule
CREATE TABLE Vehicule (
    immatriculation INT PRIMARY KEY AUTO_INCREMENT,
    typeV VARCHAR(250),
    modele VARCHAR(250),
    dateMiseEnCirculation DATE
);

-- Table Garage
CREATE TABLE Garage (
    numG INT PRIMARY KEY AUTO_INCREMENT,
    NomG VARCHAR(250),
    adrG VARCHAR(250),
    numTelG VARCHAR(20), -- Correction: Type INT remplacé par VARCHAR(20) pour stocker des numéros de téléphone
    prix INT,
    fond INT
);

-- Table Marque
CREATE TABLE Marque (
    numM INT PRIMARY KEY AUTO_INCREMENT,
    raisonSocial VARCHAR(250),
    NomMarque VARCHAR(250)
);

-- Table Hotel
CREATE TABLE Hotel (
    numH INT PRIMARY KEY AUTO_INCREMENT,
    nomH VARCHAR(250),
    adrh VARCHAR(250),
    telH VARCHAR(20), -- Correction: Type INT remplacé par VARCHAR(20) pour stocker des numéros de téléphone
    prix INT
);

-- Table Rapatriement
CREATE TABLE Rapatriement (
    numRapa INT PRIMARY KEY AUTO_INCREMENT,
    numOrdre INT,
    cout INT,
    villeDep VARCHAR(250),
    villeArriv VARCHAR(250)
);

-- Table Partenaire
CREATE TABLE Partenaire (
    idPart INT PRIMARY KEY AUTO_INCREMENT,
    nomP VARCHAR(250),
    horaire TIME,
    TypeTransport VARCHAR(250)
);

-- Table Adherent
CREATE TABLE Adherent (
    numAdh INT PRIMARY KEY AUTO_INCREMENT,
    nomAdh VARCHAR(250),
    prenomADH VARCHAR(250),
    adrAdh VARCHAR(250),
    codePostalAdh INT,
    villeAdh VARCHAR(250),
    telAdh VARCHAR(20) -- Correction: Type INT remplacé par VARCHAR(20) pour stocker des numéros de téléphone
);

-- Table TypeContrat
CREATE TABLE TypeContrat (
    idTypeContrat INT PRIMARY KEY AUTO_INCREMENT,
    nomTypeContrat VARCHAR(250),
    clauseContrat VARCHAR(250)
);

-- Table de relation PrendreEnCharge
CREATE TABLE PrendreEnCharge (
    numS INT,
    numG INT,
    PRIMARY KEY (numS, numG),
    FOREIGN KEY (numS) REFERENCES Sinistre(numS) ON DELETE CASCADE,
    FOREIGN KEY (numG) REFERENCES Garage(numG) ON DELETE CASCADE
);

-- Table de relation Heberger
CREATE TABLE Heberger (
    numS INT,
    numH INT,
    nombreNuitee INT,
    PRIMARY KEY (numS, numH),
    FOREIGN KEY (numS) REFERENCES Sinistre(numS) ON DELETE CASCADE,
    FOREIGN KEY (numH) REFERENCES Hotel(numH) ON DELETE CASCADE
);

-- Table de relation Necessite
CREATE TABLE Necessite (
    numS INT,
    numRapa INT,
    PRIMARY KEY (numS, numRapa),
    FOREIGN KEY (numS) REFERENCES Sinistre(numS) ON DELETE CASCADE,
    FOREIGN KEY (numRapa) REFERENCES Rapatriement(numRapa) ON DELETE CASCADE
);

-- Table de relation Rapatrier
CREATE TABLE Rapatrier (
    numRapa INT,
    idPart INT,
    modeTransport VARCHAR(250),
    PRIMARY KEY (numRapa, idPart),
    FOREIGN KEY (numRapa) REFERENCES Rapatriement(numRapa) ON DELETE CASCADE,
    FOREIGN KEY (idPart) REFERENCES Partenaire(idPart) ON DELETE CASCADE
);

-- Table de relation AvoirVehicule
CREATE TABLE AvoirVehicule (
    immatriculation INT,
    numM INT,
    PRIMARY KEY (immatriculation, numM),
    FOREIGN KEY (immatriculation) REFERENCES Vehicule(immatriculation) ON DELETE CASCADE,
    FOREIGN KEY (numM) REFERENCES Marque(numM) ON DELETE CASCADE
);

-- Table de relation AvoirGarage
CREATE TABLE AvoirGarage (
    numG INT,
    numM INT,
    PRIMARY KEY (numG, numM),
    FOREIGN KEY (numG) REFERENCES Garage(numG) ON DELETE CASCADE,
    FOREIGN KEY (numM) REFERENCES Marque(numM) ON DELETE CASCADE
);

-- Table de relation Souscrire
CREATE TABLE Souscrire (
    idTypeContrat INT,
    numAdh INT,
    NegocierPrix INT,
    PRIMARY KEY (idTypeContrat, numAdh),
    FOREIGN KEY (idTypeContrat) REFERENCES TypeContrat(idTypeContrat) ON DELETE CASCADE,
    FOREIGN KEY (numAdh) REFERENCES Adherent(numAdh) ON DELETE CASCADE
);
