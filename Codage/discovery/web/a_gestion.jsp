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
    <%@include file="includes/a_head.jspf"%>
</head>

<body>
<div class="page" data-role="page" id="infoUserPage">
    <%@include file="includes/div_header.jspf" %>
        <h1>Compte</h1>
        <%@include file="includes/a_user.jspf" %>
    </div>
    
    <div role="main" id="mainInfoUser" class="ui-content">
        <br/><br/>
        <br/>
                <div>
            <%
                if(!maSession.isModeExpert()){
                    request.getRequestDispatcher("discovery.jsp?action=pbAdminMode").forward(request, response);
                }
            %>
        </div>
        <br/>
        <div>
                <input type="search" name="search" placeholder="Pseudo.." id="search"><br/>
            <a href="#" class="ui-btn ui-shadow ui-corner-all ui-btn-a">
                Rechercher
            </a>
        </div>
               
        <h3>Informations sur le compte :</h3>
        <div style="margin-left:10%;">
        <%
            user = maSession.getUser();
        %>
        
        <label id="pseudoInfoUser"><strong>Pseudo</strong> : <%= user.getPseudo() %></label>
        <label id="nomInfoUser"><strong>Nom</strong> : <%= user.getUsername() %></label>
        <label id="emailInfoUser"><strong>EMail</strong> : <%= user.getEmail() %></label>
        <label id="gradeInfoUser"><strong>Grade</strong> : <%= user.getGrade() %></label>
        <br/>
        <label id="lastVisiteInfoUser"><strong>Dernière Visite</strong> : <%= Utils.formatStampDate(maSession.getLastVisitDate().toString()) %></label>
        <br/>
        <label id="nbConnexionsInfoUser"><strong>Nombre total de connexions</strong> : <%= user.getNbConnexions() %></label>
        <label id="nbCandidatesInfoUser"><strong>Demande(s) de candidates</strong> : <%= user.getNbCandidates() %></label>
        <br/>
        </div>
                <a href="#"
                       class="ui-btn ui-shadow ui-corner-all ui-btn-a">
                    Bloquer cette utilisateur.
                </a>
                <a href="#"
                       class="ui-btn ui-shadow ui-corner-all ui-btn-a">
                    Modifier le grade de cette utilisateur.
                </a>
    <%@include file="../includes/a_footer.jspf" %>
</div>
</body>
</html>