<%-- 
    Document   : site
    Created on : 05 Mai 2014, 16:54:26
--%>
<%@page import="com.persistence.Utils"%>
<%@page import="com.persistence.Actu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Actualités</title>
    <%@include file="includes/head.jspf" %>
</head>

<body>
<div class="page" data-role="page" id="actuPage">
    <%@include file="includes/div_header.jspf" %>
        <h1>Actualités</h1>
        <%@include file="includes/user.jspf" %>
    </div>
    
    <div role="main" class="ui-content">
        <br/><br/>
        <div data-role="collapsibleset" data-corners="false" data-theme="a" 
             data-content-theme="a" data-mini="true">
            <%
                int nbActus = Actu.size(con);
                for (int i = 1; i <= nbActus; i++) {
                    Actu actu = Actu.find(con, i);
                    out.println("<div data-role='collapsible' data-collapsed-icon='carat-d' "
                                       + "class='ui-alt-icon' data-expanded-icon='carat-u'>");
                    out.print("<h4>");
                    out.print(Utils.formatDate(actu.getDate()) + " - " + actu.getTitre());
                    out.println("</h4>");
                    out.print("<p>");
                    out.print(actu.getContenu());
                    out.println("</p>");
                    out.println("</div>");
                }
            %>
        </div>
    </div>

    <%@include file="includes/footer.jspf" %>
</div>
</body>
</html>