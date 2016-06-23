<%-- 
    Document   : reqLogin
    Created on : 4 févr. 2014, 08:22:56
    Author     : jpdms
--%>

<%@page import="com.metier.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.persistence.ConnexionMySQL"%>
<%@page import="com.persistence.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Instancie l'objet DiscoSession
    DiscoSession maSession = (DiscoSession)session.getAttribute("maSession");
    // Instancie l'objet User grace au nom de l'utilisateur récuperer dans la variable session
    User user = maSession.getUser();
    // Recupere le grade
    int grade = user.getGrade();
    // Verifie que son grade est a 5
    if (user.getGrade()==5) {
            // active la variable session ModeExpert
            maSession.setModeExpert(true);
            // Redirige vers la page compte administrateur
            request.getRequestDispatcher("a_compte.jsp").forward(request, response);
    }
    // Si le grade est pas a 5 on le redirige vers la page compte user
    else {request.getRequestDispatcher("../compte.jsp").forward(request, response);}
%>