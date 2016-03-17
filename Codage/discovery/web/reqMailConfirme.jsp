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
    String pseudo = request.getParameter("pseudo");
    String mailconfirme = request.getParameter("key");
    User u = User.getByPseudo(con, pseudo);
    String key = u.getMailConfirme();
    if(!u.getMailConfirme().equals("ok"))
    {
        if(mailconfirme.equals(key))
        {
            u.setMailConfirme("ok");
            u.save(con);
            request.getRequestDispatcher("mailConfirme.jsp?msg=Ce compte est maintenant confirmé !").forward(request, response); 
        }
        else
        {
            request.getRequestDispatcher("mailConfirme.jsp?msg=La confirmation a échoué, veuillez réessayer ou contacter l'administrateur.").forward(request, response); 
        }
    }
    else
    {
         request.getRequestDispatcher("mailConfirme.jsp?msg=Ce compte est déjà confirmé").forward(request, response); 
    }
    
%>