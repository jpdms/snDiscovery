<%-- 
    Document    : infosGalaxie
    Description : Retourne par Ajax les 6 dernières images d'une galaxie  
    Created on  : 7 mai 2014, 13:49:42
    Author      : 
--%>

<%@page import="com.persistence.ConnexionMySQL"%>
<%@page import="com.persistence.Image"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Connection con = (Connection) session.getAttribute("con");
    if (con == null)
        con = ConnexionMySQL.newConnexion();
    session.setAttribute("con", con);
    
    // retourne par Ajax les 6 dernières images d'une galaxie
    String nomGalaxie = request.getParameter("nom");
    ArrayList<String> dernieresImages = Image.getDernieresImages(con, nomGalaxie);
    for (int i = 0; i < dernieresImages.size(); i++) {
        String image = dernieresImages.get(i);
        String telescope = image.substring(0, 1);
        String date = image.substring(2, image.length());
        if (i < dernieresImages.size() - 1)
            out.print(telescope + ' ' + date + '|' );
        else
            out.print(telescope + ' ' + date);
    }
    out.println();
%>