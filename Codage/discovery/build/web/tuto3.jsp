<%-- 
    Document   : site
    Created on : 05 Mai 2014, 16:54:26
    Author     : 
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Tuto3</title>
    <%@include file="includes/head.jspf" %>
</head>

<body>
<div class="page" data-role="page" id="tuto3Page">
    <%@include file="includes/tutoheader.jspf" %>
    
    <div role="main" class="ui-content">
        <br/><br/>
        <p>Différentes causes d'artéfacts. Il faut savoir les reconnaître.</p>
        <img class="tuto2Img" src="images/tuto03.jpg">
        <div class="tuto2Txt">Passage d'un satellite artificiel au cours de la pose.</div>
        <br/>
        
        <img class="tuto2Img" src="images/tuto04.jpg">
        <div class="tuto2Txt">Dédoublement des étoiles dû au mauvais recentrage 
            des poses pour synthétiser l'image finale de la galaxie.</div>
        <br/>
        
        <img class="tuto2Img" src="images/tuto05.jpg">
        <div class="tuto2Txt">Colonne de pixels défectueux.</div>
        <br/>
        
        <img class="tuto2Img" src="images/tuto06.jpg">
        <div class="tuto2Txt">Cosmique sous forme d'une trainée courte et fine.</div>
        <br/>
        
        <img class="tuto2Img" src="images/tuto07.jpg">
        <div class="tuto2Txt">Pixels chauds. Ils n'ont pas d'étalement comme les étoiles.</div>
        <br/>
        
        <img class="tuto2Img" src="images/tuto08.jpg">
        <div class="tuto2Txt">Passages de satellites géostationnaires. Traînées
            horizontales aux déclinaisons voisines de +4° au Chili et -6° à Calern.</div>
        <br/>
        
        <p><a href="tuto4.jsp" class="ui-btn ui-shadow ui-corner-all">Page 4</a></p>
    </div>
    
    <%@include file="includes/footer.jspf" %>
</div>
</body>
</html>
