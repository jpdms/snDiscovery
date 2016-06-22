<%@page import="java.sql.Connection"%>
<%@page import="com.metier.*"%>
<%@page import="com.persistence.*"%>
<%
    Connection con = (Connection) session.getAttribute("con");
    if (con == null)
        con = ConnexionMySQL.newConnexion();
    session.setAttribute("con", con);
    User user = User.getByPseudo(con, "test");
    String pass  = request.getParameter("pass");
    user.setPassword(pass);
    user.save(con);
%>