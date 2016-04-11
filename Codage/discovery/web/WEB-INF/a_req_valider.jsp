<%-- 
    Document   : reqChangerProfil
    Created on : 4 févr. 2014, 08:35:12
    Author     : jpdms
--%>

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
    
    String pseudo  = request.getParameter("userDisco");
    String objet     = request.getParameter("objet");
    String contenu     = request.getParameter("contenu");
    String nomImage     = request.getParameter("nomImage");
    String chemin     = request.getParameter("chemin");
    String dateDecouverte     = request.getParameter("dateDecouverte");
    String x = request.getParameter("x");
    String y = request.getParameter("y");
    User uMod = User.getByPseudo(con, pseudo);
    // mod grade
    // lui envoyer le mail de confirmation
    String mail = contenu;
    String to = uMod.getEmail();
    boolean ok = SmtpSend.sendMessage(objet, mail, to);  
    if (ok) {
        uMod.save(con); 
        // ajout decouverte dans BDD
        String queryString =
         "INSERT INTO `decouverte` (`userPseudo`, `nomImage`, `chemin`, `date`, `x`, `y`) "
         + "VALUES ("+Utils.toString(pseudo)+","
                + ""+Utils.toString(nomImage) +","
                + ""+Utils.toString(chemin) +","
                + ""+Utils.toString(dateDecouverte)+","
                + ""+Utils.toString(x)+","
                + ""+Utils.toString(y)+")";
        Statement lStat = con.createStatement();
        lStat.executeUpdate(queryString, Statement.NO_GENERATED_KEYS);
        request.getRequestDispatcher("../discovery.jsp?action=validerSupernova_confirme&msg=Le mail a correctement été envoyé et la supernova correctement validé.").forward(request, response);
    }
    else {
        request.getRequestDispatcher("../discovery.jsp?action=validerSupernova_confirme&msg=Le mail n'a pas été correctement envoyé et la supernova n'a pas été correctement validé.").forward(request, response);
    }
    
%>