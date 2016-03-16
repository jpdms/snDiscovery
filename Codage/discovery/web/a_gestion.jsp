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
        <h1>Gestion</h1>
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
        <blockquote>
            <input type="search" name="search" placeholder="Entrez un pseudo." id="search">
        </blockquote>
        <fieldset style="margin: auto; text-align: center;" data-role="controlgroup" data-type="horizontal" data-mini="true">
            <label for="select-native-15">Select A</label>
            <select name="select-native-15" id="select-native-15">
                <option value="#"> = </option>
                <option value="#"> < </option>
                <option value="#"> <= </option>
                <option value="#"> > </option>
                <option value="#"> >= </option>
            </select>
            <label for="select-native-14">Select B</label>
                <select name="select-native-14" id="select-native-14">
                    <option value="#">Grade</option>
                    <option value="#">1</option>
                    <option value="#">2</option>
                    <option value="#">3</option>
                    <option value="#">4</option>
                    <option value="#">5</option>
                </select>
            <button onclick="window.location.href='discovery.jsp?action=gestionrecherche'">Rechercher</button>
        </fieldset>
        <br/>
        <!-- Ligne bordure-->
        <div style="padding:8px; padding-left:6px; border:1px dotted; margin: 6px; ">
            <u><strong>Information: </strong></u>
            <br/><br/>
            Pseudo: User1 
            <br/><br/> <!--aller à la ligne-->
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
       <!--- Ligne avec 2 boutons :-->
        <br/>
        <div class="ui-grid-a">
            <div class="ui-block-a">
                <a href="discovery.jsp?action=gestioncompte" class="ui-btn ui-corner-all ui-shadow">Modifier</a>
            </div>   	 
        <div class="ui-block-b">
            <a href="#popupMail" id="btnReference" data-rel="popup" data-position-to="window"
                   data-role="button"  data-transition="pop">Contacter</a>
        </div>
        <a href="discovery.jsp?action=gestionhistorique" class="ui-btn ui-shadow ui-corner-all ui-btn-a">
        Afficher l'historique
        </a>
        <!-- popup email -->
        <div id="popupMail" data-role="popup" data-theme="a" data-overlay-theme="b"
             class="ui-corner-all" data-corners="true" data-position-to="origin">
            <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow
               ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
            <div class="mesPopups"> 
                <center><p><%@include file="includes/espace.jspf" %><br><strong>Envoyer un mail</strong></p></center>
                <br/><strong> Objet: </strong>

                <form><strong><textarea style="FONT-FAMILY: Verdana" rows=1 name="textarea" placeholder="Ajouter un objet"></textarea></form>

                 <br>Contenu du mail : 
                 <form><textarea style="FONT-FAMILY: Verdana" rows=5 name="textarea" placeholder="Rédigez ici"></textarea></form>
                 <div class="ui-grid-a">
                    <div class="ui-block-a">
                        <a href="#" id="btnEnvoyer" data-rel="back" data-position-to="window" 
                        class="ui-btn ui-corner-all ui-shadow" data-transition="pop">Envoyer</a>
                    </div>
                    <div class="ui-block-b">
                        <a href="#" id="btnAnnuler" data-rel="back" data-position-to="window" 
                        class="ui-btn ui-corner-all ui-shadow" data-transition="pop">Annuler</a>
                    </div>
                 </div>
            </div>
        </div>
                
        
        
        
    </div>
    <%@include file="../includes/a_footer.jspf" %>
</div>
</body>
</html>