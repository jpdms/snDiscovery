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
    String mail   = request.getParameter("MailPseudoPerdu");
    String pseudo = User.getPseudoByMail(con, mail);
    if(pseudo != null){
    User u = User.getByPseudo(con, pseudo);
    String contenu = "Bonjour " + u.getUsername() + ".\n\n"
                    + "Vous avez lancé une requête pour retrouver votre pseudo."
                    + "\nVotre pseudo est " + u.getPseudo()
                    + "\nN'oubliez pas de le noter quelque part."
                    + "\n\nÀ bientôt à la découverte de Supernovae :)";
    // envoi du mail par gmail
    boolean ok = SmtpSend.sendMessage("Votre pseudo", contenu, mail);
    if (ok) {
        request.getRequestDispatcher("msgCompte.jsp?msg=Pseudo envoyé").forward(request, response);
    }
    else {
        request.getRequestDispatcher("msgCompte.jsp?msg=Message Non transmis").forward(request, response);
    }
    }
    else{
        request.getRequestDispatcher("msgCompte.jsp?msg=Aucun compte n'est associé a cette e-mail.").forward(request, response);
    }
%>