<%-- 
    Document   : reqChangerProfil
    Created on : 4 févr. 2014, 08:35:12
    Author     : jpdms
--%>

<%@page import="java.sql.Connection"%>
<%@page import="com.metier.*"%>
<%@page import="com.persistence.*"%>
<%@page pageEncoding="UTF-8"%>

<jsp:useBean id="monAppli" scope="application" class="com.metier.DiscoApplication"/>
<%
    Connection con = (Connection) session.getAttribute("con");
    if (con == null)
        con = ConnexionMySQL.newConnexion();
    session.setAttribute("con", con);
    String pseudo   = request.getParameter("userPseudo");
    String nomGalaxie      = request.getParameter("nomGalaxieRef");
    String cheminObs    = request.getParameter("cheminRef");
    String cheminRef = "C:/Users/blanc/Documents/jpeg/refgal/"+nomGalaxie+".jpg";
    String tChemin[] = cheminObs.split("/");
    String chemin = "C:/Users/blanc/Documents/jpeg/" + tChemin[4] + "/" + tChemin[5] + "/" + tChemin[6];
    User userMod = User.getByPseudo(con, pseudo);
    if(userMod.getGrade()==5){
        request.getRequestDispatcher("changerReference.jsp?chemin="+chemin+"&cheminref="+cheminRef).forward(request, response);
    }
    else{
        if(CandidateReference.isCandidateExiste(con, pseudo, nomGalaxie, cheminObs)){
            request.getRequestDispatcher("../msgDisco.jsp?msg=Vous ne pouvez pas soumettre deux fois la même image de référence...").forward(request, response);
        }
        else{
            CandidateReference.create(con, pseudo, nomGalaxie, cheminObs);
            request.getRequestDispatcher("../disco.jsp").forward(request, response);
        }
    }
%>