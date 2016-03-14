/* Copyright LVH COLOMIERS */
package com.persistence;

import java.sql.*;

/**
 * Singleton instance that gives the connection to the database
 * @author  LVH
 * @since   02/2014 
 * 
 * @version 0.1.0
 *
 */
public class ConnexionMySQL {
// ---------------------------------------------------------------------
//                          MySQL changes
// ---------------------------------------------------------------------
    /** driverDst : MySQl driver  */
    private static String driver    = "com.mysql.jdbc.Driver";
    /** url : ConnexionMySQL URL */
    //private static String url       = "jdbc:mysql://localhost:3306/galaxia?useUnicode=true&characterEncoding=utf-8";
    private static String url       = "jdbc:mysql://localhost:3306/galaxia?zeroDateTimeBehavior=convertToNull";
// ---------------------------------------------------------------------
    /** userName : sndiscovery */
    private static String userName  = "sndiscovery";
    /** password : discoNovae31 */
    private static String password  = "discoNovae31";
    /** destination connection on the database */
    private static Connection conn  = null;
    
    private ConnexionMySQL() throws Exception { }
    
    /**
     * getter for the ConnexionMySQL instance
     * @return the ConnexionMySQL instance
     * @throws java.lang.Exception
     */    
    public static Connection getInstance() throws Exception  {
       if (conn == null) {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url, userName, password);
        }
        return conn;
    }
    
    public static Connection newConnexion() throws Exception {
        Connection _conn = null;
        Class.forName(driver).newInstance();
        conn = DriverManager.getConnection(url, userName, password);
        return conn;
    }
}
