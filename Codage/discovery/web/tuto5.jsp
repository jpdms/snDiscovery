<%-- 
    Document   : site
    Created on : 05 Mai 2014, 16:54:26
    Author     : 
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Tuto5</title>
    <%@include file="includes/head.jspf" %>
</head>
<body>

<div class="page" data-role="page" id="tuto5Page">
    <%@include file="includes/tutoheader.jspf" %>
    
    <div role="main" class="ui-content">
        <br/><br/>
        <p>Autres causes d'artéfacts.</p>
        <img class="tuto2Img" src="images/tuto16.jpg">
        <div class="tuto2Txt">Cosmique</div>
        <br/>
        
        <img class="tuto2Img" src="images/tuto17.jpg">
        <div class="tuto2Txt">Cosmique</div>
        <br/>
        
        <img class="tuto2Img" src="images/tuto18.jpg">
        <div class="tuto2Txt">Deux cosmiques sur la même image</div>
        <br/>
        
        <img class="tuto2Img" src="images/tuto19.jpg">
        <div class="tuto2Txt">Pixels chauds</div>
        <br/>
        
        <img class="tuto2Img" src="images/tuto20.jpg">
        <div class="tuto2Txt">Cosmique qui change de direction</div>
        <br/>
        
        <img class="tuto2Img" src="images/tuto21.jpg">
        <div class="tuto2Txt">Satellite ou cosmique ?</div>
        <br/>
        
        <p><a href="tuto6.jsp" class="ui-btn ui-shadow ui-corner-all">Page 6</a></p>
    </div>

    <%@include file="includes/footer.jspf" %>
</div>
</body>
</html>
