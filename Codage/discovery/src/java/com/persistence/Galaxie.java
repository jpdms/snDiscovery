package com.persistence;

import java.sql.*;

public class Galaxie {
	private String Nom;
	private String Categorie;
	private String Informations;
        private int    nbSupernovae;
	private double ra;
	private double dec;
	private double dist;
	private double mag;
	public  String refChemin;
    
    /**
     * Retourne une Galaxie par son Nom
     * @param con
     * @param _Nom
     * @return la Galaxie si elle existe null sinon
     * @throws java.lang.Exception
     */
    public static Galaxie getByName(Connection con, String _Nom) throws Exception {
        String queryString = 
                "select * from galaxie where Nom = '" + _Nom + "'";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        // y en a t'il au moins un ?
        if (lResult.next()) {
            String lCategorie = lResult.getString("Categorie");
            String lInformations = lResult.getString("Informations");
            int    lNbSupernovae  = lResult.getInt("nbSupernovae");
            double lRa   = lResult.getDouble("ra");
            double lDec  = lResult.getDouble("dec");
            double lDist = lResult.getDouble("dist");
            double lMag  = lResult.getDouble("mag");
            // la table reference n'est plus utilisée
            Galaxie galaxie = new Galaxie(_Nom, lCategorie, lInformations, 
                         lNbSupernovae, lRa, lDec, lDist, lMag, "");
            return galaxie;
        }
        else
            return null;
    }
    
    /**
     * retourne l'element i trie par imageId
     * @param con
     * @param  i      la position de l'objet courant
     * @return String la consultation en position i
     * @throws java.lang.Exception
     */
    public static Galaxie find(Connection con, int i) throws Exception {
        String queryString = "select Nom from galaxie order by Nom";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if ((i > 0) && (lResult.absolute(i))) {
            String lNomGalaxie = lResult.getString("Nom");
            return Galaxie.getByName(con, lNomGalaxie);
        }
        else 
            return null;
    }
        
    /**
     * Indique le nb de galaxies dans la base de données
     * @param con
     * @return le Nombre de galaxies
     * @throws java.lang.Exception
     */
    public static int size(Connection con) throws Exception {
        String queryString = "select count(*) as count from galaxie";
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
    private Galaxie (String Nom, String Categorie, String Informations, 
            int nbSupernovae, double ra, double dec, double dist, double mag, String refChemin) {
        this.Nom = Nom;
        this.Categorie = Categorie;
        this.Informations = Informations;
        this.nbSupernovae = nbSupernovae;
        this.ra = ra;
        this.dec = dec;
        this.dist = dist;
        this.mag = mag;
        this.refChemin = refChemin;
    }
    
    // ---------------- les getters (uniquement en lecture) --------------------

    public String getNom() {
        return Nom;
    }

    public String getCategorie() {
        return Categorie;
    }

    public String getInformations() {
        return Informations;
    }

    public Double getRa() {
        return ra;
    }

    public Double getDec() {
        return dec;
    }

    public Double getDist() {
        return dist;
    }

    public Double getMag() {
        return mag;
    }

    public int getNbSupernovae() {
        return nbSupernovae;
    }

    public void setNbSupernovae(int nbSupernovae) {
        this.nbSupernovae = nbSupernovae;
    }

    public String getReference() {
        return refChemin;
    }

    public void setRefChemin(String refChemin) {
        this.refChemin = refChemin;
    }
    
    /**
     * toString() operator overload
     * @return   the result stringNom;
     */
    @Override
    public String toString() {
        return  " Nom =  " + Nom + "\t" +
                " Categorie = " + Utils.toString(Categorie) +
                " Informations = " + Utils.toString(Informations) +
                " nbSupernovae = " + Utils.toString(nbSupernovae) + 
                " ra = " + Utils.toString(ra) + 
                " dec = " + Utils.toString(dec) + 
                " dist = " + Utils.toString(dist) +
                " mag = " + Utils.toString(mag) +
                " refChemin = " + Utils.toString(refChemin)
                + " ";
    }
    
}