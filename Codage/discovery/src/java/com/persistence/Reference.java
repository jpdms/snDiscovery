/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.persistence;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.nio.file.*;
import static javafx.scene.input.DataFormat.URL;

/**
 *
 * @author jpdms
 */
public class Reference {
    private int id;
    public String galaxieNom;
    public String chemin;
    
    /**
     * Retourne une Reference par son id
     * @param con
     * @param _id
     * @return la Reference si elle existe null sinon
     * @throws java.lang.Exception
     */
    public static Reference getById(Connection con, int _id) throws Exception {
        String queryString = "select * from reference where id=" + _id;
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        // y en a t'il au moins un ?
        if (lResult.next()) {
            String lGalaxieNom = lResult.getString("GalaxieNom");
            String lChemin = lResult.getString("Chemin");
            Reference reference = new Reference(_id, lGalaxieNom, lChemin);
            return reference;
        }
        else
            return null;
    }

    /**
     * Retourne une Reference par son nom
     * @param con
     * @param _galaxieNom
     * @return la Reference si elle existe null sinon
     * @throws java.lang.Exception
     */
    public static Reference getByName(Connection con, String _galaxieNom) throws Exception {
        String queryString = "select id where GalaxieNom='" + _galaxieNom + "'";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        // y en a t'il au moins un ?
        if (lResult.next()) {
            int idRef = lResult.getInt("id");
            return Reference.getById(con, idRef);
        }
        else
            return null;
    }
    
    /**
     * retourne l'élément i trié par imageId
     * @param con
     * @param  i      la position de l'objet courant
     * @return String la Reference en position i
     * @throws java.lang.Exception
     */
    public static Reference find(Connection con, int i) throws Exception {
        String queryString = "select id from reference order by id";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if ((i > 0) && (lResult.absolute(i))) {
            int idRef = lResult.getInt("id");
            return Reference.getById(con, idRef);
        }
        else 
            return null;
    }
        
    /**
     * Indique le nb de references dans la base de données
     * @param con
     * @return le nombre de references
     * @throws java.lang.Exception
     */
    public static int size(Connection con) throws Exception {
        String queryString = "select count(*) as count from reference";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if (lResult.next())
            return (lResult.getInt("count"));
        else 
            return 0;
    }
    
    public static boolean remplacer(String source, String destination) throws IOException {
        Path psource = Paths.get(source);
        Path pdestination = Paths.get(destination);
        Files.copy(psource, pdestination, StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.COPY_ATTRIBUTES);
        return true;
    }
    /**
     * Cree et initialise completement Reference
     */
    private Reference(int id, String galaxieNom, String chemin) {
        this.id = id;
        this.galaxieNom = galaxieNom;
        this.chemin = chemin;
    }
    
    /**
     * Cree un nouvel objet Reference
     */
    private Reference(String galaxieNom, String chemin) {
        this.galaxieNom = galaxieNom;
        this.chemin = chemin;
    }
    
    // --------------------- les assesseurs ----------------------------
    public int getId() {
        return id;
    }

    public String getGalaxieNom() {
        return galaxieNom;
    }

    public void setGalaxieNom(String galaxieNom) {
        this.galaxieNom = galaxieNom;
    }

    public String getChemin() {
        return chemin;
    }

    public void setChemin(String chemin) {
        this.chemin = chemin;
    }
    
    /**
     * toString() operator overload
     * @return   the result string
     * id;
    public String galaxieNom;
    public String chemin;
     */
    @Override
    public String toString() {
        return  " galaxieNom =  " + Utils.toString(galaxieNom) + "\t" +
                " chemin = " + Utils.toString(chemin)
                + " ";
    }
}