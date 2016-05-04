package com.persistence;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class CandidateReference {
    private Timestamp   date;
    private String userPseudo;
    private String nomImage;
    private String chemin;

    /**
     * Créer un nouvel objet persistant 
     * @param con
     * @param nomImage
     * @param chemin
     * @param userPseudo
     * @return 
     * @ return  une candidate si personne n'a candidate cette image sinon null
     * @throws SQLException   impossible d'accéder à la ConnexionMySQL
     */
    static public CandidateReference create(Connection con, String userPseudo, String nomImage, String chemin) throws Exception {
        CandidateReference candidate = new CandidateReference(userPseudo, nomImage, chemin);
        String queryString =
         "insert into canreference (`date`, `userPseudo`, `nomGalaxie`, `chemin`) "
            + " values ("
                + Utils.toString(candidate.getDate()) + ","
                + Utils.toString(userPseudo) + "," 
                + Utils.toString(nomImage) + ","
                + Utils.toString(chemin) + ")";
        Statement lStat = con.createStatement();
        // System.out.println(queryString);
        lStat.executeUpdate(queryString, Statement.NO_GENERATED_KEYS);
        return candidate;
    }

    /**
     * suppression de l'objet candidates dans la BD
     * @param con
     * @return 
     * @throws SQLException    impossible d'accéder à la ConnexionMySQL
     */
    public boolean delete(Connection con) throws Exception {
        String queryString = "delete from canreference "
                + " where userPseudo='" + userPseudo  + "'"
                    + " and chemin='" + chemin + "'";
        Statement lStat = con.createStatement();
        lStat.executeUpdate(queryString);
        return true;
    }    
    /**
     * retourne l'élément i d'une candidature pour une image 
     * ordonne par la date de découverte
     * @param con
     * @param nomImage
     * @param chemin
     * @param user
     * @param  i       le nom de la personne courante
     * @return String la liste des nom des personnes inscrites
     * @throws java.lang.Exception
     */
    public static CandidateReference find(Connection con, String chemin, String user, int i) throws Exception {
        String queryString = "select * from canreference "
                                + " where chemin='" + chemin + "' and userPseudo ='"+ user +"' "
                                    + " order by `date` asc";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if ((i > 0) && (lResult.absolute(i))) {
            Timestamp date    = lResult.getTimestamp("date");
            String userPseudo = lResult.getString("userPseudo");
            CandidateReference candidate = 
                    new CandidateReference(date,userPseudo,"",chemin);
            return candidate;
        }
        else 
            return null;
    }
    
    public static CandidateReference findAll(Connection con, int i) throws Exception {
        String queryString = "select * from canreference "
                                    + " order by `date`";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if ((i > 0) && (lResult.absolute(i))) {
            Timestamp date    = lResult.getTimestamp("date");
            String userPseudo = lResult.getString("userPseudo");
            String nomImage = lResult.getString("nomGalaxie");
            String chemin = lResult.getString("chemin");
            CandidateReference candidate = 
                    new CandidateReference(date,userPseudo,nomImage,chemin);
            return candidate;
        }
        else 
            return null;
    }
    /**
     * Indique si le nom d'une personne existe déjà ou non ?
     * Pour unicité du nom
     * @param con
     * @param userPseudo
     * @param nomImage
     * @param chemin
     * @return true si l'image est déjà candidate existe déjà
     * @throws java.lang.Exception
     */
    public static boolean isCandidateExiste(Connection con, String userPseudo, String nomImage, 
                                              String chemin) throws Exception {
        String queryString = "select * from canreference "
                                    + " where userPseudo='" + userPseudo  + "'"
                                        + " and nomGalaxie='" + nomImage + "'"
                                          + " and chemin='" + chemin + "'";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        // y en a t'il au moins un ?
        return lResult.next();
    }
        
    /**
     * Indique le nb de candidates dans la base de données
     * @param con
     * @return le nombre de candidates
     * @throws java.lang.Exception
     */
    public static int size(Connection con) throws Exception {
        String queryString = "select count(*) as count from canreference";
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
     * Cree et initialise completement Candidate
     */
    private CandidateReference(Timestamp date, String userPseudo, String nomImage, String chemin) {
        this.date = (Timestamp)date.clone();
        this.userPseudo = userPseudo;
        this.nomImage = nomImage;
        this.chemin = chemin;
    }
    
    /**
     * Cree un nouvel objet Candidate
     */
    private CandidateReference(String userPseudo, String nomImage, String chemin) {
        Timestamp currentTimestamp = 
            new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
        this.date = currentTimestamp;
        this.userPseudo = userPseudo;
        this.nomImage = nomImage;
        this.chemin = chemin;
    }
        
    // --------------------- les assesseurs ----------------------------
    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getUserPseudo() {
        return userPseudo;
    }

    public void setUserPseudo(String userPseudo) {
        this.userPseudo = userPseudo;
    }

    public String getNomGalaxie() {
        return nomImage;
    }

    public void setNomImage(String nomImage) {
        this.nomImage = nomImage;
    }
    
    public String getChemin(){
        return chemin;
    }
    
    public String getnomImage(){
        return nomImage;
    }
    
    public String getDateDisco() throws ParseException, Exception{
        String sdate = date.toString();
        SimpleDateFormat type = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        java.util.Date date = type.parse(sdate);
        SimpleDateFormat convert = new SimpleDateFormat("dd/MM/yyyy");
        return convert.format(date).toString();
        
    }
    
    public String getDateDecouverte(){
        return date.toString();
        
    }
    /**
     * toString() operator overload
     * @return   the result string
     */
    @Override
    public String toString() {
        return  " date =  " + Utils.toString(date) + "\t" +
                " userPseudo = " + Utils.toString(userPseudo) + 
                " nomImage = " + Utils.toString(nomImage) + 
                " chemin = " + Utils.toString(chemin) 
                + " ";
    }
}