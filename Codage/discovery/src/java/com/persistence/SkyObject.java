package com.persistence;

import java.sql.*;

public class SkyObject {
    private int    id;
    private double ra;
    private double dec;
    private double mag;
    private String type;
    private String infos;
    private Timestamp   date;
    private int    imageId;
    
    /**
     * Retourne un SkyObject par son id
     * @param con
     * @param skyObjectId
     * @return le SkyObject si il existe null sinon
     * @throws java.lang.Exception
     */
    public static SkyObject getById (Connection con, int skyObjectId) throws Exception {
        String queryString = "select * from skyobjects where id=" + skyObjectId;
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        // y en a t'il au moins un ?
        if (lResult.next()) {
            double lRa          = lResult.getDouble("ra");
            double lDec         = lResult.getDouble("dec");
            double lMag         = lResult.getDouble("mag");
            String lType        = lResult.getString("type");
            String lInfos       = lResult.getString("infos");
            Timestamp lDate     = lResult.getTimestamp("date");
            int    lImageId     = lResult.getInt("imageId");
            
            SkyObject skyObject = new SkyObject(skyObjectId, lRa, lDec, lMag, 
                                                lType, lInfos, lDate, lImageId);
            return skyObject;
        }
        else
            return null;
    }
    
    /**
     * retourne l'élément i trié par imageId
     * @param con
     * @param imageId
     * @param  i      la position de l'objet courant
     * @return String la consultations en position i
     * @throws java.lang.Exception
     */
    public static SkyObject find(Connection con, int imageId, int i) throws Exception {
        String queryString = "select id from skyobjects "
                            + " where imageId=" + imageId + " order by id";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        if ((i > 0) && (lResult.absolute(i))) {
            int idSkyObject = lResult.getInt("id");
            return SkyObject.getById(con, idSkyObject);
        }
        else 
            return null;
    }
        
    /**
     * Indique le nb de skyobjects dans la base de données
     * @param con
     * @param imageId
     * @return le nombre de skyobjects
     * @throws java.lang.Exception
     */
    public static int size(Connection con, int imageId) throws Exception {
        String queryString = "select count(*) as count from skyobjects "
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
     * Cree et initialise completement SkyObject
     */
    private SkyObject (int id, double ra, double dec, double mag, 
                        String type, String infos, Timestamp date, int imageId) {
        this.id = id;
        this.ra = ra;
        this.dec = dec;
        this.mag = mag;
        this.type = type;
        this.infos = infos;
        this.date = (Timestamp)date.clone();
        this.imageId = imageId;
    }

    // ---------------- les getters (uniquement en lecture) --------------------
    public int getId() {
        return id;
    }

    public Double getRa() {
        return ra;
    }

    public Double getDec() {
        return dec;
    }

    public String getInfos() {
        return infos;
    }

    public Double getMag() {
        return mag;
    }

    public String getType() {
        return type;
    }

    public Timestamp getDate() {
        return date;
    }

    public int getImageId() {
        return imageId;
    }
}