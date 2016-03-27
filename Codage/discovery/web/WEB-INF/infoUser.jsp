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
    <%@include file="../includes/head.jspf"%>
</head>

<body>
<div class="page" data-role="page" id="infoUserPage">
    <%@include file="../includes/div_header.jspf" %>
        <h1>Compte</h1>
        <%@include file="../includes/user.jspf" %>
    </div>
    
    <div role="main" id="mainInfoUser" class="ui-content">
        <br/><br/>
        <br/>
                <div>
            <%
                if(maSession.getCssReload()){
                    maSession.setCssReload(false);
                    %>
                    <script>
                        window.location.reload();
                    </script>
                <%
                }
                String message = request.getParameter("message");
                if (message != null) {
                    if (message.equalsIgnoreCase("pbAdmin")) {
                        out.print("Vous ne pouvez pas accéder au mode administrateur !");
                    }
                }
            %>
        </div>
        <%
            maSession = (DiscoSession)session.getAttribute("maSession");
            user = maSession.getUser();
        %>
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
        
        <br/>
        <a href="discovery.jsp?action=changerProfil"
               class="ui-btn ui-shadow ui-corner-all ui-btn-a">
            Modifier
        </a>
        <a href="discovery.jsp?action=contact" data-theme="a" 
          class="ui-btn ui-shadow ui-corner-all ui-btn-a">
            Contacter l'administrateur !
        </a>
        <%
        if(user.getGrade()==5){
        %>
                <br/><br/>
                <a href="discovery.jsp?action=reqAdmin"
                       class="ui-btn ui-shadow ui-corner-all ui-btn-a">
                    Passer en mode administrateur !
                </a>
                <br/><br/>
        <% 
        }
        %>
        <a href="discovery.jsp?action=deconnexion"
               class="ui-btn ui-shadow ui-corner-all ui-btn-a">
            Déconnexion
        </a>
    </div>

    <%@include file="../includes/footer.jspf" %>
</div>
</body>
</html>
