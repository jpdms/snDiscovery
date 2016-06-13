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
        <title>Test unitaire pseudo perdu</title>
    </head>
    <body>
        Test de récuperation du pseudo<br/>
        <%
            //Création d'un utilisateur avec le mail déja validé.
            String mdp = com.persistence.Utils.encryptPassword("test");
            User.create(con, "test", "test", "test@test.com", mdp, "ok");
            User user = User.getByPseudo(con, "test");
            if(user!=null){
                out.print("Compte correctement crée<br/><br/>");
            }
            else{
                out.print("Erreur de création du compte<br/><br/>");
            }
            String mail = user.getEmail();
        %>
        Le mail est : <%=mail%>
        <%
            //Procédure
            String pseudo = User.getPseudoByMail(con, mail);
            %>
            <br/> Le pseudo est : <%=pseudo%> <br/>
         <%
             if(pseudo.equals("test")){
                out.print("<br/> Le pseudo est correct <br/> <br/> ");
             }
             else{
                 out.print("Erreur.<br/><br/>");
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
