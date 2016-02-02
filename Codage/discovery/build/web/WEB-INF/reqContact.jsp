<%-- 
    Document    : ajax_candidate
    Description : retourne par Ajax les infos de la candidate
    Created on  : 7 mai 2014, 13:49:42
    Author      : 
--%>

<%@page import="com.metier.SmtpSend"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.persistence.ConnexionMySQL"%>
<%@page import="com.persistence.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Connection con = (Connection) session.getAttribute("con");
    if (con == null)
        con = ConnexionMySQL.newConnexion();
    session.setAttribute("con", con);
    
    com.metier.DiscoSession maSession = (com.metier.DiscoSession)session.getAttribute("maSession");
    com.persistence.User user = null;
    if (maSession != null) {
        user = maSession.getUser();
    }
    // retourne par Ajax les infos du mail à envoyer
    String nom   = request.getParameter("contactNom");
    String email = request.getParameter("contactEMail");
    String texte = request.getParameter("contactTexte");
    
    String contenu =  "Nom : " + nom + "\n";
    if (user != null) {
        contenu += "Pseudo : " + user.getPseudo() + "\n";
        contenu += "Grade : " + user.getGrade() + "\n";
    }
    contenu += "EMail : " + email + "\n" + "\n\n" + texte + "\n";
    // envoi du mail par gmail
    String to  = User.getByPseudo(con, "admin").getEmail();
    boolean ok = SmtpSend.sendMessage("Demande de contact", contenu, to);
    if (ok) {
        request.getRequestDispatcher("msgCompte.jsp?msg=Message Envoyé").forward(request, response);
    }
    else {
        request.getRequestDispatcher("msgCompte.jsp?msg=Message Non transmis").forward(request, response);
    }
%>