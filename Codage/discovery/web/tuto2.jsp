<%-- 
    Document   : site
    Created on : 05 Mai 2014, 16:54:26
    Author     : 
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Tuto2</title>
    <%@include file="includes/head.jspf" %>
</head>

<body>
<div class="page" data-role="page" id="tuto2Page">
    <%@include file="includes/tutoheader.jspf" %>
    
    <div role="main" class="ui-content">
        <br/><br/>
        <p>Cette application vous présente les images acquises par les télescopes :<br/>
            Vous avez sur votre écran deux images :</p>
        <div class="tutoImg">
            <img src="images/tuto01.jpg" />
            <img src="images/tuto02.jpg" />
        </div>
        <div class="ui-grid-d">
            <div class="ui-block-a"></div>
            <div class="ui-block-b"><p>Observée</p></div>
            <div class="ui-block-c"></div>
            <div class="ui-block-d"><p>Référence</p></div>
            <div class="ui-block-e"></div>
        </div>
        <p>En général, l'image est centrée sur la galaxie observée.<br/>
        Dans cet exemple, l'image de gauche présente une supernova (nouvelle 
        étoile à droite du centre de la galaxie).<br/>
        Avant de soumettre une image candidate, assurez-vous bien que ce n'est pas
        autre chose. Par observation des jours précédents, par exemple.<br/>
        A la prochaine page, nous allons vous montrer que ce n'est pas si simple 
        de faire un choix !</p>
        <p><a href="tuto3.jsp" class="ui-btn ui-shadow ui-corner-all">Page 3</a></p>
    </div>

    <%@include file="includes/footer.jspf" %>
</div>
</body>
</html>
