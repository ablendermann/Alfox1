/*
 * Projet  : Alfox2020
 * Fichier : DonneesTR.java
 * Description : Classe interface de la table donneesTR
 * Cette table stocke les données TR obtenues par message SIGFOX
 *
 * Pb : l'enregistrement est réalisé en 2 temps :
 *      1. on recoit les datas du message
 *      2. on reçoit la position GPS
 *      Si la position GPS est nulle on récupère la position Sigfox Atlas 
 *      de l'origine du message.
 *
 */
package com.persistence;

import java.sql.*;
import java.util.ArrayList;
import javax.xml.bind.annotation.adapters.HexBinaryAdapter;

public class DonneesTR {
    private int SeqNumber;
    private Timestamp Datation;
    private int Vitesse; 
    private int VitesseMax;
    private double LatitudeGPS; 
    private double LongitudeGPS;
    private int Radius;
    private long DistanceParcourueDepuisReset;
    private int VehiculeID;

    /**
     * Créer un nouvel objet DonneesTR persistant
     *
     * @param con
     * @return
     * @ return retourne une donneesTR si la date est unique sinon null
     * @throws Exception impossible d'accéder à la ConnexionMySQL ou la date est
     * deja dans la BD
     */
    static public DonneesTR create(Connection con, int SeqNumber,
            Timestamp Datation, int Vitesse, int VitesseMax,
            double LatitudeGPS, double LongitudeGPS, int Radius,
            long DistanceParcourueDepuisReset, int VehiculeID) throws Exception {
        // instanciation de l'objet avec les données initiales
        DonneesTR donneesTR = new DonneesTR(SeqNumber, Datation,
                Vitesse, VitesseMax, LatitudeGPS, LongitudeGPS, Radius,
                DistanceParcourueDepuisReset, VehiculeID);
        // la sauvegarde est maintenant faite dans save()
        // pour une création ou une mise à jour
        donneesTR.save(con);
        return donneesTR;
    }

    /**
     * suppression de l'objet donneesTR dans la BD
     *
     * @param con
     * @return
     * @throws SQLException impossible d'accéder à la ConnexionMySQL
     */
    public boolean delete(Connection con) throws Exception {
        String queryString = "delete from donneesTR"
                                    + " where Datation = '" + Datation + "' "
                                    + " and VehiculeID = " + VehiculeID;
        Statement lStat = con.createStatement();
        lStat.executeUpdate(queryString);
        return true;
    }

    /**
     * update de l'objet donneesTR dans la ConnexionMySQL
     *
     * @param con
     * @throws Exception impossible d'accéder à la ConnexionMySQL
     */
    public void save(Connection con) throws Exception {
        String queryString = "";
        // je regarde d'abord si l'enregistrement existe déjà pour ce message
        queryString = "select ID, Mode from donneesTR "
                + " where Datation = '" + Datation + "' "
                + " and VehiculeID = " + VehiculeID;
        Statement lStat = con.createStatement(
                ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        // si il existe, on l'update par l'ID
        if (lResult.next()) {
            int id = lResult.getInt("ID");
            queryString = "update donneesTR set "
                + " SeqNumber =" + Utils.toString(SeqNumber) + ","
                + " Vitesse =" + Utils.toString(Vitesse) + ","
                + " VitesseMax =" + Utils.toString(VitesseMax) + ","
                + " LatitudeGPS =" + Utils.toString(LatitudeGPS) + ","
                + " LongitudeGPS =" + Utils.toString(LongitudeGPS) + ","
                + " DistanceParcourue =" + Utils.toString(DistanceParcourueDepuisReset)
                + " where ID=" + id;
        }
        lStat = con.createStatement();
        lStat.executeUpdate(queryString, Statement.NO_GENERATED_KEYS);
    }

    /**
     * Sauvegarde des datas du message Sigfox DATA
     * @param con
     * @param sigfoxID
     * @param SeqNumber
     * @param Datation
     * @param data
     * @return 
     * @throws Exception 
     */
    public static String saveData(Connection con, String sigfoxID, 
            int SeqNumber, Timestamp Datation, String data) throws Exception {
        long DistanceParcourueDepuisReset = 0L;
        
        Boitier boitier = Boitier.getBySigfoxID(con, sigfoxID);
        if (boitier == null) {
            return "ERREUR";
        }
        int VehiculeID = boitier.getVehiculeID();
        
        // conversion de la chaine hexa en tableau de byte
        HexBinaryAdapter adapter = new HexBinaryAdapter();
        byte[] bData = adapter.unmarshal(data);

        int mode = bData[0] & 0x0F;
        switch (mode) {
            case 0 :
                // GPS4 : IM VM L1 L1 G1 G1 L2 G2 L3 G3 L4 G4
                // 4 positions GPS
                int Vitesse = bData[1];
                if (Vitesse < 0) {
                    Vitesse = 256 + Vitesse;
                }
                // decodage de la 1er position (entier vers réel)
                double L1  = 4.0*(bData[2] << 8 & bData[3])/10000 + 36;
                double G1 = 4.0*(bData[4] << 8 & bData[5])/10000 - 10;
                // décodage de la 2e position relative à la 1er
                double L2 = bData[6]/1000.0 - 0.127 + L1;
                double G2 = bData[7]/1000.0 - 0.127 + G1;
                double L3 = bData[6]/1000.0 - 0.127 + L2;
                double G3 = bData[7]/1000.0 - 0.127 + G2;
                double L4 = bData[6]/1000.0 - 0.127 + L3;
                double G4 = bData[7]/1000.0 - 0.127 + G3;
                // une position GPS toutes les 4mn
                // Sauvegarde des données
                // Position il y a 12mn
                Timestamp date4 = new Timestamp(Datation.getTime() + 3*4*60*1000);
                DonneesTR.create(con, SeqNumber, date4, Vitesse, 0, 
                                                    L4, G4, 0, 0L, VehiculeID);
                // Position il y a 8mn
                Timestamp date3 = new Timestamp(Datation.getTime() + 2*4*60*1000);
                DonneesTR.create(con, SeqNumber, date3, Vitesse, 0, 
                                                    L3, G3, 0, 0L, VehiculeID);
                // Position il y a 4mn
                Timestamp date2 = new Timestamp(Datation.getTime() + 4*60*1000);
                DonneesTR.create(con, SeqNumber, date2, Vitesse, 0, 
                                                    L2, G2, 0, 0L, VehiculeID);
                // Position actuelle
                DonneesTR.create(con, SeqNumber, Datation, Vitesse, 0, 
                                                    L1, G1, 0, 0L, VehiculeID);
                break;
            case 1 :
                // PARKING : IM L1 L2 L3 L4 G1 G2 G3 G4 00 00 00
                // le véhicule est garé : une seule position GPS mais plus précise
                double LatGPS = 
                        (((bData[1] & 0xFF) << 24) | ((bData[2] & 0xFF) << 16)
                      | ((bData[3] & 0xFF) <<  8) | (bData[4] & 0xFF))/1000000;
                double LongGPS = 
                        (((bData[5] & 0xFF) << 24) | ((bData[6] & 0xFF) << 16)
                      | ((bData[7] & 0xFF) <<  8) | (bData[8] & 0xFF))/1000000;
                LongGPS -= 10;      // peut redevenir négatif
                DonneesTR.create(con, SeqNumber, Datation, 0, 0, 
                                        LatGPS, LongGPS, 0, 0L, VehiculeID);
                break;
            case 2 :
                // DISTANCE : IM K1 K2 K3 K4 VX 00 00 00 00 00 00
                // kilométrage total + VitesseMax + 
                DistanceParcourueDepuisReset = 
                        ((bData[1] & 0xFF) << 24) | ((bData[2] & 0xFF) << 16)
                      | ((bData[3] & 0xFF) <<  8) | (bData[4] & 0xFF);
                int VitesseMax = bData[5];
                DonneesTR.create(con, SeqNumber, Datation, 0, VitesseMax, 
                        0.0, 0.0, 0, DistanceParcourueDepuisReset, VehiculeID);
                break;
        }
        return "OK";
    }
    
    /**
     * Sauvegarde des informations sur le signal et la géolocalisation SIGFOX
     *    du message GEOLOC
     * @param con
     * @param sigfoxID
     * @param SeqNumber
     * @param Datation
     * @param snr
     * @param rssi
     * @param avgSnr
     * @param radius
     * @param latitudeSigfox
     * @param longitudeSigfox
     * @throws Exception 
     */
    public static void saveGeo(Connection con, String sigfoxID, int SeqNumber,
        Timestamp Datation, double snr, double rssi, double avgSnr, int radius,
        double latitudeSigfox, double longitudeSigfox) throws Exception {
/*
        Boitier boitier = Boitier.getByID(con, sigfoxID);
        if (boitier == null) {
            // le boitier n'existe pas !!!
            return;
        }
        int VehiculeID = boitier.getVehiculeID();

        create(con, "GEO", SeqNumber, Datation,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, 0.0,
            snr, rssi, avgSnr, radius,
            latitudeSigfox, longitudeSigfox, 0, VehiculeID);
*/
    }
    
    public static DonneesTR getLastByVehiculeID(Connection con,
              int vehiculeid) throws Exception {
        String queryString = "select * from donneesTR"
            + " where VehiculeID='" + vehiculeid 
            + "' order by Datation desc limit 1";
        Statement lStat = con.createStatement(
                                ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        // y en a t'il au moins un ?
        if (lResult.next()) {
            return creerParRequete(lResult);
        }
        else
            return null;
    }

    /**
     * Retourne une donneesTR trouve par sa date, saved is true
     *
     * @param con
     * @param immatriculation date de donneesTR a trouver
     * @return donneesTR trouv" par immatriculation
     * @throws java.lang.Exception
     */
    public static DonneesTR getLastByImmatriculation(Connection con,
            String immatriculation) throws Exception {
        String queryString = "select * from donneesTR,vehicule"
                + " where Immatriculation = '" + immatriculation + "'"
                + " and vehicule.ID = donneesTR.VehiculeID"
                + " order by Datation desc limit 1";
        Statement lStat = con.createStatement(
                ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        // y en a t'il au moins un ?
        if (lResult.next()) {
            return creerParRequete(lResult);
        } else {
            return null;
        }
    }
    
    /**
     * Retourne une donneesTR trouve par sa date, saved is true
     *
     * @param con
     * @param immatriculation date de donneesTR a trouver
     * @return donneesTR trouvées par immatriculation
     * @throws java.lang.Exception
     */
    public static ArrayList<DonneesTR> getByImmatriculation(Connection con,
            String immatriculation) throws Exception {
        String queryString = "select * from donneesTR,vehicule"
                + " where Immatriculation = '" + immatriculation + "'"
                + " and vehicule.ID = donneesTR.VehiculeID"
                + " order by Datation desc limit 1";
        Statement lStat = con.createStatement(
                ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        ArrayList<DonneesTR> lesDonneesTR = new ArrayList<>();
        // y en a t'il au moins un ?
        while (lResult.next()) {
             lesDonneesTR.add(creerParRequete(lResult));
        }
        return lesDonneesTR;
    }
    
    /**
     * Retourne les toutes les donneesTR 'un véhicule
     * @param con
     * @param VehiculeID
     * @return DonneesTR trouvées par véhicule
     * @throws java.lang.Exception
     */
    public static ArrayList<DonneesTR> getByVehiculeID(Connection con,
              int VehiculeID) throws Exception {
        String queryString = "select * from donneesTR"
            + " where VehiculeID='" + VehiculeID + "' order by Datation";
        Statement lStat = con.createStatement(
                                ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        ArrayList<DonneesTR> lesDonneesTR = new ArrayList<>();
        // y en a t'il au moins un ?
        while (lResult.next()) {
             lesDonneesTR.add(creerParRequete(lResult));
        }
        return lesDonneesTR;
    }
    
    /**
     * Retourne les donneesTR entre deux dates (comprises)
     * @param con
     * @param VehiculeID
     * @param Day1
     * @param Day2
     * @return DonneesTR trouvé par véhicule et période
     * @throws java.lang.Exception
     */
    public static ArrayList<DonneesTR> getByVehiculeFromDayToDay(
            Connection con, int VehiculeID, 
            Timestamp Day1, Timestamp Day2) throws Exception {
        String queryString = "select * from donneesTR"
                + " where VehiculeID = " + VehiculeID + " and between "
                + " substring(" +  Utils.toString(Day1) + " FROM 1 FOR 10)"
                + " and date_add(substring(" +  Utils.toString(Day2) 
                + " FROM 1 FOR 10), interval 1 day)";
        Statement lStat = con.createStatement(
                                ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        ArrayList<DonneesTR> lesDonneesTR = new ArrayList<>();
        // y en a t'il au moins un ?
        while (lResult.next()) {
             lesDonneesTR.add(creerParRequete(lResult));
        }
        return lesDonneesTR;
    }
    
    /**
     * Indique le nb de donneesTR dans la base de données
     * @param con
     * @return le nombre de vehicules
     * @throws java.lang.Exception
     */
    public static int size(Connection con) throws Exception {
        String queryString = "select count(*) as count from donneesTR";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if (lResult.next())
            return (lResult.getInt("count"));
        else 
            return 0;
    }
     
    private static DonneesTR creerParRequete(ResultSet result) throws Exception {
        int lSeqNumber = result.getInt("SeqNumber");
        Timestamp lDatation = result.getTimestamp("Datation");
        int lVitesse = result.getInt("Vitesse");
        int lVitesseMax = result.getInt("VitesseMax");
        double lLatitudeGPS = result.getDouble("LatitudeGPS");
        double lLongitudeGPS = result.getDouble("LongitudeGPS");
        int lRadius = result.getInt("Radius");
        long lDistanceParcourueDepuisReset = result.getLong("DistanceParcourueDepuisReset");
        int lVehiculeID = result.getInt("VehiculeID");
        return new DonneesTR(lSeqNumber, lDatation, lVitesse, lVitesseMax, 
                             lLatitudeGPS, lLongitudeGPS, lRadius,
                             lDistanceParcourueDepuisReset, lVehiculeID);
    }

    /**
     * Cree et initialise completement DonneesTR
     */
    private DonneesTR(int SeqNumber,
            Timestamp Datation, int Vitesse, int VitesseMax,
            double LatitudeGPS, double LongitudeGPS, int Radius,
            long DistanceParcourueDepuisReset, int VehiculeID) {
        this.SeqNumber = SeqNumber;
        this.Datation = Datation;
        this.Vitesse = Vitesse;
        this.VitesseMax = VitesseMax;
        this.LatitudeGPS = LatitudeGPS;
        this.LongitudeGPS = LongitudeGPS;
        this.Radius = Radius;
        this.DistanceParcourueDepuisReset = DistanceParcourueDepuisReset;
        this.VehiculeID = VehiculeID;
    }

    public int getSeqNumber() {
        return SeqNumber;
    }

    public void setSeqNumber(int SeqNumber) {
        this.SeqNumber = SeqNumber;
    }

    public Timestamp getDatation() {
        return Datation;
    }

    public void setDatation(Timestamp Datation) {
        this.Datation = Datation;
    }

    public int getVitesse() {
        return Vitesse;
    }

    public void setVitesse(int Vitesse) {
        this.Vitesse = Vitesse;
    }

    public int getVitesseMax() {
        return VitesseMax;
    }

    public void setVitesseMax(int VitesseMax) {
        this.VitesseMax = VitesseMax;
    }

    public double getLatitudeGPS() {
        return LatitudeGPS;
    }

    public void setLatitudeGPS(double LatitudeGPS) {
        this.LatitudeGPS = LatitudeGPS;
    }

    public double getLongitudeGPS() {
        return LongitudeGPS;
    }

    public void setLongitudeGPS(double LongitudeGPS) {
        this.LongitudeGPS = LongitudeGPS;
    }

    public int getRadius() {
        return Radius;
    }

    public void setRadius(int Radius) {
        this.Radius = Radius;
    }

    public long getDistanceParcourueDepuisReset() {
        return DistanceParcourueDepuisReset;
    }

    public void setDistanceParcourueDepuisReset(long DistanceParcourueDepuisReset) {
        this.DistanceParcourueDepuisReset = DistanceParcourueDepuisReset;
    }

    public int getVehiculeID() {
        return VehiculeID;
    }

    // --------------------- les assesseurs ----------------------------
    public void setVehiculeID(int VehiculeID) {
        this.VehiculeID = VehiculeID;
    }

    /**
     * toString() operator overload
     *
     * @return the result string
     */
    @Override
    public String toString() {
        return " SeqNumber = " + Utils.toString(SeqNumber)
                + " Datation = " + Utils.toString(Datation)
                + " Vitesse = " + Utils.toString(Vitesse)
                + " VitesseMax = " + Utils.toString(VitesseMax)
                + " LatitudeGPSGPS = " + Utils.toString(LatitudeGPS)
                + " LongitudeGPSGPS = " + Utils.toString(LongitudeGPS)
                + " DistanceParcourue = " + Utils.toString(DistanceParcourueDepuisReset)
                + " VehiculeID = " + Utils.toString(VehiculeID);
    }
}
