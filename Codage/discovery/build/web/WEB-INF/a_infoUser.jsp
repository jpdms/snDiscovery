<%-- 
    Document   : infoUser
    Created on : 28 mai 2014, 14:54:51
    Author     : jpdms
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.persistence.Utils"%>
<%@page import="com.persistence.User"%>
<%@page import="com.metier.DiscoSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Infos</title>
    <%@include file="../includes/a_head.jspf"%>
</head>

<body>
<div class="page" data-role="page" id="infoUserPage">
    <%@include file="../includes/a_div_header.jspf" %>
        <h1>Compte</h1>
        <%@include file="../includes/a_user.jspf" %>
        <%
            if(!maSession.isModeExpert()){
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        %>
    </div>
    
    <div role="main" id="mainInfoUser" class="ui-content">
        <br/><br/>
        <br/>
                <div>
            <%
                if(!maSession.isModeExpert()){
                    request.getRequestDispatcher("discovery.jsp?action=pbAdminMode").forward(request, response);
                }
                String message = request.getParameter("message");
                if (message != null) {
                    if (message.equalsIgnoreCase("pbAdmin")) {
                        out.print("Vous ne pouvez pas accéder au mode administrateur !");
                    }
                    if (message.equalsIgnoreCase("pbAdminMode")) {
                        out.print("Vous n'êtes pas en mode administrateur ! Seules les personnes en mode administrateur peuvent accéder a cette page.");
                    }
                }
            %>
        </div>
        <%
            user = maSession.getUser();
        %>
        <h4>Bienvenue dans le mode administrateur.</h4>
        <h1>Attention ceci est une bêta.</h1>
        <h3>Aucune action ne modifie la base de donnée.</h3>
        <h3>Informations sur votre compte :</h3>
        <div>
            <table style="margin-left:5%">
                    <tr>
                        <td><strong>Pseudo :</strong></td><td>&emsp;&emsp;<%= user.getPseudo() %></td>
                    </tr>
                    <tr>
                        <td><strong>Nom :</strong></td><td>&emsp;&emsp;<%= user.getUsername() %></td>
                    </tr>
                    <tr>
                        <td><strong>EMail :</strong></td><td>&emsp;&emsp;<%= user.getEmail() %></td>
                    </tr>
                    <tr>
                        <td><strong>Grade :</strong></td><td>&emsp;&emsp;<%= user.getGrade() %></td>
                    </tr>
                    <tr>
                        <td><strong>Première Visite : </strong></td><td>&emsp;&emsp;<%=new SimpleDateFormat("EEEEEEEE dd MMMMMMMMM yyyy à HH:mm").format(user.getRegisterDate())%></td>
                    </tr>
                    <tr>
                        <td><strong>Dernière Visite : </strong></td><td>&emsp;&emsp;<%=new SimpleDateFormat("EEEEEEEE dd MMMMMMMMM yyyy à HH:mm").format(maSession.getLastVisitDate())%></td>
                    </tr>
                    <tr>
                        <td><strong>Nombre total de connexions :</strong></td><td>&emsp;&emsp;<%= user.getNbConnexions() %></td>
                    </tr>
                    <tr>
                        <td><strong>Nombre de candidates : </strong></td><td>&emsp;&emsp;<%= user.getNbCandidates() %></td>
                    </tr>                
                    <tr>
                        <td><strong>Nombre de découvertes : </strong></td><td>&emsp;&emsp;0</td>
                    </tr>
            </table>
        </div>
        <%
        if(user.getGrade()==5){
        %>
                <a href="discovery.jsp?action=decoadmin"
                       data-ajax="false" class="ui-btn ui-shadow ui-corner-all ui-btn-a">
                    Sortir du mode administrateur !
                </a><br/><br/>
        <% 
        }
        %>
    </div>

    <%@include file="../includes/a_footer.jspf" %>
</div>
</body>
</html>
