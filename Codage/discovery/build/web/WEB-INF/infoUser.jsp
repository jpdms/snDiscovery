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
        </a><br/>
        <a href="discovery.jsp?action=contact" data-theme="a" 
          class="ui-btn ui-shadow ui-corner-all ui-btn-a">
            Contacter l'administrateur !
        </a><br/>
        <a href="discovery.jsp?action=deconnexion"
               class="ui-btn ui-shadow ui-corner-all ui-btn-a">
            Déconnexion
        </a><br/><br/>
    </div>

    <%@include file="../includes/footer.jspf" %>
</div>
</body>
</html>
