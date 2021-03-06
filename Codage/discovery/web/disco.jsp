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
    <%@include file="includes/head.jspf" %>
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
    
    <div class="header" data-role="header" data-id="main-header" data-theme="b"
                                  data-position="fixed" data-fullscreen="true">
        <h1>Découvrir</h1>
        <a href="#panelCalendar" 
           class="ui-btn ui-btn-icon-notext ui-corner-all ui-icon-calendar ui-btn-left">
        </a>
        <a href="#panelGalaxies" 
           class="ui-btn ui-btn-icon-notext ui-corner-all ui-icon-navigation ui-btn-right">
        </a>
        <%@include file="includes/user.jspf" %>
    </div>
    
    <div role="main" class="ui-content ">
        <div class="centrer">Découvrir</div><br/><br/>
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
        <div class="ui-grid-b">
            <div class="ui-block-a">
                <a href="#popupHisto" id="btnHisto" data-rel="popup" data-position-to="window" 
                class="ui-btn ui-corner-all ui-shadow">Histo</a>
            </div>
            <div class="ui-block-b">
                <a href="#popupInfos" id="btnInfos" data-rel="popup" data-position-to="window" 
                class="ui-btn ui-corner-all ui-shadow">Infos</a>
            </div>
            <div class="ui-block-c">
                <a href="#popupBlink" id="btnBlink" data-rel="popup" data-position-to="window" 
                class="ui-btn ui-corner-all ui-shadow">Blink</a>
            </div>
        </div>
        
        <div class="ui-grid-b">
            <div class="ui-block-a"></div>
            <div class="ui-block-b">
                <%
                    if (user != null) {
                        out.println("<a href='#popupCandidat' id='btnCandidat' "
                                + "data-rel='popup' data-position-to='window' "
                                + "class='ui-btn ui-corner-all ui-shadow' "
                                + "data-transition='pop'>Disco</a>");
                    }
                %>
            </div>
            <div class="ui-block-c"></div>
        </div>
    </div>

    <%@include file="includes/footer.jspf" %>
    
    <!-- panel de calendar -->
    <div id="panelCalendar" data-role="panel" data-position="left"  
             data-position-fixed="true" data-display="push" data-theme="a">
        <ul data-role="listview" data-icon="false" class="ui-alt-icon">
            <li data-role="list-divider">Choisir un jour :</li>
            <%
                ArrayList<String> dates = Image.getDerniersJours(con);
                for (String date : dates) {
                    out.println("<li><a href='#' onclick='nouvelleDate(" + date + ");'>" 
                                   + Utils.formatDate(date) + "</a></li>");
                    // out.println("<li><a href='disco.jsp?date=" + date + "'>" 
                       //             + Utils.formatDate(date) + "</a></li>");
                }
            %>
            <li data-icon="delete"><a href="#" data-rel="close">Close</a></li>
        </ul>
    </div>
    
    <!-- panel de galaxies -->
    <div id="panelGalaxies" data-role="panel" data-position="right"  
             data-position-fixed="true" data-display="push" data-theme="a">
        <ul data-role="listview" data-icon="false" class="ui-alt-icon">
            <li data-role="list-divider">Offset sur les images :</li>
            <li><a href="#" data-rel="close" onclick="nouvelleImage(1);">Première</a></li>
            <li><a href="#" data-rel="close" onclick="nouvelleImage(offset(-200));">-200</a></li>
            <li><a href="#" data-rel="close" onclick="nouvelleImage(offset(-100));">-100</a></li>
            <li><a href="#" data-rel="close" onclick="nouvelleImage(offset(-50));">-50</a></li>
            <li><a href="#" data-rel="close" onclick="nouvelleImage(offset(-10));">-10</a></li>
            <li><a href="#" data-rel="close" onclick="nouvelleImage(offset(10));">+10</a></li>
            <li><a href="#" data-rel="close" onclick="nouvelleImage(offset(50));">+50</a></li>
            <li><a href="#" data-rel="close" onclick="nouvelleImage(offset(100));">+100</a></li>
            <li><a href="#" data-rel="close" onclick="nouvelleImage(offset(200));">+200</a></li>
            <li><a href="#" data-rel="close" onclick="nouvelleImage(<%= images.size()%>);">Dernière</a></li>
            <li data-icon="delete">
                <a href="#" data-rel="close">Close</a>
            </li>
        </ul>
    </div>
    
    <!-- popup candidat -->
    <div id="popupCandidat" data-role="popup" data-theme="a" data-overlay-theme="b"
         class="ui-corner-all ui-alt-icon" data-corners="true" data-position-to="window">
        <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow 
             ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
        <div id="divCandidat" class="ui-alt-icon">
            <h3 id="nomCandidat">Proposition de candidat sur IC500</h3>
            <h4>Pointez la supernova !!!</h4>
            <canvas id="mon_canvas" width="250" height="250" ></canvas>
            <form id="formCandidat">
                <fieldset data-role="controlgroup" data-type="horizontal">
                    <legend>Choisir le degré de certitude :<br/>
                            (1 : peu sûr, 5 : certain)
                    </legend>
                    <input type="radio" name="rdoCertitude" id="radio-choice-h-2a" value="1" checked="checked">
                    <label for="radio-choice-h-2a">1</label>
                    <input type="radio" name="rdoCertitude" id="radio-choice-h-2b" value="2">
                    <label for="radio-choice-h-2b">2</label>
                    <input type="radio" name="rdoCertitude" id="radio-choice-h-2c" value="3">
                    <label for="radio-choice-h-2c">3</label>
                    <input type="radio" name="rdoCertitude" id="radio-choice-h-2d" value="4">
                    <label for="radio-choice-h-2d">4</label>
                    <input type="radio" name="rdoCertitude" id="radio-choice-h-2e" value="5">
                    <label for="radio-choice-h-2e">5</label>
                </fieldset>
                <br/>
                <button id="btnConfirmCandidat" class="ui-btn ui-corner-all">Confirmation</button>
            </form>
        </div>
    </div>

    <!-- popup message en mode modal-->
    <div id="popupSendMail" data-role="popup" data-theme="a" data-overlay-theme="b"
         class="ui-corner-all ui-alt-icon" data-corners="true" data-position-to="window" data-dismissible="false">
        <div class="mesPopups" align="center">
            <br/>
            <h3 id="popupTextSendMail">Attendez, je transmets votre candidate !</h3>
            <div class="progressBar"><div></div></div>
            <br/>
        </div>
    </div>
    
    <!-- popup infos -->
    <div id="popupInfos" data-role="popup" data-theme="a" data-overlay-theme="b"
         class="ui-corner-all ui-alt-icon" data-corners="true" data-position-to="window">
        <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow 
             ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
        <div class="mesPopups">
            <h3    id="nomInfos">Nom:</h3>
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
             ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
        <div class="mesPopups">
            <h3 id="nomBlink"></h3>
            <div><img id="imgBlink" src="images/black.jpg"/></div>
            <br/>
        </div>
    </div>
    
    <!-- popup ZoomLeft -->
    <div id="popupZoomLeft" data-role="popup" data-theme="a" data-overlay-theme="b"
           class="ui-corner-all ui-alt-icon" data-corners="true" data-position-to="window">
        <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow 
             ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
        <div class="mesPopups">
            <h3 id="nomZoomLeft"></h3>
            <div><img id="imgZoomLeft" src="images/black.jpg"/></div>
            <br/>
        </div>
    </div>
    
    <!-- popup ZoomRight -->
    <div id="popupZoomRight" data-role="popup" data-theme="a" data-overlay-theme="b"
           class="ui-corner-all ui-alt-icon" data-corners="true" data-position-to="window">
        <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow 
             ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
        <div class="mesPopups">
            <h3 id="nomZoomRight"></h3>
            <div><img id="imgZoomRight" src="images/black.jpg"/></div>
            <br/>
        </div>
    </div>
    
        <!-- popup Historique -->
    <div id="popupHisto" data-role="popup" data-theme="a"
           class="ui-corner-all ui-alt-icon" data-corners="true" data-position-to="window">
        <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow 
             ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
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
</div>
</body>
</html>
