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
        <BLOCKQUOTE>
            <input type="search" name="search" placeholder="Entrez un pseudo." id="search"><br/>
        </BLOCKQUOTE>
        <fieldset style="margin: auto; margin-top:-20px; text-align: center;" data-role="controlgroup" data-type="horizontal" data-mini="true">
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
        </fieldset><br/>
        <!-- Ligne bordure-->
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
            <a href="discovery.jsp?action=gestionhistorique" class="ui-btn ui-shadow ui-corner-all ui-btn-a">
            Afficher l'historique
            </a>
            <a href="a_gestion.jsp" class="ui-btn ui-shadow ui-corner-all ui-btn-a">
                Retour
            </a>   
        </div>
        <!-- popup bloquer --> 
        <div id="popupBloquer" data-role="popup" data-theme="a" data-overlay-theme="b"
         class="ui-corner-all" data-corners="true" data-position-to="origin">
            <br/>
        <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow 
        ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Fermer</a>
            <div class="mesPopups">
                <u><strong><center> Attention </center> </strong></u><br/>
                Êtes vous de bloquer cette personne ? 
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
               ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
                <div class="mesPopups">
                    <br/>
                    <u><strong><center> Changement de grade </center> </strong></u>   
                    <div>
                        <form >
                            <fieldset data-role="controlgroup" data-type="horizontal" style="position:relative; left:27%;">  
                                <input type="radio" name="radio-choice-h-2" id="radio-choice-h-2a" value="on" checked="checked">
                                <label for="radio-choice-h-2a">1</label>
                                <input type="radio" name="radio-choice-h-2" id="radio-choice-h-2b" value="off">
                                <label for="radio-choice-h-2b">2</label>
                                <input type="radio" name="radio-choice-h-2" id="radio-choice-h-2c" value="other">
                                <label for="radio-choice-h-2c">3</label>
                                <input type="radio" name="radio-choice-h-2" id="radio-choice-h-2d" value="other1">
                                <label for="radio-choice-h-2d">4</label>
                                <input type="radio" name="radio-choice-h-2" id="radio-choice-h-2e" value="other2">
                                <label for="radio-choice-h-2e">5</label>
                            </fieldset>
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
    </div>
    <%@include file="../includes/a_footer.jspf" %>
</div>
</body>
</html>
