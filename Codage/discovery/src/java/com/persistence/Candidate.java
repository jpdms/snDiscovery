package com.persistence;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class Candidate {
    private Timestamp   date;
    private int    certitude;
    private int    x;
    private int    y;
    private double ra;
    private double dec;
    //          les clefs étrangères
    private String userPseudo;
    private String nomImage;
    private String chemin;

    /**
     * Créer un nouvel objet persistant 
     * @param con
     * @param certitude
     * @param nomImage
     * @param chemin
     * @param x
     * @param y
     * @param ra
     * @param dec
     * @param userPseudo
     * @return 
     * @ return  une candidate si personne n'a candidate cette image sinon null
     * @throws SQLException   impossible d'accéder à la ConnexionMySQL
     */
    static public Candidate create(Connection con, String userPseudo, String nomImage, String chemin,
         int certitude, int x, int y, double ra, double dec) throws Exception {
        Candidate candidate = new Candidate(certitude, x, y, ra, dec,
                                                  userPseudo, nomImage, chemin);
        String queryString =
         "insert into candidate (`date`,`certitude`,`x`,`y`,`ra`,`dec`,"
            + " `userPseudo`, `nomImage`, `chemin`) "
            + " values ("
                + Utils.toString(candidate.getDate()) + "," 
                + Utils.toString(certitude) + "," 
                + Utils.toString(x) + "," 
                + Utils.toString(y) + "," 
                + Utils.toString(ra) + "," 
                + Utils.toString(dec) + "," 
                + Utils.toString(userPseudo) + "," 
                + Utils.toString(nomImage) + ","
                + Utils.toString(chemin) + ")";
        Statement lStat = con.createStatement();
        // System.out.println(queryString);
        lStat.executeUpdate(queryString, Statement.NO_GENERATED_KEYS);
        return candidate;
    }
    
    /**
     * update de l'objet candidate dans la ConnexionMySQL
     * @param con
     * @throws Exception    impossible d'accéder à la ConnexionMySQL
     */
    public void save(Connection con) throws Exception {
        String queryString =
         "update candidate set "
                + " `date` ="      + Utils.toString(date) + "," 
                + " `certitude` =" + Utils.toString(certitude) + "," 
                + " `x` ="         + Utils.toString(x) + "," 
                + " `y` ="         + Utils.toString(y) + "," 
                + " `ra` ="        + Utils.toString(ra) + "," 
                + " `dec` ="       + Utils.toString(dec)
                + " where userPseudo='" + userPseudo  + "'"
                    + " and nomImage='" + nomImage + "'"
                      + " and chemin='" + chemin + "'";
        Statement lStat = con.createStatement();
        lStat.executeUpdate(queryString, Statement.NO_GENERATED_KEYS);
    }

    /**
     * suppression de l'objet candidates dans la BD
     * @param con
     * @return 
     * @throws SQLException    impossible d'accéder à la ConnexionMySQL
     */
    public boolean delete(Connection con) throws Exception {
        String queryString = "delete from candidate "
                + " where userPseudo='" + userPseudo  + "'"
                    + " and nomImage='" + nomImage + "'"
                      + " and chemin='" + chemin + "'";
        Statement lStat = con.createStatement();
        lStat.executeUpdate(queryString);
        return true;
    }
    
    /**
     * Retourne la liste des candidates pour cette image
     * @param con
     * @param nomImage
     * @param chemin
     * @return la candidate si elle existe null sinon
     * @throws java.lang.Exception
     */
    public static ArrayList<Candidate> getByImage(Connection con, String nomImage, String chemin) 
                                                            throws Exception {
        ArrayList<Candidate> candidates = new ArrayList<Candidate>();
        String queryString = "select * from candidate "
                                + " where nomImage='" + nomImage + "'"
                                    + " and chemin='" + chemin + "'"
                                    + " order by `date`";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        // y en a t'il au moins un ?
        while (lResult.next()) {
            Timestamp date    = lResult.getTimestamp("date");
            int    certitude  = lResult.getInt("certitude");
            int    x          = lResult.getInt("x");
            int    y          = lResult.getInt("y");
            double ra         = lResult.getDouble("ra");
            double dec        = lResult.getDouble("dec");
            String userPseudo = lResult.getString("userPseudo");
            Candidate candidate = 
                    new Candidate(date,certitude,x,y,ra,dec,userPseudo,nomImage,chemin);
            candidates.add(candidate);
        }
        return candidates;
    }
    
    /**
     * retourne l'élément i d'une candidature pour une image 
     * ordonne par la date de découverte
     * @param con
     * @param nomImage
     * @param chemin
     * @param  i       le nom de la personne courante
     * @return String la liste des nom des personnes inscrites
     * @throws java.lang.Exception
     */
    public static Candidate find(Connection con, String nomImage, String chemin, int i) throws Exception {
        String queryString = "select * from candidate "
                                + " where nomImage='" + nomImage + "'"
                                    + " and chemin='" + chemin + "'"
                                    + " order by `date` asc";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if ((i > 0) && (lResult.absolute(i))) {
            Timestamp date    = lResult.getTimestamp("date");
            int    certitude  = lResult.getInt("certitude");
            int    x          = lResult.getInt("x");
            int    y          = lResult.getInt("y");
            double ra         = lResult.getDouble("ra");
            double dec        = lResult.getDouble("dec");
            String userPseudo = lResult.getString("userPseudo");
            Candidate candidate = 
                    new Candidate(date,certitude,x,y,ra,dec,userPseudo,nomImage,chemin);
            return candidate;
        }
        else 
            return null;
    }
    
    public static Candidate findAll(Connection con, int i) throws Exception {
        String queryString = "select * from candidate "
                                    + " order by `date`";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if ((i > 0) && (lResult.absolute(i))) {
            Timestamp date    = lResult.getTimestamp("date");
            int    certitude  = lResult.getInt("certitude");
            int    x          = lResult.getInt("x");
            int    y          = lResult.getInt("y");
            double ra         = lResult.getDouble("ra");
            double dec        = lResult.getDouble("dec");
            String userPseudo = lResult.getString("userPseudo");
            String nomImage = lResult.getString("nomImage");
            String chemin = lResult.getString("chemin");
            Candidate candidate = 
                    new Candidate(date,certitude,x,y,ra,dec,userPseudo,nomImage,chemin);
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
        String queryString = "select * from candidate "
                                    + " where userPseudo='" + userPseudo  + "'"
                                        + " and nomImage='" + nomImage + "'"
                                          + " and chemin='" + chemin + "'";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        // y en a t'il au moins un ?
        return lResult.next();
    }
    
    /**
     * Indique qui la liste des users qui ont candidate sur cette image
     * ordonne par la date de candidature
     * @param con
     * @param nomImage
     * @param chemin
     * @return la liste des users qui ont candidate sur cette image
     * @throws java.lang.Exception
     */
    public static ArrayList<String> usersPseudoForCandidate(Connection con, String nomImage, String chemin) 
                                                             throws Exception {
        ArrayList<String> users = new ArrayList<String>();
        String queryString = "select `userPseudo` from candidate "
                                    + " where nomImage='" + nomImage + "'"
                                    + " and chemin='" + chemin + "'"
                                    + " order by `date`";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        while (lResult.next()) {
            String userPseudo = lResult.getString("userPseudo");
            users.add(userPseudo);
        }
        return users;
    }
        
    /**
     * Indique le nb de candidates dans la base de données
     * @param con
     * @return le nombre de candidates
     * @throws java.lang.Exception
     */
    public static int size(Connection con) throws Exception {
        String queryString = "select count(*) as count from candidate";
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
    private Candidate(Timestamp date, int certitude, int x, int y, double ra, 
               double dec, String userPseudo, String nomImage, String chemin) {
        this.date = (Timestamp)date.clone();
        this.certitude = certitude;
        this.x = x;
        this.y = y;
        this.ra = ra;
        this.dec = dec;
        this.userPseudo = userPseudo;
        this.nomImage = nomImage;
        this.chemin = chemin;
    }
    
    /**
     * Cree un nouvel objet Candidate
     */
    private Candidate(int certitude, int x, int y, double ra, 
               double dec, String userPseudo, String nomImage, String chemin) {
        Timestamp currentTimestamp = 
            new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
        this.date = currentTimestamp;
        this.certitude = certitude;
        this.x = x;
        this.y = y;
        this.ra = ra;
        this.dec = dec;
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

    public int getCertitude() {
        return certitude;
    }

    public void setCertitude(int certitude) {
        this.certitude = certitude;
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    public Double getRa() {
        return ra;
    }

    public void setRa(Double ra) {
        this.ra = ra;
    }

    public Double getDec() {
        return dec;
    }

    public void setDec(Double dec) {
        this.dec = dec;
    }
   

    public String getUserPseudo() {
        return userPseudo;
    }

    public void setUserPseudo(String userPseudo) {
        this.userPseudo = userPseudo;
    }

    public String getNomImage() {
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
        String buf[] = chemin.split("/");
        String sdate = buf[3].toString();
        SimpleDateFormat type = new SimpleDateFormat("yyyyMMdd");
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
                " certitude = " + Utils.toString(certitude) +
                " x = " + Utils.toString(x) +
                " y = " + Utils.toString(y) + 
                " ra = " + Utils.toString(ra) + 
                " dec = " + Utils.toString(dec) + 
                " userPseudo = " + Utils.toString(userPseudo) + 
                " nomImage = " + Utils.toString(nomImage) + 
                " chemin = " + Utils.toString(chemin) 
                + " ";
    }
}