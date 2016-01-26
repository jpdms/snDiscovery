<%-- 
    Document    : infosGalaxie
    Description : retourne par Ajax les infos de la galaxie concernée
    Created on  : 7 mai 2014, 13:49:42
    Author      : 
--%>

<%@page import="java.sql.Connection"%>
<%@page import="com.persistence.ConnexionMySQL"%>
<%@page import="com.persistence.Galaxie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Connection con = (Connection) session.getAttribute("con");
    if (con == null)
        con = ConnexionMySQL.newConnexion();
    session.setAttribute("con", con);
    
    // retourne par Ajax les infos de la galaxie concernée
    String nomGalaxie = request.getParameter("nom");
    Galaxie galaxie = Galaxie.getByName(con, nomGalaxie);
    out.println(
                    galaxie.getNom() 
            + '|' + galaxie.getCategorie()
            + '|' + galaxie.getInformations()
            + '|' + galaxie.getNbSupernovae()
            + '|' + galaxie.getRa()
            + '|' + galaxie.getDec()
            + '|' + galaxie.getDist()
            + '|' + galaxie.getMag()
    );
%>