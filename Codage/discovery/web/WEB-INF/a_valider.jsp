<%-- 
    Document   : disco
    Created on : 05 Mai 2014, 16:54:26
    Author     : 
--%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
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
            <%@include file="../includes/a_div_header.jspf" %>
            <h1>Valider</h1>
            <%@include file="../includes/a_user.jspf" %>
        </div>

        <div role="main" class="ui-content ">
            <script type="text/javascript" src="js/a_disco.js"></script>
            <%
                Candidate can = Candidate.findAll(con, 1);
            %>
            <input type="hidden" id="cX" value="<%=can.getX()%>"/>
            <input type="hidden" id="cY" value="<%=can.getY()%>"/>
            <input type="hidden" id="nomGal" value="<%=can.getNomImage()%>"/>
            <% String tabTele[] = can.getChemin().split("/");%>
            <input type="hidden" id="nomTele" value="<%=tabTele[2]%>"/>
            <br/><br/><br/>
            <div class="mesImages" align="center">
                <a href="#popupZoomLeft" id="clicZoomLeft" data-rel="popup" class="ui-link">
                    <canvas style="position:absolute;border:1px solid #000000;" id="CanvasObs" ></canvas>
                    <img name="imgobs" id="imgobs" alt="erreur:image absente" src="<%=can.getChemin()+can.getNomImage()%>.jpg">
                    <script>
                        window.onload=initcanvas;
                        window.onresize = resizecanvas;
                    </script>
                </a>
                <a href="#popupZoomRight" id="clicZoomRight" data-rel="popup" class="ui-link">
                    <img id="imgref" alt=".... aucune référence ...." src="/jpeg/refgal/<%=can.getNomImage()%>.jpg">
                </a>
            </div>
            <table class="infosTable">
                <td class="texteCentre" id="dateImages"><%=can.getDateDisco()%></td>
                <td class="texteCentre" id="numImages" >(1/<%=Candidate.size(con)%>)</td>
                <td class="texteCentre" id="nomGalaxie"><%=can.getNomImage()%></td>
            </table>
            <table class="infosTable">
                <td class="texteCentre" id="certitude">Degré de certitude : <%=can.getCertitude()%>/5</td>
            </table>
            <div align="center">
                <div class="ui-grid-a">
                    <div class="ui-block-a">
                        <a href="#" id="btnPcdt" data-icon="arrow-l" data-iconpos="left" 
                           class="ui-state-disabled" data-role="button">
                            Précédent
                        </a>
                    </div>
                    <div class="ui-block-b">
                        <a href="#" id="btnSvt" data-icon="arrow-r" data-iconpos="right" 
                             class="ui-state-disabled" data-role="button">
                            Suivant
                        </a>
                    </div>
                </div>
            </div>
            <div class="ui-grid-a">
                <div class="ui-block-a">
                    <a onclick="afficheHisto()" href="#popupHisto" id="btnHisto" data-rel="popup" data-position-to="window" 
                    class="ui-btn ui-corner-all ui-shadow">
                        Histo
                    </a>
                </div>
                <div class="ui-block-b">
                    <a onclick="afficheInfos()" href="#popupInfos" id="btnInfos" data-rel="popup" data-position-to="window" 
                    class="ui-btn ui-corner-all ui-shadow">
                        Infos
                    </a>
                </div>
            </div>
            <div class="ui-grid-b">
                    <div class="ui-block-a" style="text-align:center;">
                        Proposé par : <%=can.getUserPseudo()%>
                    </div>
                    <div class="ui-block-b" style="text-align:center;">
                    <%
                        for (int nb = 1; nb <= user.getGrade(); nb++) {
                        out.print(" <img src='images/star.gif'>");
                        }
                    %>
                    </div>
                    <div class="ui-block-c" style="text-align:center;">
                        Le : <%
                            SimpleDateFormat type = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            java.util.Date date = type.parse(can.getDateDecouverte());
                            SimpleDateFormat convert = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                            String dateDisco = convert.format(date).toString();
                        %>
                        <%=dateDisco%>
                    </div>
            </div>
            <br/>
            <center>

            </center>
            <br/>
            <div class="ui-grid-a">
                <div class="ui-block-a">               
                    <a href="#popupValider" data-rel="popup" data-position-to="window"
                   data-role="button"  data-transition="pop">
                        Valider
                    </a>
                </div>
                <div class="ui-block-b">
                    <a href="#popupRefuser" data-rel="popup" data-position-to="window"
                   data-role="button"  data-transition="pop">
                        Refuser
                    </a>
                </div>
            </div>
        </div>
        <%@include file="../includes/a_footer.jspf" %>

        <!-- POP UP-->

        <!-- popup infos -->
        <div id="popupInfos" data-role="popup" data-theme="a" data-overlay-theme="b"
             class="ui-corner-all ui-alt-icon" data-corners="true" data-position-to="window">
            <div class="mesPopups">
                <h3 id="nomInfos">Nom:</h3>
                <label id="catInfos">Catégorie:</label>
                <label id="textInfos">Informations:</label>
                <label id="nbNovInfos">Supernovae découvertes:</label>
                <label id="adrInfos">Ascension droite (degré):</label>
                <label id="decInfos">Déclinaison (degré):</label>
                <label id="distInfos">Distance (mal):</label>
                <label id="magInfos">Magnitude:</label>
                <label id="magTelescope">Télescope:</label>
            </div>
        </div>

        <!-- popup blink -->
        <div id="popupBlink" data-role="popup" data-theme="a" data-overlay-theme="b"
               class="ui-corner-all ui-alt-icon" data-corners="true" data-position-to="window">
            <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow 
                 ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">
                Fermer
            </a>
            <div class="mesPopups">
                <h3 id="nomBlink"></h3>
                <div>
                    <img id="imgBlink" src="images/black.jpg"/>
                </div>
                <br/>
            </div>
        </div>

        <!-- popup Historique -->
        <div id="popupHisto" data-role="popup" data-theme="a"
               class="ui-corner-all ui-alt-icon" data-corners="true" data-position-to="window">
            <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow 
                 ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">
                Fermer
            </a>
            <div>
                <h3 id="nomHisto"></h3>
                <div id="imgHisto">
                    <div>
                        <img id="imgHisto1" src="images/black.jpg"/>
                        <img id="imgHisto2" src="images/black.jpg"/>
                    </div>
                    <div>
                        <img id="imgHisto3" src="images/black.jpg"/>
                        <img id="imgHisto4" src="images/black.jpg"/>
                    </div>
                    <div>
                        <img id="imgHisto5" src="images/black.jpg"/>
                        <img id="imgHisto6" src="images/black.jpg"/>
                    </div>
                </div>
            </div>
        </div>

        <!-- popup valider -->
        <div id="popupValider" data-role="popup" data-theme="a" data-overlay-theme="b"
             class="ui-corner-all" data-corners="true" data-position-to="origin">
            <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow
               ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right" style="background-color:black;">
                Fermer
            </a>
            <div class="mesPopups"> 
                <center>
                    <%@include file="../includes/espace.jspf" %>
                    <p><br/>Voulez-vous valider cette supernova ?<br/><strong>Cette action est irréversible</strong></p>
                </center>
                <div>
                    Changer le grade de l'utilisateur
                    <form >
                        <input type="range" name="slider-step" id="slider-step" value="5" min="1" max="5" step="1" data-highlight="true"  />
                    </form>
                </div>
                <br/>
                Envoyer un mail à l'utilisateur
                <br/><br/>
                <strong>Objet:</strong>
                <form>
                    <strong><textarea style="FONT-FAMILY: Verdana" rows=1 name="textarea" placeholder="">
Votre proposition du supernova a été validée !</textarea>
                </form>
                <br>
                Contenu: 
                <form>
                    <textarea style="FONT-FAMILY: Verdana" rows=5 name="textarea" placeholder="">Bonjour,

Félicitation vous êtes le premier a trouver cette supernova.
                    </textarea>
                </form>
                <div class="ui-grid-a">
                    <div class="ui-block-a">
                        <a href="#" id="btnOui" data-rel="true" data-position-to="window" 
                           class="ui-btn ui-corner-all ui-shadow" data-transition="pop">
                            Valider
                        </a>
                    </div>
                    <div class="ui-block-b">
                        <a href="#" id="btnNon" data-rel="back" data-position-to="window" 
                           class="ui-btn ui-corner-all ui-shadow" data-transition="pop">
                            Annuler
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- popup refuser-->
        <div id="popupRefuser" data-role="popup" data-theme="a" data-overlay-theme="b"
             class="ui-corner-all" data-corners="true" data-position-to="origin">
            <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow
               ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right" style="background-color:black;">
                Fermer
            </a>
            <div class="mesPopups">
                <%@include file="../includes/espace.jspf" %>
                <center>
                    <p><br/>Voulez-vous refuser cette supernova ? <br/><strong>Cette action est irréversible</strong></p>
                </center>
                <br/>
                Envoyer un mail à l'utilisateur
                <br/><br/>
                <strong>Objet:</strong>
                <form>
                    <strong><textarea style="FONT-FAMILY: Verdana" rows=1 name="textarea" placeholder="">Votre proposition du supernova a été refusée !</textarea>
                </form>
                <br>
                Contenu: 
                <form>
                    <textarea style="FONT-FAMILY: Verdana" rows=5 name="textarea" placeholder="">Bonjour,

Désolé mais votre proposition de supernova n'est pas correcte.
En effet...</textarea>
                </form>
                <div class="ui-grid-a">
                    <div class="ui-block-a">
                        <a href="#" id="btnOui" data-rel="true" data-position-to="window" 
                           class="ui-btn ui-corner-all ui-shadow" data-transition="pop">
                            Valider
                        </a>
                    </div>
                    <div class="ui-block-b">
                        <a href="#" id="btnNon" data-rel="back" data-position-to="window" 
                           class="ui-btn ui-corner-all ui-shadow" data-transition="pop">
                            Annuler
                        </a>
                    </div>
                </div>
            </div>
        </div> 
    </div>
    </div>
    </body>
</html>
