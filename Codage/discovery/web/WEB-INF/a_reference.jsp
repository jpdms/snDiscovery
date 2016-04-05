<%-- 
    Document   : disco
    Created on : 05 Mai 2014, 16:54:26
    Author     : 
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="com.metier.*"%>
<%@page import="com.persistence.*"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Images</title>
    <%@include file="../includes/a_head.jspf" %>
</head>

<body>
<div class="page" data-role="page" id="discoPage" data-theme="b">    
    <%@include file="../includes/div_header.jspf" %>
        <h1>Référence</h1>
        <%@include file="../includes/a_user.jspf" %>
    </div>
    
    <div role="main" class="ui-content ">
        <br/><br/><br/>
        <div class="mesImages" align="center">
            <a href="#popupZoomLeft" id="clicZoomLeft" data-rel="popup" class="ui-link">
                <img id="imgobs" alt="erreur:image absente" src="/jpeg/Tarot_Calern/20140319/IC3900.jpg">
            </a>
            <a href="#popupZoomRight" id="clicZoomRight" data-rel="popup" class="ui-link">
                <img id="imgref" alt=".... aucune référence ...." src="/jpeg/refgal/IC3900.jpg">
            </a>
        </div>
        <center><h3>Nouvelle image de référence proposée par : <strong>User2</strong></h3></center>
            <table class="infosTable">
                <td class="texteCentre" id="dateImages">12/03/2014</td>
                <td class="texteCentre" id="numImages" >(1/20)</td>
                <td class="texteCentre" id="nomGalaxie">IC3900</td>
            </table>
        <div align="center">
            <div class="ui-grid-a">
                <div class="ui-block-a">
                    <a href="#" id="btnPcdt" data-icon="arrow-l" data-iconpos="top" 
                       class="ui-state-disabled"
                       data-role="button">Précédent</a>
                </div>
                <div class="ui-block-b">
                    <a href="#" id="btnSvt" data-icon="arrow-r" data-iconpos="top" 
                       data-role="button">Suivant</a>
                </div>
            </div>
        </div>
        <div class="ui-grid-a">
            <div class="ui-block-b">
                <a href="#popupValider" id="btnValider" data-rel="popup" data-position-to="window" 
                   class="ui-btn ui-corner-all ui-shadow" data-transition="pop">Valider</a>
            </div>
            <div class="ui-block-b">
                <a href="#popupBlink" id="btnRefuser" 
                   class="ui-btn ui-corner-all ui-shadow" data-transition="pop">Refuser</a>
            </div>
        </div>
    </div>

    <%@include file="../includes/a_footer.jspf" %>

        <!-- popup valider -->
        <div id="popupValider" data-role="popup" data-theme="a" data-overlay-theme="b"
             class="ui-corner-all" data-corners="true" data-position-to="origin">
            <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow
               ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right" style="background-color:black;">Fermer</a>
            <div class="mesPopups"> 
                <center><p>Voulez-vous remplacer l'ancienne image de référence<br/> par celle proposée ? <br><strong>Cette action est irreversible</strong></p></center>
                <div class="ui-grid-a">
                    <div class="ui-block-a">
                        <a href="#" id="btnOui" data-rel="true" data-position-to="window" 
                           class="ui-btn ui-corner-all ui-shadow" data-transition="pop">Oui</a>
                    </div>
                    <div class="ui-block-b">
                        <a href="#" id="btnNon" data-rel="back" data-position-to="window" 
                           class="ui-btn ui-corner-all ui-shadow" data-transition="pop">Non</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
