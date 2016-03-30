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
        <title>Recherche : <%=request.getParameter("recherche")%></title>
        <%@include file="../includes/a_head.jspf"%>
    </head>

    <body>
        <div class="page" data-role="page" id="infoUserPage">
            <%@include file="../includes/div_header.jspf" %>
            <h1>Recherche : <%=request.getParameter("recherche")%></h1>
            <%@include file="../includes/a_user.jspf" %>
        </div>
        <script type="text/javascript" src="js/jquery.validate.min.js"></script>
        <script>
            $.validator.addMethod("textOnly", 
                function(value, element) {  // un car n'est pas alphanumérique
                    return !/[^a-zA-Z0-9]/.test(value);
                }, "Que des caractères alphanumériques."
            );

                    $(document).ready(function () {
                    $('#formRecherches').validate({
                        rules: {
                            recherche: {
                                minlength: 4, maxlength: 20, textOnly: true, required: true
                            }
                        },
                        messages: {
                            recherche: {
                                minlength: "Au moins 4 caractères",
                                maxlength: "Au max 20 caractères",
                                required:  "Entrez votre pseudo."
                            }
                        },
                        errorPlacement: function (error, element) {
                            error.appendTo(element.parent().next());
                        }
                    });
                    });
        </script>
        <div role="main" id="mainInfoUser" class="ui-content">
            <br/><br/><br/>
            <div>
                <%
                    if(!maSession.isModeExpert()){
                        request.getRequestDispatcher("discovery.jsp?action=pbAdminMode").forward(request, response);
                    }
                %>
            </div>
            <%
                User uRecherche;
                int nbrUser;
                int size = User.sizeRecherche(con, request.getParameter("recherche"));
                String nUser = request.getParameter("nbrUser");
                if(nUser==null){
                    nbrUser=1;
                }
                else{
                    nbrUser = Integer.parseInt(nUser);
                }
                if(request.getParameter("recherche")!=null){
                    if(User.findByPseudo(con,nbrUser ,request.getParameter("recherche"))==null){
                        uRecherche = User.find(con, nbrUser);
                        size = User.size(con);
                        %>
                        <h3 style="color:red;">Aucun utilisateur ne correspond a : <strong><%=request.getParameter("recherche")%></strong></h3>
                        <p>Liste des utilisateurs :</p>
                    <%}
                    else{
                        uRecherche = User.findByPseudo(con,nbrUser ,request.getParameter("recherche"));
                        %>
                        <p>Liste des utilisateurs similaires à <%=request.getParameter("recherche")%> :</p>
                        <%
                    }
                }
                else{
                    uRecherche = User.find(con, nbrUser);
                }
            %>
            <div style="padding:8px; padding-left:6px; border:1px dotted; margin: 6px; ">
                <h3>Informations sur le compte :</h3>
                <table style="margin-left:5%">
                        <tr>
                            <td><strong>Pseudo :</strong></td><td>&emsp;&emsp;<%= uRecherche.getPseudo() %></td>
                        </tr>
                        <tr>
                            <td><strong>Nom :</strong></td><td>&emsp;&emsp;<%= uRecherche.getUsername() %></td>
                        </tr>
                        <tr>
                            <td><strong>EMail :</strong></td><td>&emsp;&emsp;<%= uRecherche.getEmail() %></td>
                        </tr>
                        <tr>
                            <td><strong>Grade :</strong></td><td>&emsp;&emsp;<%= uRecherche.getGrade() %></td>
                        </tr>
                        <tr>
                            <td><strong>Première Visite : </strong></td><td>&emsp;&emsp;<%=new SimpleDateFormat("EEEEEEEE dd MMMMMMMMM yyyy à HH:mm").format(uRecherche.getRegisterDate())%></td>
                        </tr>
                        <tr>
                            <td><strong>Dernière Visite : </strong></td><td>&emsp;&emsp;<%=new SimpleDateFormat("EEEEEEEE dd MMMMMMMMM yyyy à HH:mm").format(uRecherche.getLastVisitDate())%></td>
                        </tr>
                        <tr>
                            <td><strong>Nombre total de connexions :</strong></td><td>&emsp;&emsp;<%= uRecherche.getNbConnexions() %></td>
                        </tr>
                        <tr>
                            <td><strong>Nombre de candidates : </strong></td><td>&emsp;&emsp;<%= uRecherche.getNbCandidates() %></td>
                        </tr>                
                        <tr>
                            <td><strong>Nombre de découvertes : </strong></td><td>&emsp;&emsp;0</td>
                        </tr>
                </table>
            </div>
            <a href="discovery.jsp?action=gestioncompte&pseudo=<%=uRecherche.getPseudo()%>" class="ui-btn ui-shadow ui-corner-all ui-btn-a">
                Modifier
            </a>
            <hr/>
            <div class="ui-grid-d">
                <div class="ui-block-a">
                    <div class="ui-grid-a">
                        <div class="ui-block-a"></div>
                        <div class="ui-block-b"><div style="height:60px"><a data-transition="fade" class="ui-btn ui-corner-all ui-shadow" href="discovery.jsp?action=aGestionRecherche&recherche=<%=request.getParameter("recherche")%>&nbrUser=1">|<<</a></div></div>
                    </div>
                </div>
                <div class="ui-block-b">
                <div class="ui-grid-a">
                    <div class="ui-block-a"><div style="height:60px"><a data-transition="fade" class="ui-btn ui-corner-all ui-shadow" href="#"><<</a></div></div>
                    <%            
                    if(nbrUser>1){%>
                        <div class="ui-block-b"><div style="height:60px"><a data-transition="fade" class="ui-btn ui-corner-all ui-shadow" href="discovery.jsp?action=aGestionRecherche&recherche=<%=request.getParameter("recherche")%>&nbrUser=<%=nbrUser-1%>"><</a></div></div>
                    <%}
                    else{%>
                        <div class="ui-block-b"><div style="height:60px"><a data-transition="fade" class="ui-btn ui-corner-all ui-shadow" href="#"><</a></div></div>
                    <%}
                    %>
                </div>
                </div>
                <div class="ui-block-c">
                    <div class="ui-block-a"></div>
                    <div class="ui-block-b"></div>            
                </div>
                <div class="ui-block-d">
                <div class="ui-grid-a">
                    <%            
                    if(nbrUser<size){%>
                        <div class="ui-block-a"><div style="height:60px"><a data-transition="fade" class="ui-btn ui-corner-all ui-shadow" href="discovery.jsp?action=aGestionRecherche&recherche=<%=request.getParameter("recherche")%>&nbrUser=<%=nbrUser+1%>">></a></div></div>
                    <%}
                    else{%>
                        <div class="ui-block-b"><div style="height:60px"><a data-transition="fade" class="ui-btn ui-corner-all ui-shadow" href="#">></a></div></div>
                    <%}
                    %>
                    <div class="ui-block-b"><div style="height:60px"><a data-transition="fade" class="ui-btn ui-corner-all ui-shadow" href="#">>></a></div></div>
                </div>
                </div>
                <div class="ui-block-e">
                <div class="ui-grid-a">
                    <div class="ui-block-a"><div style="height:60px"><a data-transition="fade" class="ui-btn ui-corner-all ui-shadow" href="discovery.jsp?action=aGestionRecherche&recherche=<%=request.getParameter("recherche")%>&nbrUser=<%=size%>">>>|</a></div></div>
                    <div class="ui-block-b"></div>
                </div>
                </div>
            </div>
        </div>
        <%@include file="../includes/a_footer.jspf" %>
        </div>
    </body>
</html>