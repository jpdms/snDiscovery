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
        <h1>Découvrir</h1>
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
        <center><h3>Nouvelle image de référence proposé par : <strong>User2</strong></h3></center>
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

    <%@include file="includes/a_footer.jspf" %>

        <!-- popup valider -->
        <div id="popupValider" data-role="popup" data-theme="a" data-overlay-theme="b"
             class="ui-corner-all" data-corners="true" data-position-to="origin">
            <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow
               ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
            <div class="mesPopups"> 
                <center><p>Voulez vous remplacer l'ancienne image de référence par celle proposée ? <br><strong>Cette action est irreversible</strong></p></center>
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
