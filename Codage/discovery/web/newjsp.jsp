<%-- 
    Document   : newjsp
    Created on : 7 avr. 2016, 17:08:12
    Author     : IRISINSTALL
--%>

<%@page import="java.sql.Connection"%>
<%@page import="com.persistence.ConnexionMySQL"%>
<%@page import="com.persistence.User"%>
<%@page import="com.persistence.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con = (Connection) session.getAttribute("con");
            if (con == null)
                con = ConnexionMySQL.newConnexion();
            session.setAttribute("con", con);
            com.persistence.User user = User.getByPseudo(con, "user1");
            String queryString = "select `id` from image "
            + "where `Date`='"+user.getlastImgDate()+"'";
            Statement lStat = con.createStatement(
                                                ResultSet.TYPE_SCROLL_INSENSITIVE, 
                                                ResultSet.CONCUR_READ_ONLY);
            ResultSet lResult = lStat.executeQuery(queryString);
        %>
        <h1><%=lResult.next()%></h1>
    </body>
</html>
