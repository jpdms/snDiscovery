package com.persistence;

import java.sql.*;

public class Consultation {
    public String userPseudo;
    public int imageId;
    
    /**
     * Créer un nouvel objet persistant 
     * @param con
     * @param userPseudo
     * @param imageId
     * @return 
     * @ return  une nouvelle consultation si nouvelle sinon null
     * @throws Exception   impossible d'accéder à la ConnexionMySQL
     */
    static public Consultation create(Connection con, String userPseudo, int imageId)  throws Exception {
        Consultation consultation = new Consultation(userPseudo, imageId);
        
        String queryString =
         "insert into candidate (`userPseudo`, `imageId`) values (0,"
                                           + Utils.toString(userPseudo) + "," 
                                           + Utils.toString(imageId) + ")";
        Statement lStat = con.createStatement();
        lStat.executeUpdate(queryString, Statement.NO_GENERATED_KEYS);
        return consultation;
    }

    /**
     * suppression de l'objet candidates dans la BD
     * @param con
     * @return 
     * @throws Exception    impossible d'accéder à la ConnexionMySQL
     */
    public boolean delete(Connection con) throws Exception {
        String queryString = "delete from consultation "
              + " where userPseudo='" + userPseudo + "' and imageId=" + imageId;
        Statement lStat = con.createStatement();
        lStat.executeUpdate(queryString);
        return true;
    }
    
    /**
     * Indique si cette image a deja ete consultee
     * @param con
     * @param  imageId l'image a trouver
     * @return true si l'image a deja ete consultee
     * @throws java.lang.Exception
     */
    public static boolean isDejaConsulte(Connection con, int imageId) throws Exception {
        String queryString = "select userPseudo from consultation"
                                                + " where imageId=" + imageId;
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        // y en a t'il au moins un ?
        return lResult.next();
    }
    
    
    /**
     * Indique par qui cette image a deja ete consultee
     * @param con
     * @param  imageId l'image a trouver
     * @return le user si l'image a deja ete consultee par lui, null sinon
     * @throws java.lang.Exception
     */
    public static User quiAConsulte(Connection con, int imageId) throws Exception {
        String queryString = "select userPseudo from consultation"
                                                + " where imageId=" + imageId;
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if (lResult.next()) {
            String userPseudo = lResult.getString("userPseudo");
            return User.getByPseudo(con, userPseudo);
        }
        else 
            return null;
    }
        
    /**
     * Indique le nb de consultation de cette image dans la base de données
     * @param con
     * @param imageId
     * @return le nombre de candidates
     * @throws java.lang.Exception
     */
    public static int nbConsultations(Connection con, int imageId) throws Exception {
        String queryString = "select count(*) as count from consultation"
                                                + " where imageId=" + imageId;
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
     * Indique le nb de consultations dans la base de données
     * @param con
     * @return le nombre de candidates
     * @throws java.lang.Exception
     */
    public static int size(Connection con) throws Exception {
        String queryString = "select count(*) as count from consultation";
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
     * Cree et initialise completement Consultation
     */
    private Consultation(String userPseudo, int imageId) {
        this.userPseudo = userPseudo;
        this.imageId = imageId;
    }
    
    // --------------------- les assesseurs ----------------------------
    public String getUserPseudo() {
        return userPseudo;
    }

    public void setUserPseudo(String userPseudo) {
        this.userPseudo = userPseudo;
    }

    public int getImageID() {
        return imageId;
    }

    public void setImageID(int imageId) {
        this.imageId = imageId;
    }
}