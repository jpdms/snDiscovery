<%@page import="com.metier.*"%>
<%@page import="com.persistence.*"%>
<%@page pageEncoding="UTF-8"%>
<jsp:useBean id="monAppli" scope="application" class="com.metier.DiscoApplication"/>
<%
    String chemin = request.getParameter("chemin").trim();
    String cheminref = request.getParameter("cheminref").trim();
    Reference.remplacer(chemin, cheminref);
    request.getRequestDispatcher("../disco.jsp").forward(request, response);
%>