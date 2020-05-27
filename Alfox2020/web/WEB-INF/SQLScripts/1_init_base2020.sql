
drop schema if exists alfox2020;
create schema alfox2020;
use alfox2020;

CREATE TABLE Responsable (
    ID int(10) NOT NULL AUTO_INCREMENT, 
    Mdp varchar(255), 
    Mail varchar(255), 
    PRIMARY KEY (ID)
);

CREATE TABLE Vehicule (
    ID int(10) NOT NULL AUTO_INCREMENT, 
    Marque varchar(255), 
    Modele varchar(255), 
    Immatriculation varchar(255) NOT NULL UNIQUE, 
    Motorisation varchar(255), 
    DateMiseEnService timestamp NULL, 
    HorsZone tinyint(3), 
    TauxUtilisation int(10), 
    KilometrageReel decimal(10, 3), 
    KilometrageCumule decimal(10, 3),
    KmVidange int(10), 
    DateDernierControle timestamp NULL, 
    DateDerniereVidange timestamp NULL, 
    DateControleTechnique timestamp NULL,
    GroupeID int(10) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE DonneesTR (
    ID int(10) NOT NULL AUTO_INCREMENT, 
    SeqNumber int(10), 
    Datation timestamp NULL, 
    Vitesse int(10), 
    VitesseMax int(10), 
    LatitudeGPS decimal(10, 6), 
    LongitudeGPS decimal(10, 6),
    Radius int(10),
    DistanceParcourueDepuisReset bigint(20), 
    VehiculeID int(10) NOT NULL, 
    PRIMARY KEY (ID)
);

CREATE TABLE Boitier (
    SigfoxID varchar(255) NOT NULL, 
    ModeEncours varchar(255), 
    Parking bit(1) NOT NULL, 
    GPSActif bit(1) NOT NULL, 
    VehiculeID int(10) NOT NULL, 
    PRIMARY KEY (SigfoxID)
);

CREATE TABLE ZoneLimite (
    ID int(10) NOT NULL AUTO_INCREMENT, 
    Nom varchar(255) NOT NULL, 
    Zoom int(10) NOT NULL, 
    PRIMARY KEY (ID)
);

CREATE TABLE Position (
    ID int(10) NOT NULL AUTO_INCREMENT, 
    Ordre int(10) NOT NULL, 
    Latitude decimal(10, 6) NOT NULL, 
    Longitude decimal(10, 6) NOT NULL, 
    ZoneLimiteID int(10) NOT NULL, 
    PRIMARY KEY (ID)
);

CREATE TABLE Groupe (
    ID int(10) NOT NULL AUTO_INCREMENT, 
    Nom varchar(255) NOT NULL, 
    Infos varchar(255), 
    ZoneLimiteID int(10) NOT NULL, 
    PRIMARY KEY (ID)
);

ALTER TABLE Position ADD CONSTRAINT FKPosition217606 FOREIGN KEY (ZoneLimiteID) REFERENCES ZoneLimite (ID);
ALTER TABLE Groupe ADD CONSTRAINT FKGroupe827826 FOREIGN KEY (ZoneLimiteID) REFERENCES ZoneLimite (ID);
ALTER TABLE Vehicule ADD CONSTRAINT FKVehicule610678 FOREIGN KEY (GroupeID) REFERENCES Groupe (ID);
ALTER TABLE Boitier ADD CONSTRAINT FKBoitier302509 FOREIGN KEY (VehiculeID) REFERENCES Vehicule (ID);
ALTER TABLE DonneesTR ADD CONSTRAINT FKDonneesTR404677 FOREIGN KEY (VehiculeID) REFERENCES Vehicule (ID);

# ----------------------------------------------------------------------------
#                   initialisation avec des données de test
# ----------------------------------------------------------------------------
insert into Responsable (Mdp, Mail) values 
    ('636D61CF9094A62A81836F3737D9C0DA','responsable@gmail.com');


insert into ZoneLimite (Nom, Zoom) values
    ('Alcis', 4),
    ('Toulouse', 3),
    ('GrandSud', 2),
    ('France', 1);

insert into Position (ordre, latitude, longitude, ZoneLimiteID) values
    (1, 43.604014, 1.526581, 1),
    (2, 43.601590, 1.524203, 1),
    (3, 43.600355, 1.528461, 1),
    (4, 43.601920, 1.530292, 1),
    (1, 44.087321, 1.338782, 2),
    (2, 43.982670, 1.790594, 2),
    (3, 43.798589, 2.073492, 2),
    (4, 43.596040, 2.320685, 2),
    (5, 43.238933, 2.504706, 2),
    (6, 42.917949, 1.999335, 2),
    (7, 42.859591, 1.400580, 2),
    (8, 43.060593, 0.697455, 2),
    (9, 43.474581, 0.494208, 2),
    (10, 43.818410, 0.785346, 2),
    (1, 41.459000, 3.620000, 3),
    (2, 43.461915, -2.181781, 3),
    (3, 45.376139, -1.233385, 3),
    (4, 44.100030, 4.945026, 3),
    (1, 51.231112, 2.035541, 4),
    (2, 48.3690077, -5.693126, 4),
    (3, 43.359731, -2.249526, 4),
    (4, 41.459000, 3.620000, 4),
    (5, 43.000000, 8.361000, 4),
    (6, 46.437377, 6.842785, 4),
    (7, 49.000000, 8.500000, 4);

insert into Groupe (Nom, Infos, ZoneLimiteID) values
    ('Alcis', 'Non utilise', 1),
    ('Toulouse', 'Toulouse uniquement', 2),
    ('GrandSud', 'Toute la région Occitanie', 3),
    ('France', 'Toute la France', 4);

insert into Vehicule (Marque, Modele, Immatriculation, Motorisation,
            DateMiseEnService, HorsZone, TauxUtilisation, KilometrageReel, 
            KilometrageCumule, KmVidange, DateDernierControle, 
            DateDerniereVidange, DateControleTechnique, GroupeID) values
    ('Renault', 'Talisman', 'ED-592-CY', 'Diesel', '2018/01/01', false, 10, 40787.231, 0, 55000, '2019/10/03', '2020/01/03', '2024/01/01', 2),
    ('Renault', 'Talisman', 'ED-593-VS', 'Diesel', '2018/01/01', true, 12, 76618.25, 0, 80000, '2019/10/03', '2020/01/03', '2024/01/01', 2),
    ('Renault', 'Talisman', 'EE-239-QM', 'Diesel', '2018/01/01', false, 14, 112201.76, 0,15000, '2019/10/03', '2020/01/03', '2024/01/01', 3),
    ('Mercedes', 'Vito', 'EE-300-QM', 'Diesel', '2018/01/01', true, 21, 82700.098, 0, 100000, '2019/10/03', '2020/01/03', '2024/01/01', 2),
    ('Mercedes', 'Vito', 'EK-462-GX', 'Diesel', '2018/01/01', false, 14, 66320.393, 0, 78000, '2019/10/03', '2020/01/03', '2024/01/01', 2),
    ('Mercedes', 'Vito', 'EM-045-BC', 'Diesel', '2018/01/01', true, 35, 67791.992, 0, 80000, '2019/10/03', '2020/01/03', '2024/01/01', 4),
    ('Mercedes', 'Vito', 'EM-150-BE', 'Diesel', '2018/01/01', false, 23, 32778.123, 0, 37000, '2019/10/03', '2020/01/03', '2024/01/01', 3),
    ('Mercedes', 'Vito', 'EM-862-ML', 'Diesel', '2018/01/01', true, 31, 51826.920, 0, 60000, '2019/10/03', '2020/01/03', '2024/01/01', 4);

insert into Boitier (SigfoxID, ModeEncours, Parking, GPSActif, VehiculeID) values
    ('1D2289', 'NORMAL', false, true, 1),
    ('1D188E', 'NORMAL', false, true, 2),
    ('2E1233', 'NORMAL', false, true, 3),
    ('3R5894', 'NORMAL', false, true, 4),
    ('4A9203', 'NORMAL', true, true, 5),
    ('5Q3729', 'NORMAL', false, true, 6),
    ('7A0022', 'NORMAL', true, true, 7),
    ('8B2884', 'NORMAL', false, true, 8);

insert into DonneesTR ( Datation, Vitesse, VitesseMax, LatitudeGPS, LongitudeGPS, 
        Radius, DistanceParcourueDepuisReset, SeqNumber, VehiculeID) values
    ('2020/04/20 00:00:00', 24,  24, 57.761382,  11.700803, 0, 2550, 20, 1 ),
    ('2020/04/20 00:10:00', 22,  22, 19.368961,  33.811088, 0, 3264, 14, 2),
    ('2020/04/20 00:20:00', 32,  32, 40.283732,  59.196649, 0, 1203, 15, 3), 
    ('2020/04/20 00:30:00', 43,  77, 39.836279,  48.398641, 0, 5432, 13, 3),
    ('2020/04/20 00:40:00', 28,  30, 39.495084,  25.329905, 0, 504,   1, 4), 
    ('2020/04/20 00:50:00', 45,  45, 42.870164,  17.555737, 0, 9120,  9, 5),
    ('2020/04/20 01:00:00', 70, 119, 51.210434,  34.768429, 0, 6729,  2, 6), 
    ('2020/04/20 01:10:00', 26,  26, 43.593468,   1.414471, 0, 1234, 18, 7),
    ('2020/04/21 01:10:00', 26,  26, 43.593468,   1.414471, 0, 1234, 18, 7),
    ('2020/04/23 01:10:00', 26,  26, 43.593468,   1.414471, 0, 1234, 18, 7),
    ('2020/04/30 01:10:00', 26, 150, 43.593468,   1.414471, 0, 1234, 18, 7),
    ('2020/04/01 01:10:00', 26,  26, 43.593468,   1.414471, 0, 1234, 18, 7),
    ('2020/04/02 01:10:00', 26,  26, 43.593468,   1.414471, 0, 1234, 18, 7),
    ('2020/04/07 01:10:00', 26,  26, 43.593468,   1.414471, 0, 1234, 18, 7),
    ('2020/05/01 23:59:59', 26, 150, 43.593468,   1.414471, 0, 1234, 18, 7),
    ('2020/05/02 01:10:00', 26,  26, 43.593468,   1.414471, 0, 1234, 18, 7),
    ('2020/05/02 10:10:00', 26,  26, 43.593468,   1.414471, 0, 1234, 18, 7),
    ('2020/05/03 00:10:00', 26,  26, 43.593468,   1.414471, 0, 1234, 18, 7);

# -----------------------------------------------------------------------
#    crée les autorisation du user local pour l'accés du serveur à la BD
# -----------------------------------------------------------------------

use alfox2020;

drop user alfox2020@localhost;
create user alfox2020@localhost identified by 'alfox31';

grant  select,insert,update,delete on alfox2020.* to alfox2020@localhost identified by 'alfox31';