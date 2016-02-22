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
    <%@include file="../includes/a_head.jspf"%>
</head>

<body>
<div class="page" data-role="page" id="infoUserPage">
    <%@include file="../includes/div_header.jspf" %>
        <h1>Compte</h1>
        <%@include file="../includes/a_user.jspf" %>
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
        <br/>
        <%
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
            Blacklister un utilisateur
        </a><br/>
        <%
        if(user.getGrade()==5){
        %>
                <a href="discovery.jsp?action=reqNoAdmin"
                       class="ui-btn ui-shadow ui-corner-all ui-btn-a">
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
