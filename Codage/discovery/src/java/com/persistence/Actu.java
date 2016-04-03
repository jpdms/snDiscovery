/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.persistence;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 */
public class Actu {
    private int    id;          // la clef primaire
    private String date;
    private String titre;
    private String contenu;

    /**
     * Créer un nouvel objet persistant 
     * @param con
     * @param date
     * @param titre
     * @param contenu
     * @return l'actu créée
     * @throws Exception    impossible d'accéder à la ConnexionMySQL
     */
    static public Actu create(Connection con, String date, String titre, 
                                            String contenu)  throws Exception {
        Actu actu = new Actu(date, titre, contenu);
        
        String queryString 
            = "insert into actu (`Date`, `Titre`, `Contenu`) values ("
                    + Utils.toString(date) + ", " 
                    + Utils.toString(titre) + ", " 
                    + Utils.toString(contenu)
            + ")";
        Statement lStat = con.createStatement();
        lStat.executeUpdate(queryString, Statement.NO_GENERATED_KEYS);
        return actu;
    }

    private Actu(int lId, String lDate, String lTitre, String lContenu) {
        this.id = lId;
        this.date = lDate;
        this.titre = lTitre;
        this.contenu = lContenu;
    }
    
    /**
     * update de l'objet user dans la ConnexionMySQL
     * @param con
     * @throws Exception    impossible d'accéder à la ConnexionMySQL
     */
    public void save(Connection con) throws Exception {
        String queryString =
         "update actu set "
                + " `Date` =" + Utils.toString(date) + "," 
                + " `Titre` =" + Utils.toString(titre) + "," 
                + " `Contenu` =" + Utils.toString(contenu)
                + " where id='" + id + "'";
        Statement lStat = con.createStatement();
        lStat.executeUpdate(queryString, Statement.NO_GENERATED_KEYS);
    }

    /**
     * suppression de l'objet user dans la BD
     * @param con
     * @return 
     * @throws java.lang.Exception 
     */
    public boolean delete(Connection con) throws Exception {
        String queryString = "DELETE FROM `actu` WHERE `actu`.`id` = "+id+"";
        Statement lStat = con.createStatement();
        lStat.executeUpdate(queryString);
        return true;
    }
    
    /**
    * Retourne une actu par son id
     * @param con
    * @param  idActu
    * @return l'actu si elle existe null sinon
    * @throws java.lang.Exception
    */
    public static Actu getById(Connection con, int idActu) throws Exception {
        String queryString = "select * from actu where `id`=" + idActu;
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        // y en a t'il au moins un ?
        if (lResult.next()) {
            int       lId      = lResult.getInt("id");
            String    lDate    = lResult.getString("Date");
            String    lTitre   = lResult.getString("Titre");
            String    lContenu = lResult.getString("Contenu");
            Actu actu = new Actu(lId, lDate, lTitre, lContenu);
            return actu;
        }
        else
            return null;
    }
    
    /**
     * retourne l'element i trie par Date
     * @param con
     * @param  i      la position de l'objet courant
     * @return String la consultation en position i
     * @throws java.lang.Exception
     */
    public static Actu find(Connection con, int i) throws Exception {
        String queryString = "select id from actu order by `Date` desc";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if ((i > 0) && lResult.absolute(i)) {
            int idActu = lResult.getInt("id");
            return Actu.getById(con, idActu);
        }
        else 
            return null;
    }
        
    /**
     * Indique le nb d'actu dans la base de données
     * @param con
     * @return le nbr d'actu en ligne
     * @throws java.lang.Exception
     */
    public static int size(Connection con) throws Exception {
        String queryString = "select count(*) as count from actu";
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
     * Cree et initialise completement Actu
     */
    private Actu (String date, String titre, String contenu) {
        this.date = date;
        this.titre = titre;
        this.contenu = contenu;
    }
    
    // ---------------- les getters et setters --------------------
    public int getId() {
        return id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }
}