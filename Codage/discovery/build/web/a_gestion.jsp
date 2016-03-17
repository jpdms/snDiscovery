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
        <title>Gestion</title>
        <%@include file="includes/a_head.jspf"%>
    </head>

    <body>
        <div class="page" data-role="page" id="infoUserPage">
            <%@include file="includes/div_header.jspf" %>
            <h1>Gestion</h1>
            <%@include file="includes/a_user.jspf" %>
        </div>

        <div role="main" id="mainInfoUser" class="ui-content">
            <br/><br/><br/>
            <div>
                <%
                    if(!maSession.isModeExpert()){
                        request.getRequestDispatcher("discovery.jsp?action=pbAdminMode").forward(request, response);
                    }
                %>
            </div>
            <blockquote>
                <input type="search" name="search" placeholder="Entrez un pseudo." id="search">
            </blockquote>
            <button onclick="window.location.href='discovery.jsp?action=gestionrecherche'">
                Rechercher
            </button>
            <hr/><br/>    
            <div style="padding:8px; padding-left:6px; border:1px dotted; margin: 6px; ">
                <u><strong>Information: </strong></u><br/><br/>
                Pseudo: User1 
                <br/><br/>
                Nom: Toto
                <br/><br/>
                Email: Toto@gmail.com
                <br/><br/>
                Grade: 5
                <br/><br/>
                Dernière visite: 15/02/2016
                <br/><br/>
                Nombre total de connexion: 35
                <br/><br/>
                Demande(s) de candidate(s): 9 
                 <br/><br/>
            </div>
            <a href="discovery.jsp?action=gestioncompte" class="ui-btn ui-shadow ui-corner-all ui-btn-a">
                Modifier
            </a>
            <hr/>
            <div class="ui-grid-d" style="margin-left:15px; margin-right: -15px;">
                <div class="ui-block-a">
                    <div class="ui-grid-a">
                        <div class="ui-block-a"></div>
                        <div class="ui-block-b"><div style="height:60px"><a href="#">|<<</a></div></div>
                    </div>
                </div>
                <div class="ui-block-b">
                <div class="ui-grid-a">
                    <div class="ui-block-a"><div style="height:60px"><a href="#"><<</a></div></div>
                    <div class="ui-block-b"><div style="height:60px"><a href="#"><</a></div></div>
                </div>
                </div>
                <div class="ui-block-c">
                    <div class="ui-block-a"></div>
                    <div class="ui-block-b"></div>            
                </div>
                <div class="ui-block-d">
                <div class="ui-grid-a">
                    <div class="ui-block-a"><div style="height:60px"><a href="#">></a></div></div>
                    <div class="ui-block-b"><div style="height:60px"><a href="#">>></a></div></div>
                </div>
                </div>
                <div class="ui-block-e">
                <div class="ui-grid-a">
                    <div class="ui-block-a"><div style="height:60px"><a href="#">>>|</a></div></div>
                    <div class="ui-block-b"></div>
                </div>
                </div>
            </div>
        </div>
        <%@include file="../includes/a_footer.jspf" %>
        </div>
    </body>
</html>