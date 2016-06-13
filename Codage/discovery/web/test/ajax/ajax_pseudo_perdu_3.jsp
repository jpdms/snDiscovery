<%@page import="java.sql.Connection"%>
<%@page import="com.metier.*"%>
<%@page import="com.persistence.*"%>
<%
    Connection con = (Connection) session.getAttribute("con");
    if (con == null)
        con = ConnexionMySQL.newConnexion();
    session.setAttribute("con", con);
    User u = User.getByPseudo(con, "test");
    String contenu = "Bonjour " + u.getUsername() + ".\n\n"
                    + "Vous avez lancé une requête pour retrouver votre pseudo."
                    + "\nVotre pseudo est " + u.getPseudo()
                    + "\nN'oubliez pas de le noter quelque part."
                    + "\n\nÀ bientôt à la découverte de Supernovae :)";
    // envoi du mail par gmail
    boolean ok = SmtpSend.sendMessage("Votre pseudo", contenu, u.getEmail());
%>