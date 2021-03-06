<%-- 
    Document    : introtest.jsp
    Description : Page d'introduction à la validation
    Created on  : 05 Mai 2014, 16:54:26
    Author      : 
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Test1</title>
    <%@include file="includes/head.jspf" %>
</head>

<body>
<div class="page" data-role="page" id="introTestPage">
    <%@include file="includes/tutoheader.jspf" %>
    
    <div role="main" class="ui-content">
        <div class="centrer">Tutoriel</div><br/><br/>
        Ce test, s'il est réussi, va vous permettre de vous inscrire. 
        Ainsi, vous pourrez soumettre des images candidates à nos experts.<br/><br/>
        Mais vous devez faire moins de 3 fautes.<br/><br/>
        La durée du test n'est pas limitée.<br/><br/>
        Commençons de suite !<br/><br/>
        
        <p><a href="evaluation.jsp" class="ui-btn ui-shadow ui-corner-all">
            Le test
        </a></p>
    </div>

    <%@include file="includes/footer.jspf" %>
</div>
</body>
</html>
