<%-- 
    Document   : reqLogin
    Created on : 4 févr. 2014, 08:22:56
    Author     : jpdms
--%>

<%@page import="com.metier.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.persistence.*"%>
<%@page pageEncoding="UTF-8"%>

<%
    Connection con = (Connection) session.getAttribute("con");
    if (con == null)
        con = ConnexionMySQL.newConnexion();
    session.setAttribute("con", con);
    
    String pseudo = request.getParameter("accountPseudo");
    String password = request.getParameter("accountPassword");
    User user = User.getByPseudo(con, pseudo);
    // la personne existe ?
    if (user != null) {
        String pwd1 = user.getPassword();
        String pwd2 = com.persistence.Utils.encryptPassword(password);
        // le mot de passe est t'il bon ?
        if (pwd2.equals(pwd1)) {
            // le user est interdit d'accès
            if (user.isBlocked()) {
                request.getRequestDispatcher("login.jsp?message=bloque").forward(request, response);
            }
            else if(!user.getMailConfirme().equals("ok")){
                request.getRequestDispatcher("login.jsp?message=mailconfirme").forward(request, response);
            }
            else{
                // création de la session user
                DiscoSession demoSession = new DiscoSession(con, user);
                session.setAttribute("maSession", demoSession);
                // on est loggé, on peut montrer la page applicative
                request.getRequestDispatcher("infoUser.jsp").forward(request, response);
            }
        }
        else {
            request.getRequestDispatcher("login.jsp?message=pbLogin").forward(request, response);
        }
    }
    else {      // la personne n'existe pas
        request.getRequestDispatcher("login.jsp?message=pbLogin").forward(request, response);
    }
%>