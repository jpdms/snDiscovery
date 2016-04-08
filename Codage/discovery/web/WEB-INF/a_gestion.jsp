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
        <title>Gestion</title>
        <%@include file="../includes/a_head.jspf"%>
    </head>

    <body>
        <div class="page" data-role="page" id="infoUserPage">
            <%@include file="../includes/a_div_header.jspf" %>
            <h1>Gestion</h1>
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
                    $('#formRecherche').validate({
                        rules: {
                            recherche: {
                                minlength: 1, maxlength: 20, textOnly: true, required: true
                            }
                        },
                        messages: {
                            recherche: {
                                minlength: "Au moins 1 caractères",
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
            <form id="formRecherche" method="post" action="discovery.jsp">
                <blockquote>
                    <input type="search" name="recherche" placeholder="Entrez un pseudo." id="recherche">
                    <span></span>
                </blockquote>
                <input name="action" type="hidden" value="aGestionRecherche"/>
                <button type="submit" name="submitOK" data-theme="a">Recherche</button>
            </form>
            <hr/><br/>    
            <div style="padding:8px; padding-left:6px; border:1px dotted; margin: 6px; ">
                <h3>Informations sur le compte :</h3>
                <%
                    int size = User.size(con);
                    int nbrUser;
                    String nUser = request.getParameter("nbrUser");
                    if(nUser==null){
                        nbrUser=1;
                    }
                    else{
                        nbrUser = Integer.parseInt(nUser);
                    }
                    User uRecherche = User.find(con, nbrUser);
                %>
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
                        <div class="ui-block-b"><a class="ui-btn ui-corner-all ui-shadow" href="discovery.jsp?action=aGestion&nbrUser=1">|<<</a></div>
                    </div>
                </div>
                <div class="ui-block-b">
                    <div class="ui-grid-a">
                        <div class="ui-block-b">
                            <a class="ui-btn ui-corner-all ui-shadow" href="#"><<</a>
                        </div>
                        <%            
                        if(nbrUser>1){%>
                            <div class="ui-block-b">
                                <a class="ui-btn ui-corner-all ui-shadow" href="discovery.jsp?action=aGestion&nbrUser=<%=nbrUser-1%>"><</a>
                            </div>
                        <%}
                        else{%>
                            <div class="ui-block-b">
                                <a class="ui-btn ui-corner-all ui-shadow" href="#"><</a>
                            </div>
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
                            <div class="ui-block-a"><a class="ui-btn ui-corner-all ui-shadow" href="discovery.jsp?action=aGestion&nbrUser=<%=nbrUser+1%>">></a></div>
                        <%}
                        else{%>
                            <div class="ui-block-b"><a class="ui-btn ui-corner-all ui-shadow" href="#">></a></div>
                        <%}
                        %>
                        <div class="ui-block-b"><a class="ui-btn ui-corner-all ui-shadow" href="#">>></a></div>
                    </div>
                </div>
                <div class="ui-block-e">
                <div class="ui-grid-a">
                    <div class="ui-block-a"><a class="ui-btn ui-corner-all ui-shadow" href="discovery.jsp?action=aGestion&nbrUser=<%=size%>">>>|</a></div>
                    <div class="ui-block-b"></div>
                </div>
                </div>
            </div>
        </div>
        <%@include file="../includes/a_footer.jspf" %>
        </div>
    </body>
</html>