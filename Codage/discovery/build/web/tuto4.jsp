<%-- 
    Document   : site
    Created on : 05 Mai 2014, 16:54:26
    Author     : 
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Tuto4</title>
    <%@include file="includes/head.jspf" %>
</head>

<body>
<div class="page" data-role="page" id="tuto4Page">
    <%@include file="includes/tutoheader.jspf" %>
    
    <div role="main" class="ui-content">
        <br/><br/>
        <p>Autres causes d'artéfacts.</p>
        <img class="tuto2Img" src="images/tuto09.jpg">
        <div class="tuto2Txt">Blooming et branche de diffraction d'une
                                                étoile brillante proche</div>
        <br/>
        
        <img class="tuto2Img" src="images/tuto10.jpg">
        <div class="tuto2Txt">Branche de diffraction d'une étoile brillante proche</div>
        <br/>
        
        <img class="tuto2Img" src="images/tuto11.jpg">
        <div class="tuto2Txt">Blooming (bavure toujours verticale) d'une étoile brillante proche</div>
        <br/>
        
        <img class="tuto2Img" src="images/tuto12.jpg">
        <div class="tuto2Txt">Petit cosmique (en haut à droite)</div>
        <br/>
        
        <img class="tuto2Img" src="images/tuto13.jpg">
        <div class="tuto2Txt">Groupe de pixels défectueux</div>
        <br/>
        
        <img class="tuto2Img" src="images/tuto14.jpg">
        <div class="tuto2Txt">Groupe de pixels défectueux (difficile à diagnostiquer)</div>
        <br/>
        
        <p><a href="tuto5.jsp" class="ui-btn ui-shadow ui-corner-all">Page 5</a></p>
    </div>
    
    <%@include file="includes/footer.jspf" %>
</div>
</body>
</html>
