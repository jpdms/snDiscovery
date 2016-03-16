<%-- 
    Document   : infoUser
    Created on : 28 mai 2014, 14:54:51
    Author     : jpdms
--%>
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
        <br/>
        <%
            maSession = (DiscoSession)session.getAttribute("maSession");
            user = maSession.getUser();
        %>
        
        <label id="pseudoInfoUser">Pseudo : <%= user.getPseudo() %></label>
        <label id="nomInfoUser">Nom : <%= user.getUsername() %></label>
        <label id="emailInfoUser">EMail : <%= user.getEmail() %></label>
        <label id="gradeInfoUser">Grade : <%= user.getGrade() %></label>
        <br/>
        <label id="registerDateInfoUser">Première Visite : <%= Utils.formatStampDate(user.getRegisterDate().toString()) %></label>
        <label id="lastVisiteInfoUser">Dernière Visite : <%= Utils.formatStampDate(maSession.getLastVisitDate().toString()) %></label>
        <br/>
        <label id="nbConnexionsInfoUser">Nombre total de connexions : <%= user.getNbConnexions() %></label>
        <label id="nbCandidatesInfoUser">Demande(s) de candidates : <%= user.getNbCandidates() %></label>
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
