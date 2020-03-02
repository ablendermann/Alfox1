drop schema if exists alfox2020;
create schema alfox2020;
use alfox2020;

CREATE TABLE DonneesTR (
  ID                           int(10) NOT NULL AUTO_INCREMENT, 
  SeqNumber                    int(10), 
  Datation                     timestamp NOT NULL, 
  VitesseMoyenne               int(10) NOT NULL, 
  VitesseMax                   int(10), 
  Latitude                     float NOT NULL, 
  Longitude                    float NOT NULL, 
  Radius                       int(10), 
  DistanceParcourueDepuisReset bigint(20) NOT NULL, 
  VehiculeImmatriculation      varchar(255) NOT NULL, 
  PRIMARY KEY (ID));

CREATE TABLE Position (
  ID           int(10) NOT NULL AUTO_INCREMENT, 
  Ordre        int(10) NOT NULL, 
  Latitude     float NOT NULL, 
  Longitude    float NOT NULL, 
  ZoneLimiteID int(10) NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE UserAlcis (
  ID   int(10) NOT NULL AUTO_INCREMENT, 
  Role varchar(255) NOT NULL, 
  Mdp  varchar(255) NOT NULL, 
  Mail varchar(255) NOT NULL, 
  PRIMARY KEY (ID));

CREATE TABLE Vehicule (
  Immatriculation   varchar(255) NOT NULL, 
  SigfoxID          varchar(25) NOT NULL, 
  SigfoxPAC         varchar(25) NOT NULL, 
  DateMiseEnService timestamp NULL, 
  KilometrageReel   decimal(19, 0) NOT NULL, 
  KilometrageCumule decimal(19, 0) NOT NULL, 
  HorsZone          bit(1) NOT NULL, 
  Parking           bit(1) NOT NULL, 
  ZoneLimiteID      int(10) NOT NULL, 
  PRIMARY KEY (Immatriculation));
CREATE TABLE ZoneLimite (
  ID  int(10) NOT NULL AUTO_INCREMENT, 
  Nom varchar(255) NOT NULL, 
  PRIMARY KEY (ID));
ALTER TABLE Position ADD CONSTRAINT FKPosition217606 FOREIGN KEY (ZoneLimiteID) REFERENCES ZoneLimite (ID);
ALTER TABLE DonneesTR ADD CONSTRAINT FKDonneesTR526142 FOREIGN KEY (VehiculeImmatriculation) REFERENCES Vehicule (Immatriculation);
ALTER TABLE Vehicule ADD CONSTRAINT FKVehicule343196 FOREIGN KEY (ZoneLimiteID) REFERENCES ZoneLimite (ID);



# ----------------------------------------------------------------------------
#                   initialisation avec des données de test
# ----------------------------------------------------------------------------
insert into UserAlcis (Role, Mdp, Mail) values 
    ('responsable','636D61CF9094A62A81836F3737D9C0DA','responsable@gmail.com');


insert into ZoneLimite (Nom) values
    ('Alcis'),
    ('Toulouse'),
    ('GrandSud'),
    ('France');


insert into Vehicule (Immatriculation, DateMiseEnService, HorsZone, KilometrageReel,Parking,KilometrageCumule, SigfoxID, SigfoxPAC,ZoneLimiteID) values
    ('ED-592-CY', '2018/01/01', false, 40787,false,52222,'001D22BD','3C96B301B99F0BC1',1),
    ('ED-593-VS', '2018/01/01', true, 76618,false,90000,'002D22BD','3C96B301B99F0BC2',2),
    ('EE-239-QM', '2018/01/01', false, 112201,true,90900,'003D22BD','3C96B301B99F0BC3',3),
    ('EE-300-QM', '2018/01/01', true, 82700,false,80000,'004D22BD' ,'3C96B301B99F0BC4',4),
    ('EK-462-GX', '2018/01/01', false, 66320,false,50000,'005D22BD','3C96B301B99F0BC5',1),
    ('EM-045-BC', '2018/01/01', true, 67791,false,60000,'006D22BD','3C96B301B99F0BC6',2),
    ('EM-150-BE', '2018/01/01', false, 32778,false,60000,'007D22BD','3C96B301B99F0BC7',3),
    ('EM-862-ML', '2018/01/01', true, 51826,true,70000,'008D22BD','3C96B301B99F0BC8',4);
    



insert into Position (ordre, ZoneLimiteID, latitude, longitude) values
    (1, 1, 43.604014, 1.526581),
    (2, 1, 43.601590, 1.524203),
    (3, 1, 43.600355, 1.528461),
    (4, 1, 43.601920, 1.530292),
    (1, 2, 44.087321, 1.338782),
    (2, 2, 43.982670, 1.790594),
    (3, 2, 43.798589, 2.073492),
    (4, 2, 43.596040, 2.320685),
    (5, 2, 43.238933, 2.504706),
    (6, 2, 42.917949, 1.999335),
    (7, 2, 42.859591, 1.400580),
    (8, 2, 43.060593, 0.697455),
    (9, 2, 43.474581, 0.494208),
    (10, 2, 43.818410, 0.785346),
    (1, 3, 41.459000, 3.620000),
    (2, 3, 43.461915, -2.181781),
    (3, 3, 45.376139, -1.233385),
    (4, 3, 44.100030, 4.945026),
    (1, 4, 51.231112, 2.035541),
    (2, 4, 48.3690077, -5.693126),
    (3, 4, 43.359731, -2.249526),
    (4, 4, 41.459000, 3.620000),
    (5, 4, 43.000000, 8.361000),
    (6, 4, 46.437377, 6.842785),
    (7, 4, 49.000000, 8.500000);

insert into DonneesTR ( Datation, VitesseMoyenne,VitesseMax, Radius,Latitude, Longitude, DistanceParcourueDepuisReset,
                         SeqNumber, VehiculeImmatriculation) values
    ('2018/03/20 00:00:00', 135,  24, 0, 57.761382,  11.700803,  20,  1,'ED-592-CY' ),
    ('2018/03/20 00:10:00', 112,  22, 0, 19.368961,  33.811088,   16,  2, 'ED-593-VS'),
    ('2018/03/20 00:20:00', 136,  32, 0, 40.283732,  59.196649,  15,  3, 'EE-239-QM'), 
    ('2018/03/20 00:30:00', 77,  43, 0, 39.836279,  48.398641,  13,  4,'EE-300-QM' ),
    ('2018/03/20 00:40:00', 28,  30, 0,39.495084,  25.329905,    1,  5, 'EK-462-GX'), 
    ('2018/03/20 00:50:00', 110, 45, 0,42.870164,  17.555737,   9,  6, 'EM-045-BC'),
    ('2018/03/20 01:00:00', 119, 70, 0,51.210434,  34.768429  , 2,  7, 'EM-150-BE'), 
    ('2018/03/20 01:10:00', 26,  150, 0,43.593468,   1.414471,  18,  8,'EM-862-ML' );