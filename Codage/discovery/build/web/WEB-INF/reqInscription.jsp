<%-- 
    Document   : reqChangerProfil
    Created on : 4 févr. 2014, 08:35:12
    Author     : jpdms
--%>

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
    
    String pseudo   = request.getParameter("inscriptionPseudo");
    String nom      = request.getParameter("inscriptionNom");
    String eMail    = request.getParameter("inscriptionEMail");
    String password = request.getParameter("inscriptionPassword");
    
    if (User.isPseudoUsed(con, pseudo)) {
        request.getRequestDispatcher("inscription.jsp?message=pbPseudo").forward(request, response);
    }
    else if (User.isMailUsed(con, eMail)) {
        request.getRequestDispatcher("inscription.jsp?message=pbEmail").forward(request, response);   
    }
    else {
        String cPassword = com.persistence.Utils.encryptPassword(password);
        User user = User.create(con, pseudo, nom, eMail, cPassword);
        if (user != null) {
            // lui envoyer le mail de confirmation
            String contenu = "Bonjour,\n\n"
                    + "nous somme heureux de vous acceuillir sur le site "
                    + "de snDiscovery.\n"
                    + "&pseudo=" + user.getPseudo()
                    + "&code=" + user.getPassword()
                    + "\n\nA bientôt à la découverte de Supernovae";
            String to = user.getEmail();
            boolean ok = SmtpSend.sendMessage("Demande d'inscription sur snDiscovery", contenu, to);  
            if (ok) {
                request.getRequestDispatcher("msgCompte.jsp?msg=Vous etes inscrit. Merci.").forward(request, response);
            }
            else {
                request.getRequestDispatcher("msgCompte.jsp?msg=Problème d'inscription").forward(request, response);
            }
        }
        else {                   // délie tous les objets liés à cette session
            session.invalidate();
            request.getRequestDispatcher("inscription.jsp?message=pbInscription").forward(request, response);
        }
    }
    
%>