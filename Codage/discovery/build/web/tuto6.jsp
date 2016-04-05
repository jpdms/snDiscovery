<%-- 
    Document   : site
    Created on : 05 Mai 2014, 16:54:26
    Author     : 
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Tuto6</title>
    <%@include file="includes/head.jspf" %>
</head>

<body>
<div class="page" data-role="page" id="tuto6Page">
    <%@include file="includes/tutoheader.jspf" %>
    
    <div role="main" class="ui-content">
        <br/><br/>
        <p>Autres causes d'artéfacts. Comparaison avec une image de la veille.</p>
        <img class="tuto3Img" src="images/tuto30.jpg">
        <div class="tuto2Txt">Cette trace est la somme des positions d'un astéroïde
                                                        de magnitude 16.5</div>
        <br/>
        
        <img class="tuto3Img" src="images/tuto31.jpg">
        <div class="tuto2Txt">Événement cosmique très rare, car ça ressemble à une vraie
            étoile. Cependant, on remarque que la forme n'est pas tout à fait celle 
                                              des autres étoiles du champ</div>
        <br/>
        
        <img class="tuto3Img" src="images/tuto32.jpg">
        <div class="tuto2Txt">Probablement une étoile filante (micrométéorite)</div>
        <br/>
        
        <img class="tuto3Img" src="images/tuto33.jpg">
        <div class="tuto2Txt">Astéroïde (5849) 1990 HF1 magnitude 16.4</div>
        <br/>
        
        <p><a href="introtest.jsp" class="ui-btn ui-shadow ui-corner-all">Evaluation</a></p>
    </div>

    <%@include file="includes/footer.jspf" %>
</div>
</body>
</html>
