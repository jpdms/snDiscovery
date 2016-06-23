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
        <title>Test unitaire mot de passe perdu</title>
    </head>
    <body>
        Test de récuperation de mot de passe<br/>
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
            mdp = user.getPassword();
        %>
        Le mot de passe (md5) actuel est : <%=mdp%>
        <%
            //Procédure de changement de mot de passe
            String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            String pass = "";
            for(int x=0;x<8;x++)
            {
               int i = (int)Math.floor(Math.random() * chars.length());
               pass += chars.charAt(i);
            }
            pass = com.persistence.Utils.encryptPassword(pass);
            user.setPassword(pass);%>
            <br/> Le nouveau mot de passe (md5) est : <%=pass%> <br/>
         <%
             if(mdp.equals(pass)){
                out.print("<br/> Erreur");
             }
             else{
                 out.print("Le mot de passe est bien différent.<br/><br/>");
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
