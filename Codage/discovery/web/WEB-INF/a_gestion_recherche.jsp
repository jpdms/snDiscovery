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
            <%@include file="../includes/div_header.jspf" %>
            <h1>Gestion</h1>
            <%@include file="../includes/a_user.jspf" %>
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
            <blockquote>
                <input type="search" value="<%=request.getParameter("recherche")%>" name="search" placeholder="Entrez un pseudo." id="search">
            </blockquote>
            <button onclick="window.location.href='discovery.jsp?action=gestionrecherche'">
                Rechercher
            </button>
            <hr/><br/>    
            <div style="padding:8px; padding-left:6px; border:1px dotted; margin: 6px; ">
                <h3>Informations sur le compte :</h3>
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
                        if(User.findByPseudo(con,nbrUser ,request.getParameter("recherche"))==null){%>
                            Erreur de redirection
                            Au pire on rempli le formulaire suivant avec la premiere entré de la base
                            et en affichant un texte d'erreur.
                        <%}
                        uRecherche = User.findByPseudo(con,nbrUser ,request.getParameter("recherche"));
                    }
                    else{
                        uRecherche = User.find(con, nbrUser);
                    }
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
            <div class="ui-grid-d" style="margin-left:15px; margin-right: -15px;">
                <div class="ui-block-a">
                    <div class="ui-grid-a">
                        <div class="ui-block-a"></div>
                        <div class="ui-block-b"><div style="height:60px"><a href="discovery.jsp?action=aGestionRecherche&recherche=<%=request.getParameter("recherche")%>&nbrUser=1">|<<</a></div></div>
                    </div>
                </div>
                <div class="ui-block-b">
                <div class="ui-grid-a">
                    <div class="ui-block-a"><div style="height:60px"><a href="#"><<</a></div></div>
                    <%            
                    if(nbrUser>1){%>
                        <div class="ui-block-b"><div style="height:60px"><a href="discovery.jsp?action=aGestionRecherche&recherche=<%=request.getParameter("recherche")%>&nbrUser=<%=nbrUser-1%>"><</a></div></div>
                    <%}
                    else{%>
                        <div class="ui-block-b"><div style="height:60px"><a href="#"><</a></div></div>
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
                        <div class="ui-block-a"><div style="height:60px"><a href="discovery.jsp?action=aGestionRecherche&recherche=<%=request.getParameter("recherche")%>&nbrUser=<%=nbrUser+1%>">></a></div></div>
                    <%}
                    else{%>
                        <div class="ui-block-b"><div style="height:60px"><a href="#">></a></div></div>
                    <%}
                    %>
                    <div class="ui-block-b"><div style="height:60px"><a href="#">>></a></div></div>
                </div>
                </div>
                <div class="ui-block-e">
                <div class="ui-grid-a">
                    <div class="ui-block-a"><div style="height:60px"><a href="discovery.jsp?action=aGestionRecherche&recherche=<%=request.getParameter("recherche")%>&nbrUser=<%=size%>">>>|</a></div></div>
                    <div class="ui-block-b"></div>
                </div>
                </div>
            </div>
            <a href="discovery.jsp?action=aGestion" class="ui-btn ui-shadow ui-corner-all ui-btn-a">
                Retour
            </a> 
        </div>
        <%@include file="../includes/a_footer.jspf" %>
        </div>
    </body>
</html>