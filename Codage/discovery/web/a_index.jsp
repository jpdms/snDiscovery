<%-- 
    Document   : site
    Created on : 05 Mai 2014, 16:54:26
    Author     : 
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Acceuil</title>
    <%@include file="includes/a_head.jspf" %>
</head>

<body>
<div class="page" data-role="page" id="homePage">
    <%@include file="includes/div_header.jspf" %>
        <h1>Accueil</h1>
        <%@include file="includes/a_user.jspf" %>
    <%
        if(!maSession.getCssReload()){
            maSession.setCssReload(true);
            %>
            <script>
                window.location.reload();
            </script>
        <%
        }
        if(!maSession.isModeExpert()){
            request.getRequestDispatcher("discovery.jsp?action=pbAdminMode").forward(request, response);
        }
    %>
    </div>
    
    <div role="main" class="ui-content">
        <br/><br/>
        <h4>Bienvenue dans le mode administrateur.</h4>
        <br/>
        <center><p class="mini">V1.00 - 20 Septembre 2015<br/>
                                V2.00 - 18 mai 2016<br/>
                (Développement : BTS SNIR Lycée V. Hugo Colomiers 31)</p></center>
    </div>
    
    <%@include file="includes/a_footer.jspf" %>
</div>
</body>
</html>