package com.persistence;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
//import java.text.SimpleDateFormat;
import java.util.*;

public class Image {
    private int    id;          // la clef primaire
    private String date;        // age de la galaxie ?
    private String galaxieNom;
    private String chemin;
    private Timestamp dateobs;  // Date de l'observation
    private double crpix1;
    private double crpix2;
    private double crval1;    
    private double crval2;
    private double cdelt1;
    private double cdelt2; 
    private double crota2;
    private double ra;
    private double dec;
    
     /**
     * Retourne une Galaxie par son nom
     * @param con
     * @param idImage
     * @return la Galaxie si elle existe null sinon
     * @throws java.lang.Exception
     */
    public static Image getById(Connection con, int idImage) throws Exception {
        String queryString = "select * from image where `id`=" + idImage;
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        // y en a t'il au moins un ?
        if (lResult.next()) {
            String    lDate        = lResult.getString("Date");
            String    lGalaxieNom  = lResult.getString("GalaxieNom");
            String    lChemin      = lResult.getString("chemin");
            Timestamp lDateobs     = lResult.getTimestamp("dateobs");
            double    lCrpix1      = lResult.getDouble("crpix1");
            double    lCrpix2      = lResult.getDouble("crpix2");
            double    lCrval1      = lResult.getDouble("crval1");
            double    lCrval2      = lResult.getDouble("crval2");
            double    lCdelt1      = lResult.getDouble("cdelt1");
            double    lCdelt2      = lResult.getDouble("cdelt2");
            double    lCrota2      = lResult.getDouble("crota2");
            double    lRa          = lResult.getDouble("ra");
            double    lDec         = lResult.getDouble("dec");
            Image image = new Image(idImage, lDate, lGalaxieNom, lChemin, 
                                   lDateobs, lCrpix1, lCrpix2, lCrval1, lCrval2,
                                   lCdelt1, lCdelt2, lCrota2, lRa, lDec);
            return image;
        }
        else
            return null;
    }
    
    public static Image getByChemin(Connection con, String telescope, String galaxie, String date) throws Exception{
        String queryString = "select `id` from image "
                + "where `Date`='"+date+"' and `GalaxieNom`='"+galaxie+"' and `Chemin`='"+telescope+"'";        
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if (lResult.next()) {
            Image image = Image.getById(con, lResult.getInt("id"));
            return image;
        }
        else{
            return null;
        }
    }
    
    public static Image getByCandidat(Connection con, String chemin, String nomImage) throws Exception{
        String buf[] = chemin.split("/");
        String telescope = buf[2];
        String date = buf[3];
        String galaxie = nomImage;
        String queryString = "select `id` from image "
                + "where `Date`='"+date+"' and `GalaxieNom`='"+galaxie+"' and `Chemin`='"+telescope+"'";        
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if (lResult.next()) {
            Image image = Image.getById(con, lResult.getInt("id"));
            return image;
        }
        else{
            return null;
        }
    }
    
    public static boolean existByDate(Connection con, String date) throws SQLException{
        String queryString = "select `id` from image "
            + "where `Date`='"+date+"'";      
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        return lResult.next();
    }
    /**
     * retourne l'élément i trié par nom de galaxie
     * @param con
     * @param _dateobs au format : '20140108'
     * @param  i     la position de l'objet courant, de 1 à N
     * @return Image la ieme image de cette journée 
     * @throws java.lang.Exception
     */
    public static Image find(Connection con, String _dateobs, int i) throws Exception {
        String queryString = "select `id` from image "
                    + " where `Date`='" + _dateobs + "' order by `GalaxieNom`";        
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if ((i > 0) && lResult.absolute(i)) {
            int idImage = lResult.getInt("id");
            return Image.getById(con, idImage);
        }
        else 
            return null;
    }
    
    /**
     * retourne les 7 derniers jours
     * @param con
     * @return une collection de dates au format YYYYMMJJ
     * @throws java.lang.Exception
     */
    public static ArrayList<String> getDerniersJours(Connection con) throws Exception {
        ArrayList<String> dates = new ArrayList<String>();
        // format des dates d'observation : '20140108'
        String queryString = "select distinct `Date` from image "
                                            + " order by `Date` desc limit 7";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        
        while (lResult.next()) { 
            String lDate = lResult.getString("Date");
            dates.add(lDate);
        }
        return dates;
    }
      
    /**
     * retourne toutes les images du jour concernees
     * @param con
     * @param _dateobs au format : '20140108'
     * @return une collection d'images 
     * @throws java.lang.Exception
     */
    public static ArrayList<Image> getImagesDuJour(Connection con, String _dateobs) throws Exception {
        ArrayList<Image> images = new ArrayList<Image>();
        // 
        String queryString = "select * from image "
                      + " where `Date`='" + _dateobs + "' order by GalaxieNom";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        
        while (lResult.next()) { 
            int       lImageId     = lResult.getInt("id");
            String    lDate        = lResult.getString("Date");
            String    lGalaxieNom  = lResult.getString("GalaxieNom");
            String    lChemin      = lResult.getString("chemin");
            Timestamp lDateobs     = lResult.getTimestamp("dateobs");
            double    lCrpix1      = lResult.getDouble("crpix1");
            double    lCrpix2      = lResult.getDouble("crpix2");
            double    lCrval1      = lResult.getDouble("crval1");
            double    lCrval2      = lResult.getDouble("crval2");
            double    lCdelt1      = lResult.getDouble("cdelt1");
            double    lCdelt2      = lResult.getDouble("cdelt2");
            double    lCrota2      = lResult.getDouble("crota2");
            double    lRa          = lResult.getDouble("ra");
            double    lDec         = lResult.getDouble("dec");
            Image image = new Image(lImageId, lDate, lGalaxieNom, lChemin, lDateobs,
                                    lCrpix1, lCrpix2, lCrval1, lCrval2,
                                    lCdelt1, lCdelt2, lCrota2, lRa, lDec);
            images.add(image);
        }
        return images;
    }
      /**
     * retourne les 6 dernieres images d'une galaxie
     * @param con
     * @param _nomGalaxie
     * @return une collection d'images 
     * @throws java.lang.Exception
     */
    public static ArrayList<String> getDernieresImages(Connection con, String _nomGalaxie) throws Exception {
        ArrayList<String> lastImages = new ArrayList<String>();
        // format de la date d'observation : '20140108'
        String queryString = "select Date, chemin from image "
                                + " where GalaxieNom='" + _nomGalaxie + "'"
                                + " order by `Date` desc limit 6";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        
        while (lResult.next()) { 
            String    lDate   = lResult.getString("Date");
            String    lChemin = lResult.getString("chemin");
            if (lChemin.equals("Tarot_Calern"))
                lastImages.add("F " + lDate);
            else
                lastImages.add("C " + lDate);
        }
        return lastImages;
    }
    
    /**
     *
     * @param con
     * @return
     * @throws Exception
     */
    public static String dernierJour(Connection con)  throws Exception {
        // format de la valeur de retour : '20140108'
        String queryString = "select `Date` from image "
                                           + " order by `Date` desc limit 1";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if (lResult.next())
            return (lResult.getString("Date"));
        else 
            return null;
    }
    
    /**
     *
     * @param con
     * @param _jour
     * @return
     * @throws Exception
     */
    public static String dernierJourAvant(Connection con, String _jour)  throws Exception {
        // format du _jour : '20140108'
        String queryString = "select `Date` from image "
                                            + " where `Date` < '" + _jour + "'"
                                            + " order by `Date` desc limit 1";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if (lResult.next())
            return (lResult.getString("Date"));
        else 
            return null;
    }
    
    /**
     *
     * @param con
     * @param _jour
     * @return
     * @throws Exception
     */
    public static int nbImageDuJour(Connection con, String _jour) throws Exception {
        // format du _jour : '20140108'
        String queryString = "select count(*) as count from image "
                                             + " where `Date`='" + _jour + "'";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if (lResult.next())
            return (lResult.getInt("count"));
        else 
            return 0;
    }
        
    /**
     * Indique le nb de galaxies dans la base de données
     * @param con
     * @return le nombre de galaxies
     * @throws java.lang.Exception
     */
    public static int size(Connection con) throws Exception {
        String queryString = "select count(*) as count from image";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if (lResult.next())
            return (lResult.getInt("count"));
        else 
            return 0;
    }
    
    /**
     * Cree et initialise completement Galaxie
     */
    private Image (int id, String date, String galaxieNom, String chemin, 
                Timestamp dateobs, double crpix1, double crpix2, double crval1, 
                double crval2, double cdelt1, double cdelt2, double crota2, 
                double ra, double dec) {
        this.id      = id;
        this.date    = date;
        this.galaxieNom = galaxieNom;
        this.chemin  = chemin;
        this.dateobs = (Timestamp)dateobs.clone();
        this.crpix1  = crpix1;
        this.crpix2  = crpix2;
        this.crval1  = crval1;
        this.crval2  = crval2;
        this.cdelt1  = cdelt1;
        this.cdelt2  = cdelt2;
        this.crota2  = crota2;
        this.ra      = ra;
        this.dec     = dec;
    }
    
    // ---------------- les getters (uniquement en lecture) --------------------
    public int getId() {
        return id;
    }

    public String getGalaxieNom() {
        return galaxieNom;
    }

    public String getDate() {
        return date;
    }

    public String getChemin() {
        return chemin;
    }

    public Timestamp getDateobs() {
        return dateobs;
    }

    public double getCrpix1() {
        return crpix1;
    }

    public double getCrpix2() {
        return crpix2;
    }

    public double getCrval1() {
        return crval1;
    }

    public double getCrval2() {
        return crval2;
    }

    public double getCdelt1() {
        return cdelt1;
    }

    public double getCdelt2() {
        return cdelt2;
    }

    public double getCrota2() {
        return crota2;
    }

    public double getRa() {
        return ra;
    }

    public double getDec() {
        return dec;
    }
}