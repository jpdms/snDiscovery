package com.persistence;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 *
 * @author IRISINSTALL
 */
public class Decouverte {
    
    static public boolean exist(Connection con, String userPseudo, String nomImage, String date) throws Exception {
        String queryString =
         "select * FROM decouverte WHERE  userPseudo='" + userPseudo + "' and nomImage='"+nomImage+"' and date='" + date +"'";
        Statement lStat = con.createStatement(
                                            ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                            ResultSet.CONCUR_READ_ONLY);
        ResultSet lResult = lStat.executeQuery(queryString);
        // y en a t'il au moins un ?
        return lResult.next();
    }
}
