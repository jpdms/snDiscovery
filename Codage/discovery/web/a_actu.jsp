<%-- 
    Document   : site
    Created on : 05 Mai 2014, 16:54:26
--%>
<%@page import="com.persistence.Utils"%>
<%@page import="com.persistence.Actu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>Actualités</title>
        <%@include file="includes/a_head.jspf" %>
    </head>

    <body>
        <div class="page" data-role="page" id="homePage">
            <%@include file="includes/div_header.jspf" %>
            <h1>Actualités</h1>
            <%@include file="includes/a_user.jspf" %>
        </div>
        <div role="main" class="ui-content">
            <br/><br/><br/>
            <a href="#popupAddActu" id="btnReference" data-rel="popup" data-position-to="window"
                       data-role="button"  data-transition="pop" class="ui-btn ui-shadow ui-corner-all ui-btn-a">
                Ajouter une actualité !
            </a>
            <br/>
            <div data-role="collapsibleset" data-corners="false" data-theme="a" 
                 data-content-theme="a" data-mini="true">
                <%
                    if(!maSession.isModeExpert()){
                        request.getRequestDispatcher("discovery.jsp?action=pbAdminMode").forward(request, response);
                    } 
                    int nbActus = Actu.size(con);
                    for (int i = 1; i <= nbActus; i++) {
                        Actu actu = Actu.find(con, i);
                        out.println("<div data-role='collapsible' data-collapsed-icon='carat-d' "
                                           + "class='ui-alt-icon' data-expanded-icon='carat-u'>");
                %>
                <div class="ui-grid-a">
                    <div class="ui-block-a">
                        <a href="#popupModActu" id="btnReference" data-rel="popup" data-position-to="window"
                       data-role="button"  data-transition="pop" class="ui-btn ui-shadow ui-corner-all ui-btn-a">
                            Modifier
                        </a>
                    </div>
                    <div class="ui-block-b">
                        <a href="#popupDeleteActu" id="btnReference" data-rel="popup" data-position-to="window"
                       data-role="button"  data-transition="pop" class="ui-btn ui-shadow ui-corner-all ui-btn-a">
                            Supprimer
                        </a>
                    </div>
                </div>
                <%
                        out.print("<h4>");
                        out.print(Utils.formatDate(actu.getDate()) + " - " + actu.getTitre());
                        out.println("</h4>");
                        out.print("<p>");
                        out.print(actu.getContenu());
                        out.println("</p>");
                        out.println("</div>");
                    }
                %>
            </div>
        </div>
            <!-- popup Ajouter une actualité -->
        <div id="popupAddActu" data-role="popup" data-theme="a" data-overlay-theme="b"
             class="ui-corner-all" data-corners="true" data-position-to="origin">
            <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow
               ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right" style="background-color:black;">
                Fermer
            </a>
            <div class="mesPopups"> 
                <center>
                    <p><%@include file="../includes/espace.jspf" %><br><strong>Ajouter une actualité</strong></p>
                </center>
                <strong>Titre:</strong>
                <form>
                    <strong>
                        <textarea style="FONT-FAMILY: Verdana" rows=1 name="textarea" placeholder="Titre"></textarea>
                </form>
                 <br>Contenu: 
                 <form>
                     <textarea style="FONT-FAMILY: Verdana" rows=5 name="textarea" placeholder="Rédigez ici"></textarea>
                 </form>
                 <div class="ui-grid-a">
                    <div class="ui-block-a">
                        <a href="#" id="btnEnvoyer" data-rel="back" data-position-to="window" 
                        class="ui-btn ui-corner-all ui-shadow" data-transition="pop">
                            Ajouter
                        </a>
                    </div>
                    <div class="ui-block-b">
                        <a href="#" id="btnAnnuler" data-rel="back" data-position-to="window" 
                        class="ui-btn ui-corner-all ui-shadow" data-transition="pop">
                            Annuler
                        </a>
                    </div>
                 </div>
            </div>
        </div>
        <!-- popup Modifier une actualité -->
        <div id="popupModActu" data-role="popup" data-theme="a" data-overlay-theme="b"
             class="ui-corner-all" data-corners="true" data-position-to="origin">
            <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow
               ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right" style="background-color:black;">
                Fermer
            </a>
            <div class="mesPopups"> 
                <center>
                    <p><%@include file="../includes/espace.jspf" %><br><strong>Modifier une actualité</strong></p>
                </center>
                <strong>Titre:</strong>
                <form>
                    <strong><textarea style="FONT-FAMILY: Verdana" rows=1 name="textarea" placeholder="">
Mise en ligne du site</textarea>
                </form>
                 <br>
                 Contenu: 
                 <form>
                     <textarea style="FONT-FAMILY: Verdana" rows=5 name="textarea" placeholder="">
Les BTS IRIS du lycée Victor Hugo de Colomiers ont réalisé ce site durant leur projet de fin d'année.
C'est une demande D'Alain Klotz, chercheur du CESR, dont l'intention était de proposer, à un public large non initié, la possibilité d'aider les chercheurs à découvrir des supernovae.
Ce site propose la mise à disposition quotidiennement d'une banque d'images centrées sur des galaxies proches et acquises dans la nuit par les télescopes du réseau CADOR/TAROT.</textarea>
                 </form>
                 <div class="ui-grid-a">
                    <div class="ui-block-a">
                        <a href="#" id="btnEnvoyer" data-rel="back" data-position-to="window" 
                        class="ui-btn ui-corner-all ui-shadow" data-transition="pop">
                            Ajouter
                        </a>
                    </div>
                    <div class="ui-block-b">
                        <a href="#" id="btnAnnuler" data-rel="back" data-position-to="window" 
                        class="ui-btn ui-corner-all ui-shadow" data-transition="pop">
                            Annuler
                        </a>
                    </div>
                 </div>
            </div>
        </div>
        <!-- popup Supprimer --> 
        <div id="popupDeleteActu" data-role="popup" data-theme="a" data-overlay-theme="b"
         class="ui-corner-all" data-corners="true" data-position-to="origin">
            <br/>
            <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow 
            ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right" style="background-color:black;">
                Fermer
            </a>
            <div class="mesPopups">
                <u><strong><center> 
                    Attention 
                </center></strong></u>
                <br/>
                Êtes vous sur de supprimer cette actualité ? 
                <div class="ui-grid-a">
                    <div class="ui-block-a">
                        <a href="#" id="btnOui" data-rel="back" data-position-to="window" 
                        class="ui-btn ui-corner-all ui-shadow" data-transition="pop">
                            Oui
                        </a>
                    </div>
                    <div class="ui-block-b">
                        <a href="#" id="btnNon" data-rel="back" data-position-to="window" 
                        class="ui-btn ui-corner-all ui-shadow" data-transition="pop">
                            Non
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="includes/a_footer.jspf" %>
    </div>
    </body>
</html>