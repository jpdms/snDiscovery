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
        <%@include file="includes/a_head.jspf" %>
    </head>

    <body>
        <div class="page" data-role="page" id="discoPage" data-theme="b">
            <%-- le script pour s'exécuter doit être dans la page data-role --%>
            <script type="text/javascript" src="js/disco.js"></script>
            <script type="text/javascript">
            <%
                /*
                    On peut appeller "disco.jsp" ou "disco.jsp?date=20140418".
                    Si il n'y a pas de paramètre de date, c'est la date du dernier
                    jour dans la BD.
                */
                String dateObservation = request.getParameter("date");
                if (dateObservation == null) {
                    dateObservation = Image.dernierJour(con);
                }

                /*  initialise le tableau des noms des images d'observation
                    au format "F nom.jpg" ou "C nom.jpg" (pour France ou Chili) 
                    de la date par défaut ou celle passée en paramètre.
                 */

                ArrayList<Image> images = Image.getImagesDuJour(con, dateObservation);
                out.print("var imagesNoms = new Array(");
                for (int i = 0; i < images.size(); i++) {
                    Image img = images.get(i);
                    if (img.getChemin().equals("Tarot_Calern"))
                        out.print("'F " + img.getGalaxieNom() + "'");
                    else 
                        out.print("'C " + img.getGalaxieNom() + "'");
                    if (i < images.size() - 1)
                        out.print(",");
                }
                out.println(");");
                // initialise le chemin d'accès aux images d'observation
                out.print("var cheminCalern = ");
                Image img = images.get(0);
                out.println("'/jpeg/Tarot_Calern/" + img.getDate() + "/';");
                out.print("var cheminChili = ");
                out.println("'/jpeg/Tarot_Chili/" + img.getDate() + "/';");
                out.print("var cheminRef = '/jpeg/refgal/';");
                out.println("'/jpeg/Tarot_Chili/" + img.getDate() + "/';");
                out.print("var dateCrt = " + img.getDate());
            %>
            </script>

            <%@include file="includes/div_header.jspf" %>
            <h1>Valider</h1>
            <%@include file="includes/a_user.jspf" %>
        </div>

        <div role="main" class="ui-content ">
            <br/><br/><br/>
            <div class="mesImages" align="center">
                <%
                    /*
                        Les sources des deux images à afficher pour observation
                    */
                    Image img1 = Image.find(con, dateObservation, 1);
                    out.println("<a href='#popupZoomLeft' id='clicZoomLeft' data-rel='popup'>");
                    out.println("<img id='imgobs' alt='erreur:image absente' src='/jpeg/" 
                            + img1.getChemin() + "/" 
                            + img1.getDate() + "/" 
                            + img1.getGalaxieNom() + ".jpg'/></a>");
                    // je n'ai pas les images de reférence
                    out.println("<a href='#popupZoomRight' id='clicZoomRight' data-rel='popup'>");
                    out.println("<img id='imgref' alt='.... aucune référence ....' src='/jpeg/refgal/"
                            + img1.getGalaxieNom() + ".jpg'/></a>");
                %>
            </div>
            <table class="infosTable">
                <td class="texteCentre" id="dateImages"><%= Utils.formatDate(img.getDate())%></td>
                <td class="texteCentre" id="numImages" >(1/<%= images.size()%>)</td>
                <td class="texteCentre" id="nomGalaxie"><%= img.getGalaxieNom()%></td>
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
                                    data-role="button">
                            Suivant
                        </a>
                    </div>
                </div>
            </div>
            <div class="ui-grid-b">
                <div class="ui-block-a">
                    <a href="#popupHisto" id="btnHisto" data-rel="popup" data-position-to="window" 
                    class="ui-btn ui-corner-all ui-shadow">
                        Histo
                    </a>
                </div>
                <div class="ui-block-b">
                    <a href="#popupInfos" id="btnInfos" data-rel="popup" data-position-to="window" 
                    class="ui-btn ui-corner-all ui-shadow">
                        Infos
                    </a>
                </div>
                <div class="ui-block-c">
                    <a href="#popupBlink" id="btnBlink" data-rel="popup" data-position-to="window" 
                    class="ui-btn ui-corner-all ui-shadow">
                        Blink
                    </a>
                </div>
            </div>
            <div class="ui-grid-a">
                    <div class="ui-block-a" style="text-align:center;">
                        Proposé par : User2
                    </div>            
                    <div class="ui-block-b" style="text-align:center;">
                        Le : 29/02/2016 à 14:06
                    </div>
            </div>
            <br/>
            <center>
                <div class="gradeUser">
                    <img src="images/star.gif">
                    <img src="images/star.gif">
                    <img src="images/star.gif">
                </div>
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
        <%@include file="includes/a_footer.jspf" %>

        <!-- POP UP-->

        <!-- popup infos -->
        <div id="popupInfos" data-role="popup" data-theme="a" data-overlay-theme="b"
             class="ui-corner-all ui-alt-icon" data-corners="true" data-position-to="window">
            <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow 
                 ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right"">
                Fermer
            </a>
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

        <!-- popup ZoomLeft -->
        <div id="popupZoomLeft" data-role="popup" data-theme="a" data-overlay-theme="b"
               class="ui-corner-all ui-alt-icon" data-corners="true" data-position-to="window">
            <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow 
                 ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">
                Fermer
            </a>
            <div class="mesPopups">
                <h3 id="nomZoomLeft"></h3>
                <div>
                    <img id="imgZoomLeft" src="images/black.jpg"/>
                </div>
                <br/>
            </div>
        </div>

        <!-- popup ZoomRight -->
        <div id="popupZoomRight" data-role="popup" data-theme="a" data-overlay-theme="b"
               class="ui-corner-all ui-alt-icon" data-corners="true" data-position-to="window">
            <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow 
                 ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">
                Fermer
            </a>
            <div class="mesPopups">
                <h3 id="nomZoomRight"></h3>
                <div>
                    <img id="imgZoomRight" src="images/black.jpg"/>
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
                        <img id="imgHisto1" src="../images/black.jpg"/>
                        <img id="imgHisto2" src="../images/black.jpg"/>
                    </div>
                    <div>
                        <img id="imgHisto3" src="../images/black.jpg"/>
                        <img id="imgHisto4" src="../images/black.jpg"/>
                    </div>
                    <div>
                        <img id="imgHisto5" src="../images/black.jpg"/>
                        <img id="imgHisto6" src="../images/black.jpg"/>
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
                    <%@include file="includes/espace.jspf" %>
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
                <%@include file="includes/espace.jspf" %>
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
