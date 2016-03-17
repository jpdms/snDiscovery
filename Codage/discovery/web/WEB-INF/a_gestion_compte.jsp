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
    <title>Gestion du compte : user1</title>
    <%@include file="../includes/a_head.jspf"%>
</head>

<body>
<div class="page" data-role="page" id="infoUserPage">
    <%@include file="../includes/div_header.jspf" %>
        <h1>Gestion du compte : user1</h1>
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
        <%
            user = maSession.getUser();
        %>
        <blockquote>
            <input type="search" name="search" placeholder="Entrez un pseudo." id="search">
        </blockquote>
            <button onclick="window.location.href='a_gestion.jsp'">Rechercher</button>
            <hr/><br/> 
        <div style="padding:8px; padding-left:6px; border:1px dotted; margin: 6px; ">
            <u><strong>Information: </strong></u><br/><br/>
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
                <a href="#popupBloquer" id="bloquer" data-rel="popup" data-position-to="window" 
                class="ui-btn ui-corner-all ui-shadow">Bloquer</a>
            </div> 
            <div class="ui-block-b">
                <a href="#popupGrade" id="btnReference" data-rel="popup" data-position-to="window"
                   data-role="button"  data-transition="pop" >Changer de grade</a>
            </div>
            <a href="#popupMail" id="btnReference" data-rel="popup" data-position-to="window"
                   data-role="button"  data-transition="pop" class="ui-btn ui-shadow ui-corner-all ui-btn-a">
            Contacter
            </a>
            <a href="discovery.jsp?action=gestionhistorique" class="ui-btn ui-shadow ui-corner-all ui-btn-a">
            Afficher l'historique
            </a>
            <a href="javascript:history.go(-1)" class="ui-btn ui-shadow ui-corner-all ui-btn-a">
                Retour
            </a>   
        </div>
        <!-- popup bloquer --> 
        <div id="popupBloquer" data-role="popup" data-theme="a" data-overlay-theme="b"
         class="ui-corner-all" data-corners="true" data-position-to="origin">
            <br/>
        <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow 
        ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right" style="background-color:black;">Fermer</a>
            <div class="mesPopups">
                <u><strong><center> Attention </center> </strong></u><br/>
                Êtes vous sur de bloquer cette personne ? 
                <div class="ui-grid-a">
                    <div class="ui-block-a">
                        <a href="#" id="btnOui" data-rel="back" data-position-to="window" 
                        class="ui-btn ui-corner-all ui-shadow" data-transition="pop">Oui</a>
                    </div>
                    <div class="ui-block-b">
                        <a href="#" id="btnNon" data-rel="back" data-position-to="window" 
                        class="ui-btn ui-corner-all ui-shadow" data-transition="pop">Non</a>
                    </div>
                </div>
            </div>
        </div>
    <!-- popup grade -->
        <div id="popupGrade" data-role="popup" data-theme="a" data-overlay-theme="b"
             class="ui-corner-all" data-corners="true" data-position-to="origin">
            <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow
               ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right" style="background-color:black;">Fermer</a>
                <div class="mesPopups">
                    <%@include file="../includes/espace.jspf" %>
                    <br/>
                    <u><strong><center> Changement de grade </center> </strong></u>   
                    <div>
                        <form >
                            <input type="range" name="slider-step" id="slider-step" value="5" min="1" max="5" step="1" data-highlight="true"  />
                        </form>
                    </div>
                    <!-- bouton valider et annuler dans le popup changer de grade-->
                    <div class="ui-grid-a">
                        <div class="ui-block-a">
                            <a href="#" id="btnValider" data-rel="back" data-position-to="window" 
                            class="ui-btn ui-corner-all ui-shadow" data-transition="pop">Valider</a>
                        </div>
                        <div class="ui-block-b">
                            <a href="#" id="btnNon" data-rel="back" data-position-to="window" 
                            class="ui-btn ui-corner-all ui-shadow" data-transition="pop">Annuler</a>
                        </div>
                </div>
            </div>
            </div>
            <!-- popup email -->
        <div id="popupMail" data-role="popup" data-theme="a" data-overlay-theme="b"
             class="ui-corner-all" data-corners="true" data-position-to="origin">
            <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow
               ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right" style="background-color:black;">Fermer</a>
            <div class="mesPopups"> 
                <center><p><%@include file="../includes/espace.jspf" %><br><strong>Envoyer un mail</strong></p></center>
                <strong> Objet: </strong>

                <form><strong><textarea style="FONT-FAMILY: Verdana" rows=1 name="textarea" placeholder="Ajouter un objet"></textarea></form>

                 <br>Contenu: 
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
