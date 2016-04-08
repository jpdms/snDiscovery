<%-- 
    Document   : site
    Created on : 05 Mai 2014, 16:54:26
    Author     : 
--%>
<%@page import="com.persistence.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Information</title>
    <%@include file="../includes/a_head.jspf" %>
</head>

<body>
<div class="page" data-role="page" id="homePage">
    <%@include file="../includes/a_div_header.jspf" %>
        <h1>Compte</h1>
        <%@include file="../includes/a_user.jspf" %>
    </div>
    <div role="main" class="ui-content">
        <br/><br/>
        <br/><br/><br/><br/>
        <%
            User uMod = User.getByPseudo(con, request.getParameter("pseudo"));
            int grade = Integer.parseInt(request.getParameter("grade"));
            uMod.setGrade(grade);
            uMod.save(con);
        %>
        <div class="centrer"><h1>Le grade de <%= request.getParameter("pseudo") %> a été changer.</h1></div>
        <br/><br/>
        <a href="discovery.jsp?action=gestioncompte&pseudo=<%= request.getParameter("pseudo") %>" data-ajax="false"
                     class="ui-btn ui-shadow ui-corner-all ui-btn-a"> OK </a>
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