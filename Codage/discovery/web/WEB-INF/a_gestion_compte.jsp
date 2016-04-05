<%-- 
    Document   : infoUser
    Created on : 28 mai 2014, 14:54:51
    Author     : jpdms
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.persistence.Utils"%>
<%@page import="com.persistence.User"%>
<%@page import="com.metier.DiscoSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Gestion du compte : <%=request.getParameter("pseudo")%></title>
    <%@include file="../includes/a_head.jspf"%>
</head>

<body>
<div class="page" data-role="page" id="infoUserPage">
    <%@include file="../includes/div_header.jspf" %>
        <h1>Gestion du compte : <%=request.getParameter("pseudo")%></h1>
        <%@include file="../includes/a_user.jspf" %>
        <%
        if(!maSession.isModeExpert()){
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        %>
</div>
        <div role="main" id="mainInfoUser" class="ui-content">
            <br/><br/><br/>
            <div>
                <%
                    if(!maSession.isModeExpert()){
                        request.getRequestDispatcher("discovery.jsp?action=pbAdminMode").forward(request, response);
                    }
                %>
            </div>
        <div style="padding:8px; padding-left:6px; border:1px dotted; margin: 6px; ">
                <h3>Informations sur le compte :</h3>
                <%
                    String pUser = request.getParameter("pseudo");
                    User userMod = User.getByPseudo(con, pUser);
                %>
                <table style="margin-left:5%">
                        <%
                        if(userMod.isBlocked()){
                        %>
                            <tr>
                                <td><strong style="color:red">Cette utilisateur est blacklisté.</strong></td>
                            </tr>
                        <%
                        }
                        %>
                        <tr>
                            <td><strong>Pseudo :</strong></td><td>&emsp;&emsp;<%= userMod.getPseudo() %></td>
                        </tr>
                        <tr>
                            <td><strong>Nom :</strong></td><td>&emsp;&emsp;<%= userMod.getUsername() %></td>
                        </tr>
                        <tr>
                            <td><strong>EMail :</strong></td><td>&emsp;&emsp;<%= userMod.getEmail() %></td>
                        </tr>
                        <tr>
                            <td><strong>Grade :</strong></td><td>&emsp;&emsp;<%= userMod.getGrade() %></td>
                        </tr>
                        <tr>
                            <td><strong>Première Visite : </strong></td><td>&emsp;&emsp;<%=new SimpleDateFormat("EEEEEEEE dd MMMMMMMMM yyyy à HH:mm").format(userMod.getRegisterDate())%></td>
                        </tr>
                        <tr>
                            <td><strong>Dernière Visite : </strong></td><td>&emsp;&emsp;<%=new SimpleDateFormat("EEEEEEEE dd MMMMMMMMM yyyy à HH:mm").format(userMod.getLastVisitDate())%></td>
                        </tr>
                        <tr>
                            <td><strong>Nombre total de connexions :</strong></td><td>&emsp;&emsp;<%= userMod.getNbConnexions() %></td>
                        </tr>
                        <tr>
                            <td><strong>Nombre de candidates : </strong></td><td>&emsp;&emsp;<%= userMod.getNbCandidates() %></td>
                        </tr>                
                        <tr>
                            <td><strong>Nombre de découvertes : </strong></td><td>&emsp;&emsp;0</td>
                        </tr>
                </table>
        </div>
        
        <!--- Ligne avec 2 boutons :-->
        <br/>
        <div class="ui-grid-a">
            <%
            if(userMod.isBlocked()){
            %>
                <div class="ui-block-a">
                    <a href="#popupDebloquer" id="bloquer" data-rel="popup" data-position-to="window" 
                    class="ui-btn ui-corner-all ui-shadow">Debloquer</a>
                </div> 
            <%
            }
            else{
            %>
                <div class="ui-block-a">
                    <a href="#popupBloquer" id="bloquer" data-rel="popup" data-position-to="window" 
                    class="ui-btn ui-corner-all ui-shadow">Bloquer</a>
                </div> 
            <%
            }
            %>
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
        </div>
        <!-- popup bloquer --> 
        <div id="popupBloquer" data-role="popup" data-theme="a" data-overlay-theme="b"
         class="ui-corner-all" data-corners="true" data-position-to="origin">
            <br/>
        <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow 
        ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right" style="background-color:black;">Fermer</a>
            <div class="mesPopups">
                <u><strong><center> Attention </center> </strong></u><br/>
                Êtes-vous sûr de bloquer cette personne ? 
                <div class="ui-grid-a">
                    <div class="ui-block-a">
                        <a href="discovery.jsp?action=blacklist&pseudo=<%=userMod.getPseudo()%>&mod=true" id="btnOui" data-position-to="window" 
                        class="ui-btn ui-corner-all ui-shadow">Oui</a>
                    </div>
                    <div class="ui-block-b">
                        <a href="#" id="btnNon" data-rel="back" data-position-to="window" 
                        class="ui-btn ui-corner-all ui-shadow" data-transition="pop">Non</a>
                    </div>
                </div>
            </div>
        </div>        
        <!-- popup Debloquer --> 
        <div id="popupDebloquer" data-role="popup" data-theme="a" data-overlay-theme="b"
         class="ui-corner-all" data-corners="true" data-position-to="origin">
            <br/>
        <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow 
        ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right" style="background-color:black;">Fermer</a>
            <div class="mesPopups">
                <u><strong><center> Attention </center> </strong></u><br/>
                Êtes-vous sûr de débloquer cette personne ? 
                <div class="ui-grid-a">
                    <div class="ui-block-a">
                        <a href="discovery.jsp?action=blacklist&pseudo=<%=userMod.getPseudo()%>&mod=false" id="btnOui" data-position-to="window" 
                        class="ui-btn ui-corner-all ui-shadow">Oui</a>
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
                        <form id="formGrade" method="post" action="discovery.jsp?action=changergrade">
                            <input type="range" name="grade" id="grade" value="<%=userMod.getGrade()%>" min="1" max="5" step="1" data-highlight="true"  />
                            <input name="pseudo" id="pseudo" type="hidden" value="<%=userMod.getPseudo()%>"/>
                    </div>
                    <!-- bouton valider et annuler dans le popup changer de grade-->
                    <div class="ui-grid-a">
                        <div class="ui-block-a">
                            <a href="javascript:{}" onclick="document.getElementById('formGrade').submit();" id="btnValider" data-position-to="window" 
                            class="ui-btn ui-corner-all ui-shadow">Valider</a>
                        </form>
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
                <form id="formContact" method="post" action="discovery.jsp?action=gestioncontact">
                    <input name="pseudo" id="pseudo" type="hidden" value="<%=userMod.getPseudo()%>"/>
                    <strong> Objet:
                    <textarea style="FONT-FAMILY: Verdana" rows=1 name="objet" placeholder="Ajouter un objet"></textarea>
                     <br>
                     Contenu: </strong>
                     <textarea style="FONT-FAMILY: Verdana" rows=5 name="contenu" placeholder="Rédigez ici"></textarea>
                     <div class="ui-grid-a">
                        <div class="ui-block-a">
                            <a href="javascript:{}" onclick="document.getElementById('formContact').submit();" id="btnEnvoyer" data-position-to="window" 
                            class="ui-btn ui-corner-all ui-shadow">Envoyer</a>
                        </div>
                        <div class="ui-block-b">
                            <a href="#" id="btnAnnuler" data-rel="back" data-position-to="window" 
                            class="ui-btn ui-corner-all ui-shadow" data-transition="pop">Annuler</a>
                        </div>
                     </div>
                </form>
            </div>
        </div>
    </div>
    <%@include file="../includes/a_footer.jspf" %>
</div>
</body>
</html>
