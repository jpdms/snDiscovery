<%-- 
    Document   : site
    Created on : 05 Mai 2014, 16:54:26
    Author     : 
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Information</title>
    <%@include file="includes/head.jspf" %>
</head>

<body>
<div class="page  ui-page-theme-b" data-role="page" id="homePage">
    <%@include file="includes/div_header.jspf" %>
        <h1>Compte</h1>
        <%@include file="includes/user.jspf" %>
    </div>
    <div role="main" class="ui-content">
        <br/><br/>
        <br/><br/><br/><br/>
        <div class="centrer"><h1><%= request.getParameter("msg") %></h1></div>
        <br/><br/>
        <a href="disco.jsp"
                     class="ui-btn ui-shadow ui-corner-all ui-btn-a"> OK </a>
        <br/>
        <br/><br/>
        <br/><br/>
        <br/><br/>
        <br/><br/>
        <br/><br/>
        <br/><br/>
    </div>
    
    <%@include file="includes/footer.jspf" %>
</div>
</body>
</html>