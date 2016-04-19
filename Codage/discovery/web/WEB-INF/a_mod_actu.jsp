<%-- 
    Document    : traitement du QCM
    Description : retourne par Ajax si le test est réussi ou non
    Created on  : 16 Juin 2014, 15:40:42
    Author      : 
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.persistence.Actu"%>
<%@page import="java.lang.Integer"%>
<%@page import="com.persistence.ConnexionMySQL"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.persistence.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%    
    Connection con = (Connection) session.getAttribute("con");
    if (con == null)
        con = ConnexionMySQL.newConnexion();
    session.setAttribute("con", con);
    com.metier.DiscoSession maSession = (com.metier.DiscoSession)session.getAttribute("maSession");
    if (maSession == null) {  
        request.getRequestDispatcher("discovery.jsp?action=pbAdminMode").forward(request, response);
    }
    int id = Integer.parseInt(request.getParameter("id"));
    Actu actu = Actu.getById(con, id);
    
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Actu</title>

<meta charset="utf-8">

<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1">

<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<link rel="apple-touch-icon" href="images/apple-touch-icon-57x57.png"/>
<link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-72x72.png"/>
<link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x114.png"/>
<link rel="icon" href="images/apple-touch-icon-57x57.png" />
<link rel="stylesheet" href="js/jquery.mobile/jquery.mobile-1.4.5.min.css">

<%-- theme personnalisé à cette adresse :
http://themeroller.jquerymobile.com
--%>
<link rel="stylesheet" href="css/themes/discoRed.css" />
<link rel="stylesheet" href="css/themes/jquery.mobile.icons.min.css" />
<link rel="stylesheet" href="css/disco1.css">

<script type="text/javascript" src="js/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/jquery.mobile/jquery.mobile-1.4.5.min.js"></script>
</head>

<body>
<div class="page" data-role="page" id="homePage">
    <%@include file="../includes/a_div_header.jspf" %>
        <h1>Actu</h1>
        <%@include file="../includes/a_user.jspf" %>
    </div>
    <div role="main" class="ui-content">
        <br/><br/>
        <br/><br/><br/><br/>
        <div class="centrer"><h3>Modifier l'actualité :</h3>
        <strong>Titre:</strong>
        <form id="formModActu" method="post" action="discovery.jsp?action=reqModActu">
            <input name="id" id="id" type="hidden" value="<%=actu.getId()%>"/>
            <textarea style="FONT-FAMILY: Verdana" rows=1 name="titre" placeholder="Titre"><%=actu.getTitre()%></textarea>
         <br>
         <strong>Contenu:</strong> 
            <textarea style="FONT-FAMILY: Verdana" rows=5 name="contenu" placeholder="Rédigez ici"><%=actu.getContenu()%></textarea>
            <p>La balise < br/ > permet le retour a la ligne.</p>
            <a href="javascript:{}" onclick="document.getElementById('formModActu').submit();" id="btnEnvoyer" data-position-to="window" 
                class="ui-btn ui-corner-all ui-shadow">
                Modifier
            </a>
            <a href="discovery.jsp?action=aActu" id="btnEnvoyer" data-position-to="window" 
                class="ui-btn ui-corner-all ui-shadow">
                Annuler
            </a>
        </form>
        </div>
        
        <br/><br/>
        <br/>
        <br/><br/>
        <br/><br/>
        <br/><br/>
        <br/><br/>
        <br/><br/>
        <br/><br/>
    </div>
    
    <%@include file="../includes/a_footer.jspf" %>
</div>
</body>
</html>