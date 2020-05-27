/*
 * Projet  : Alfox2020
 * Fichier : Boitier.java
 * Description : Classe interface de la table Boitier
 * Cette table stocke les infos sur les boitiers embarqués ds les véhicules
 */

package com.persistence;

import java.sql.*;

public class Boitier {
    private String  SigfoxID;       // clef primaire
    private String  ModeEnCours;
    private boolean Parking;
    private boolean GPSActif;
    private int     VehiculeID;
    
    /**
     * Créer un nouveau boitier persistant 
     * @param con
     * @param SigfoxID
     * @param ModeEnCours
     * @param Parking
     * @param GPSActif
     * @param VehiculeID
     * @return 
     * @ return retourne un boitier si le VehiculeID est trouvé sinon null
     * @throws Exception    impossible d'accéder à la ConnexionMySQL
     * 
     */
    static public Boitier create(Connection con, String SigfoxID, String ModeEnCours, 
            boolean Parking, boolean GPSActif, int VehiculeID)  throws Exception {
        Boitier boitier = new Boitier(SigfoxID, ModeEnCours, Parking, GPSActif, VehiculeID);
        
        String queryString =
         "insert into boitier (SigfoxID, ModeEnCours, ModeDemande, "
            + "Parking, GPSActif, VehiculeID) values ("
                + Utils.toString(SigfoxID) + ", " 
                + Utils.toString(ModeEnCours) + ", " 
                + Utils.toString(Parking) + ", " 
                + Utils.toString(GPSActif) + ", "
                + Utils.toString(VehiculeID)
            + ")";
        Statement lStat = con.createStatement();
        lStat.executeUpdate(queryString, Statement.NO_GENERATED_KEYS);
        return boitier;
    }
    
    /**
     * update de l'objet boitier dans la ConnexionMySQL
     * @param con
     * @throws Exception impossible d'accéder à la ConnexionMySQL
     */
    public void save(Connection con) throws Exception {
        String queryString =
         "update boitier set "
                + " ModeEnCours =" + Utils.toString(ModeEnCours) + ","
                + " Parking =" + Utils.toString(Parking) + ","  
                + " GPSActif =" + Utils.toString(GPSActif) + ","
                + " VehiculeID ="+ Utils.toString(VehiculeID)
                + " where SigfoxID = " + SigfoxID + "';";
        Statement lStat = con.createStatement();
        lStat.executeUpdate(queryString, Statement.NO_GENERATED_KEYS);
    }
        
    /**
     * suppression de l'objet boitier dans la BD
     * @param con
     * @return 
     * @throws SQLException impossible d'accéder à la ConnexionMySQL
     */
    public boolean delete(Connection con) throws Exception {
        String queryString = "delete from boitier where SigfoxID='" + SigfoxID + "';";
        Statement lStat = con.createStatement();
        lStat.executeUpdate(queryString);
        return true;
    }
    
    /**
     * Retourne un boitier trouve par son SigfoxID
     * @param  con
     * @param  sigfoxID ID recherché
     * @return boitier trouvé son SigfoxID
     * @throws java.lang.Exception
     */
    public static Boitier getBySigfoxID(Connection con, String sigfoxID) throws Exception {
        String queryString = "select * from boitier where SigfoxID='" + sigfoxID + "';";
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
     * Retourne un boitier trouve par son vehiculeID
     * @param  con
     * @param  vehiculeID ID du vehicule recherché
     * @return boitier trouvé par vehiculeID
     * @throws java.lang.Exception
     */
    public static Boitier getByVehiculeID(Connection con, int vehiculeID) throws Exception {
        String queryString = "select * from boitier where VehiculeID='" + vehiculeID + "';";
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
     * Indique le nb de boitier dans la base de données
     * @param con
     * @return le nombre de vehicules
     * @throws java.lang.Exception
     */
    public static int size(Connection con) throws Exception {
        String queryString = "select count(*) as count from boitier";
        Statement lStat = con.createStatement(
                    ResultSet.TYPE_SCROLL_INSENSITIVE, 
                    ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if (lResult.next())
            return (lResult.getInt("count"));
        else 
            return 0;
    }
    
    private static Boitier creerParRequete(ResultSet result) throws Exception {
            String    lSigfoxID  = result.getString("SigfoxID");
            String    lModeEnCours = result.getString("ModeEnCours");
            boolean   lParking = result.getBoolean("Parking");
            boolean   lGPSActif = result.getBoolean("GPSActif");
            int       lVehiculeID = result.getInt("VehiculeID");
            return    new Boitier(lSigfoxID, lModeEnCours, lParking, lGPSActif, lVehiculeID);
    }
    
    /**
     * Cree et initialise completement Loueur
     */
    private Boitier(String SigfoxID, String ModeEnCours, 
                        boolean Parking, boolean GPSActif, int VehiculeID) {
        this.SigfoxID = SigfoxID;
        this.ModeEnCours = ModeEnCours;
        this.Parking = Parking;
        this.GPSActif = GPSActif;
        this.VehiculeID = VehiculeID;
    }
    
    // --------------------- les assesseurs ----------------------------
    public String getSigfoxID() {
        return SigfoxID;
    }
 
    public int getVehiculeID() {
        return VehiculeID;
    }

    public String getModeEnCours() {
        return ModeEnCours;
    }

    public boolean getParking() {
        return Parking;
    }

    public boolean getGPSActif() {
        return GPSActif;
    }

    public void setSigfoxID(String SigfoxID) throws Exception {
        this.SigfoxID = SigfoxID;
    }

    public void setVehiculeID(int VehiculeID) throws Exception {
        this.VehiculeID = VehiculeID;
    }

    public void setModeEnCours(String ModeEnCours) throws Exception {
        this.ModeEnCours = ModeEnCours;
    }

    public void setParking(boolean Parking) throws Exception {
        this.Parking = Parking;
    }

    public void setGPSActif(boolean GPSActif) throws Exception {
        this.GPSActif = GPSActif;
    }
    
    /**
     * toString() operator overload
     * @return   the result string
     */
    @Override
    public String toString() {
        return  " SigfoxID =  "     + SigfoxID + "\t" +
                " ModeEnCours =  "   + ModeEnCours +
                " Parking = " + Utils.toString(Parking) + 
                " GPSActif = "    + Utils.toString(GPSActif)+ 
                " VehiculeID = "    + Utils.toString(VehiculeID);
    }
}