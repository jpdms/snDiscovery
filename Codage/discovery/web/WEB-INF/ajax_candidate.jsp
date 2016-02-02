<%-- 
    Document    : ajax_candidate
    Description : retourne par Ajax les infos de la candidate
    Created on  : 7 mai 2014, 13:49:42
    Author      : 
--%>

<%@page import="java.sql.Connection"%>
<%@page import="com.persistence.ConnexionMySQL"%>
<%@page import="com.persistence.User"%>
<%@page import="com.persistence.Candidate"%>
<%@page import="com.metier.SmtpSend"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Connection con = (Connection) session.getAttribute("con");
    if (con == null)
        con = ConnexionMySQL.newConnexion();
    session.setAttribute("con", con);
    
    // retourne par Ajax les infos de la galaxie concernée
    String nomGalaxie = request.getParameter("nomGalaxie");
    String chemin = request.getParameter("chemin");
    int certitude = Integer.parseInt(request.getParameter("certitude"));
    int xPos = Integer.parseInt(request.getParameter("xPos"));
    int yPos = Integer.parseInt(request.getParameter("yPos"));
    
    com.metier.DiscoSession maSession = (com.metier.DiscoSession)session.getAttribute("maSession");
    if (maSession != null) {
        com.persistence.User user = maSession.getUser();
        String userPseudo = user.getPseudo();
        
        if (!Candidate.isCandidateExiste(con, userPseudo, nomGalaxie, chemin)) {
            user.setNbCandidates(user.getNbCandidates() + 1);
            user.save(con);
            // crée et sauve la candidate dans la BD
            Candidate.create(con, userPseudo, nomGalaxie, chemin, certitude, xPos, yPos, 0, 0);
            // après svgd ds la BD, on envoie le mail aux experts !
            String contenu = "Pseudo : " + userPseudo;
            contenu += "\nEMail : "      + user.getEmail();
            contenu += "\nGrade : "      + user.getGrade();
            contenu += "\nCertitude : "  + certitude;
            contenu += "\nNomGalaxie : " + nomGalaxie;
            contenu += "\nChemin : "     + chemin;
            contenu += "\nXPos : "       + xPos;
            contenu += "\nYPos : "       + yPos;
            contenu += "\nImage : 250x250";
            String titre = "Candidate sur " + chemin + nomGalaxie;
            // envoi du mail par gmail
            
            String to  = User.getByPseudo(con, "admin").getEmail();
            boolean ok = SmtpSend.sendMessage(titre, contenu, to);
            if (ok)
                out.print("La candidate sur " + nomGalaxie + " sera vue par les experts");
            else
                out.print("Impossible de transmettre votre candidate !");
        }
        else {
            // attente nécessaire pour que la popup marche et utile pour le user
            Thread.sleep(3000);
            out.print("Inutile de soumettre deux fois la candidate " + nomGalaxie + " !");
        }
    }
%>