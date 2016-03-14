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
    String nom   = request.getParameter("motDePassePerduPseudo");
    if(!User.isPseudoUsed(con, nom)){
        request.getRequestDispatcher("msgCompte.jsp?msg=Le pseudo n'existe pas.").forward(request, response);
    }
    User u = User.getByPseudo(con, nom);
    String email = u.getEmail();
    String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    String pass = "";
    for(int x=0;x<8;x++)
    {
       int i = (int)Math.floor(Math.random() * chars.length());
       pass += chars.charAt(i);
    }
    String contenu = "Bonjour Mme/Mr " + u.getUsername() + " ! \n\n"
                    + "Votre avez lancez une requête pour changer votre mot de passe."
                    + "\nVotre pseudo est " + u.getPseudo()
                    + "\nVotre nouveau mot de passe est : " + pass
                    + "\nN'oubliez pas de le changer !"
                    + "\nSi vous n'avez pas demander ce changement contactez un administrateur au plus vite !"
                    + "\n\nA bientôt à la découverte de Supernovae :)";
    // envoi du mail par gmail
    pass = com.persistence.Utils.encryptPassword(pass);
    u.setPassword(pass);
    boolean ok = SmtpSend.sendMessage("Nouveau mot de passe", contenu, email);
    if (ok) {
        u.save(con);
        request.getRequestDispatcher("msgCompte.jsp?msg=Nouveau mot de passe envoyé").forward(request, response);
    }
    else {
        request.getRequestDispatcher("msgCompte.jsp?msg=Message Non transmis").forward(request, response);
    }
%>