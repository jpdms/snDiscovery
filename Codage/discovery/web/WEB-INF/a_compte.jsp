<%-- 
    Document   : Contrôleur du site
    Created on : 29 janv. 2014, 16:54:26
    Author     : 
--%>

<%@page import="com.metier.*"%>
<%@page import="com.persistence.*"%>

<%
    com.metier.DiscoSession maSession = (com.metier.DiscoSession)session.getAttribute("maSession");
    if (maSession != null) {
        com.persistence.User user = maSession.getUser();
        if (user != null) {
            // Si pas admin
            if(!maSession.isModeExpert()){
                request.getRequestDispatcher("discovery.jsp?action=pbAdminMode").forward(request, response);
            } 
            else {
                request.getRequestDispatcher("a_infoUser.jsp").forward(request, response);
            }
        }
        else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
    else {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
%>

