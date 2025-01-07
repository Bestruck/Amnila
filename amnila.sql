DROP DATABASE IF EXISTS amnilabdd;
CREATE DATABASE amnilabdd;
USE amnilabdd;

CREATE TABLE Region(
   IDregion CHAR(10),
   NomR VARCHAR(50),
   DépartementR VARCHAR(50),
   CONSTRAINT pk_r PRIMARY KEY(IDregion)
);

CREATE TABLE Proprietaire(
   IDproprietaire CHAR(10),
   NomP VARCHAR(20),
   PrenomP VARCHAR(20),
   RueP VARCHAR(50),
   Code_PostalP CHAR(8),
   VilleP VARCHAR(20),
   TéléphoneP CHAR(10),
   RIB CHAR(25),
   CONSTRAINT pk_p PRIMARY KEY(IDproprietaire)
);

CREATE TABLE Locataire(
   IDlocataire CHAR(10),
   NomL VARCHAR(20),
   PrenomL VARCHAR(20),
   RueL VARCHAR(50),
   Code_PostalL CHAR(8),
   VilleL VARCHAR(20),
   TéléphoneL CHAR(10),
   CONSTRAINT pk_l PRIMARY KEY(IDlocataire)
);

CREATE TABLE Station(
   IDStation CHAR(10),
   NomS VARCHAR(50),
   IDregion CHAR(10),
   CONSTRAINT pk_s PRIMARY KEY(IDStation),
   CONSTRAINT fk_r FOREIGN KEY(IDregion) REFERENCES Region(IDregion)
);

CREATE TABLE Appartement(
   IDappartement CHAR(10),
   Type_d_appartementA VARCHAR(10),
   SurfaceA VARCHAR(10),
   RueA VARCHAR(50),
   Code_PostalA CHAR(8),
   VilleA VARCHAR(20),
   N__immeubleA CHAR(5),
   IDregion CHAR(10),
   CONSTRAINT pk_ap PRIMARY KEY(IDappartement),
   CONSTRAINT fk_r FOREIGN KEY(IDregion) REFERENCES Region(IDregion)
);

CREATE TABLE Contrat(
   IDcontrat CHAR(10),
   Date_de_débutC DATE,
   Date_de_finC DATE,
   StatutC VARCHAR(10),
   IDproprietaire CHAR(10),
   IDappartement CHAR(10),
   CONSTRAINT pk_c PRIMARY KEY(IDcontrat),
   CONSTRAINT fk_p FOREIGN KEY(IDproprietaire) REFERENCES Proprietaire(IDproprietaire),
   CONSTRAINT fk_ap FOREIGN KEY(IDappartement) REFERENCES Appartement(IDappartement)
);

CREATE TABLE Reservation(
   IDreservation CHAR(10),
   Date_de_débutR DATE,
   Date_de_finR DATE,
   StatutR VARCHAR(20),
   Arrhes_payées VARCHAR(10),
   Solde_payée VARCHAR(10),
   Caution_versée VARCHAR(10),
   IDlocataire CHAR(10),
   IDappartement CHAR(10),
   CONSTRAINT pk_r PRIMARY KEY(IDreservation),
   CONSTRAINT fk_ap FOREIGN KEY(IDappartement) REFERENCES Appartement(IDappartement),
   CONSTRAINT fk_l FOREIGN KEY(IDlocataire) REFERENCES Locataire(IDlocataire)
);

CREATE TABLE Activite(
   IDactivite CHAR(10),
   NomA VARCHAR(50),
   PrixA CHAR(10),
   DescriptionA VARCHAR(50),
   IDStation CHAR(10),
   CONSTRAINT pk_a PRIMARY KEY(IDactivite),
   CONSTRAINT fk_s FOREIGN KEY(IDStation) REFERENCES Station(IDStation)
);

CREATE TABLE Equipement(
   IDequipement CHAR(10),
   Type_d_équipement VARCHAR(20),
   Détail_appart VARCHAR(50),
   IDappartement CHAR(10),
   CONSTRAINT pk_e PRIMARY KEY(IDequipement),
   CONSTRAINT fk_ap FOREIGN KEY(IDappartement) REFERENCES Appartement(IDappartement)
);

CREATE TABLE Photo(
   IDphoto CHAR(10),
   Chemin VARCHAR(50),
   DescriptionP VARCHAR(50),
   IDappartement CHAR(10),
   CONSTRAINT pk_p PRIMARY KEY(IDphoto),
   CONSTRAINT fk_ap FOREIGN KEY(IDappartement) REFERENCES Appartement(IDappartement)
);
