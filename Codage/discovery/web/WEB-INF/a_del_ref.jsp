<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.metier.*"%>
<%@page import="com.persistence.*"%>
<%@page pageEncoding="UTF-8"%>
<jsp:useBean id="monAppli" scope="application" class="com.metier.DiscoApplication"/>
<%
    Connection con = (Connection) session.getAttribute("con");
    if (con == null)
        con = ConnexionMySQL.newConnexion();
    session.setAttribute("con", con);
    com.metier.DiscoSession maSession = (com.metier.DiscoSession)session.getAttribute("maSession");
    if (maSession == null) {  
        request.getRequestDispatcher("discovery.jsp?action=pbAdminMode").forward(request, response);
    }
    String userPseudo = request.getParameter("userPseudo").trim();
    String cheminref = request.getParameter("cheminref").trim();
    String chemin = request.getParameter("chemin").trim();
    String queryString = "delete from canreference "
            + " where userPseudo='" + userPseudo  + "'"
                + " and chemin='" + chemin + "'";
    Statement lStat = con.createStatement();
    lStat.executeUpdate(queryString);
    request.getRequestDispatcher("../discovery.jsp?action=aRefMsgDel").forward(request, response);
%>