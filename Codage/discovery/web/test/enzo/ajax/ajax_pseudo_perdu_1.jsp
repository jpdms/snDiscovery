<%@page import="java.sql.Connection"%>
<%@page import="com.metier.*"%>
<%@page import="com.persistence.*"%>
<%
    Connection con = (Connection) session.getAttribute("con");
    if (con == null)
        con = ConnexionMySQL.newConnexion();
    session.setAttribute("con", con);
    String mdp = com.persistence.Utils.encryptPassword("test");
    User.create(con, "test", "test", "blanchonenzo@gmail.com", mdp, "ok");
%>