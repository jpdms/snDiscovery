<%@page import="java.sql.Connection"%>
<%@page import="com.metier.*"%>
<%@page import="com.persistence.*"%>
<%
    Connection con = (Connection) session.getAttribute("con");
    if (con == null)
        con = ConnexionMySQL.newConnexion();
    session.setAttribute("con", con);
    User u = User.getByPseudo(con, "test");
    String pass  = request.getParameter("pass");
    String contenu = "Bonjour Mme/Mr " + u.getUsername() + " ! \n\n"
                    + "Votre avez lancez une requête pour changer votre mot de passe."
                    + "\nVotre pseudo est " + u.getPseudo()
                    + "\nVotre nouveau mot de passe est : " + pass
                    + "\nN'oubliez pas de le changer !"
                    + "\nSi vous n'avez pas demander ce changement contactez un administrateur au plus vite !"
                    + "\n\nA bientôt à la découverte de Supernovae :)";
    // envoi du mail par gmail
    boolean ok = SmtpSend.sendMessage("Nouveau mot de passe", contenu, u.getEmail());
%>