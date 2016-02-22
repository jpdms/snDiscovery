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
    DiscoSession maSession = (DiscoSession)session.getAttribute("maSession");
    User user = maSession.getUser();
    int grade = user.getGrade();
    if (grade==5) {
            // création de la session admin
            maSession.setModeExpert(true);
            request.getRequestDispatcher("a_index.jsp").forward(request, response);
    }
%>