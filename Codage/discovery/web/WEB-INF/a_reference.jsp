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
    <%@include file="../includes/a_div_header.jspf" %>
        <h1>Référence</h1>
        <%@include file="../includes/a_user.jspf" %>
    </div>
    
    <div role="main" class="ui-content ">
            <%
                int i=1;
                String idMove = request.getParameter("idMove");
                if(idMove!=null){
                    i = Integer.parseInt(idMove);
                }
                CandidateReference can = CandidateReference.findAll(con, i);
                if(can == null){
                    request.getRequestDispatcher("../discovery.jsp?action=aRef_null").forward(request, response);
                }
                int totalSize = CandidateReference.size(con);
            %>
        <br/><br/><br/>
        <div class="mesImages" align="center">
            <a href="#popupZoomLeft" id="clicZoomLeft" data-rel="popup" class="ui-link">
                <img id="imgobs" alt="erreur:image absente" src="<%=can.getChemin()%>">
            </a>
            <a href="#popupZoomRight" id="clicZoomRight" data-rel="popup" class="ui-link">
                <img id="imgref" alt=".... aucune référence ...." src="/jpeg/refgal/<%=can.getNomGalaxie()%>.jpg">
            </a>
        </div>
        <center><h3>Nouvelle image de référence proposée par : <strong><%=can.getUserPseudo()%></strong></h3></center>
            <table class="infosTable">
                <td class="texteCentre" id="dateImages"><%=can.getDateDisco()%></td>
                <td class="texteCentre" id="numImages" >(<%=i%>/<%=CandidateReference.size(con)%>)</td>
                <td class="texteCentre" id="nomGalaxie"><%=can.getNomGalaxie()%></td>
            </table>
            <div align="center">
                <div class="ui-grid-a">
                    <div class="ui-block-a">
                        <%
                        if(i>1){
                        %>
                        <a href="discovery.jsp?action=aRef&idMove=<%=i-1%>" data-ajax="false" id="btnPcdt" data-icon="arrow-l" data-iconpos="left" 
                           data-role="button">
                            Précédent
                        </a>
                        <%}
                        else{%>
                        <a href="#" id="btnPcdt" data-icon="arrow-l" data-iconpos="left" 
                           class="ui-state-disabled" data-role="button">
                            Précédent
                        </a>  
                        <%}%>
                    </div>
                    <div class="ui-block-b">
                        <%
                        if(i+1>totalSize){%>
                        <a href="#" id="btnSvt" data-icon="arrow-r" data-iconpos="right" 
                             class="ui-state-disabled" data-role="button">
                            Suivant
                        </a>
                        <%}
                        else{%>
                        <a href="discovery.jsp?action=aRef&idMove=<%=i+1%>" data-ajax="false" id="btnSvt" data-icon="arrow-r" data-iconpos="right" 
                             data-role="button">
                            Suivant
                        </a>
                        <%}
                        %>
                    </div>
                </div>
            </div>
        <div class="ui-grid-a">
            <div class="ui-block-b">
                <a href="#popupValider" id="btnValider" data-rel="popup" data-position-to="window" 
                   class="ui-btn ui-corner-all ui-shadow" data-transition="pop">Valider</a>
            </div>
            <div class="ui-block-b">
                <a href="#popupRefuser" id="btnRefuser" data-rel="popup" data-position-to="window"
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
                        <form id="formValider" method="post" action="discovery.jsp?action=aRefAdd">
                            <input type="hidden" name="userPseudo" value="<%=can.getUserPseudo()%>"/>
                            <input type="hidden" name="chemin" value="<%=can.getChemin()%>"/>
                            <input type="hidden" name="cheminref" value="C:/Users/blanc/Documents/jpeg/refgal/<%=can.getNomGalaxie()%>.jpg"/>
                            <a href="javascript:{}" onclick="document.getElementById('formValider').submit();"  id="btnOui" data-rel="true" data-position-to="window" 
                           class="ui-btn ui-corner-all ui-shadow" data-transition="pop">Oui</a>
                        </form>
                        
                    </div>
                    <div class="ui-block-b">
                        <a href="#" id="btnNon" data-rel="back" data-position-to="window" 
                           class="ui-btn ui-corner-all ui-shadow" data-transition="pop">Non</a>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- popup refuser -->
        <div id="popupRefuser" data-role="popup" data-theme="a" data-overlay-theme="b"
             class="ui-corner-all" data-corners="true" data-position-to="origin">
            <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow
               ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right" style="background-color:black;">Fermer</a>
            <div class="mesPopups"> 
                <center><p>Voulez-vous refuser cette proposition de référence ? <br><strong>Cette action est irreversible</strong></p></center>
                <div class="ui-grid-a">
                    <div class="ui-block-a">
                        <form id="formRefuser" method="post" action="discovery.jsp?action=aRefDel">
                            <input type="hidden" name="userPseudo" value="<%=can.getUserPseudo()%>"/>
                            <input type="hidden" name="chemin" value="<%=can.getChemin()%>"/>
                            <input type="hidden" name="cheminref" value="C:/Users/IRISINSTALL/Documents/jpeg/refgal/<%=can.getNomGalaxie()%>.jpg"/>
                            <a href="javascript:{}" onclick="document.getElementById('formRefuser').submit();"  id="btnOui" data-rel="true" data-position-to="window" 
                           class="ui-btn ui-corner-all ui-shadow" data-transition="pop">Oui</a>
                        </form>
                        
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
