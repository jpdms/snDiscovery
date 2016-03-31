/* Copyright LVH COLOMIERS */
package com.metier;

import com.persistence.*;
import java.sql.*;
import java.util.Calendar;

/**
 * Application : classe métier d'accès aux données persistantes
 */
public class DiscoSession {
    /** * keep the Singleton instance */
    private Connection con;
    private User user;
    private Timestamp lastVisitDate;
    private boolean modeExpert;
    
    // empèche l'instanciation publique par défaut
    private DiscoSession() throws Exception { }
        
    /**
     * Lobjet session pour un utilisateur connecté
     * @param con
     * @param user      l'utilisateur connecté
     */
    public DiscoSession(Connection con, User user) {
        try {
            this.con = con;
            this.user = user;
            this.lastVisitDate = user.getLastVisitDate();
            
            Timestamp currentTimestamp = 
             new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
            // la date courante est rangée dans la BD du user
            user.setLastVisitDate(currentTimestamp);
            user.setNbConnexions(user.getNbConnexions() + 1);
            // svgd ds la BD
            user.save(con);
            modeExpert = false;
        } catch (Exception ex) { }
    }

    public User getUser() {
        return user;
    }

    public Timestamp getLastVisitDate() {
        return lastVisitDate;
    }
    
    public boolean isModeExpert() {
        return modeExpert;
    }
    
    public void setModeExpert(boolean mode) {
        modeExpert = mode;
    }
}


