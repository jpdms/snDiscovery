<%-- 
    Document   : reqChangerProfil
    Created on : 4 févr. 2014, 08:35:12
    Author     : jpdms
--%>

<%@page import="com.metier.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.persistence.*"%>
<%@page pageEncoding="UTF-8"%>

<jsp:useBean id="monAppli" scope="application" class="com.metier.DiscoApplication"/>
<%
    Connection con = (Connection) session.getAttribute("con");
    if (con == null)
        con = ConnexionMySQL.newConnexion();
    session.setAttribute("con", con);
    
    String newNom = request.getParameter("cmdpNom");
    String newEMail = request.getParameter("cmdpEMail");
    String newPassword = request.getParameter("cmdpNewPassword");
    String newPasswordVerif = request.getParameter("cmdpVerifPassword");
    DiscoSession maSession = (DiscoSession)session.getAttribute("maSession");
    User user = maSession.getUser();
    if (user != null) {
        boolean changement = false;
        // changement de Nom
        if (!newNom.equals("")) {
            user.setUsername(newNom);
            changement = true;
        }
        // changement de EMail
        if (!newEMail.equals("")) {
            user.setEmail(newEMail);
            changement = true;
        }
        // changement de Mot de Passe
        if (!newPassword.equals("") && newPassword.equals(newPasswordVerif)) {
            // on encrypte le mot de passe
            user.setPassword(com.persistence.Utils.encryptPassword(newPassword));
            changement = true;
        }
        if (changement) {
            user.save(con);
        }
        request.getRequestDispatcher("infoUser.jsp").forward(request, response);
    }
    else {
        // délie tous les objets liés à cette session
        session.invalidate();
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
%>