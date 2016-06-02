<%@page import="java.sql.Connection"%>
<%@page import="com.metier.*"%>
<%@page import="com.persistence.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con = (Connection) session.getAttribute("con");
    if (con == null)
        con = ConnexionMySQL.newConnexion();
    session.setAttribute("con", con);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test unitaire compte</title>
    </head>
    <body>
        Test de création de compte<br/>
        <%
            //Création d'un utilisateur avec le mail déja validé.
            User.create(con, "test", "test", "test@test.com", "test", "ok");
            User user = User.getByPseudo(con, "test");
            if(user!=null){
                out.print("Compte correctement crée<br/><br/>");
            }
            else{
                out.print("Erreur de création du compte<br/><br/>");
            }
            //Test des getter & setter
            String mail = user.getEmail();
            out.print("Test de getter<br/>");
            out.print(user + "<br/><br/>");
            user.setEmail("mod@test.fr");
            out.print("Test de setter (Le mail doit être different du test de getter)<br/>");
            out.print(user + "<br/><br/>");
            if(mail.equals(user.getEmail())){
                out.print("Il y a une erreur de setter <br/>");
            }
            //Test de bloquage de compte
            out.print("Test de bloquage du compte<br/>");
            user.setBlocked(true);
            if(user.isBlocked()){
                out.print("Compte bloqué<br/><br/>");
            }
            else{
                out.print("Erreur de bloquage du compte<br/><br/>");
            }
            //Test de suppression d'utilisateur
            out.print("Test de suppression du compte<br/>");
            user.delete(con);
                User user2 = User.getByPseudo(con, "test");
            if(user2==null){
                out.print("Compte correctement supprimé<br/>");
            }
            else{
                out.print("Erreur de suppresion du compte<br/>");
            }
        %>
    </body>
</html>
