<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.metier.*"%>
<%@page import="com.persistence.*"%>
<%
    Connection con = (Connection) session.getAttribute("con");
    if (con == null)
        con = ConnexionMySQL.newConnexion();
    session.setAttribute("con", con);
    String titre = "L'article de test";
    String contenu = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas mattis vitae ligula a elementum. Fusce vitae ligula nibh. Nulla iaculis erat nisi, quis porttitor nunc gravida id. Ut lacinia orci a neque venenatis, condimentum efficitur leo gravida. Nam maximus mattis justo sit amet condimentum. Aenean dictum, dolor in consequat porttitor, lacus elit aliquam neque, vitae molestie risus elit eu dolor. Nulla non libero fermentum, tincidunt ligula et, consectetur odio. Nulla facilisi. Proin vel ante a risus commodo iaculis ac ac ipsum. Nullam efficitur malesuada sem non venenatis. Quisque ultrices, nisl sit amet commodo laoreet, velit sapien condimentum nisi, vel venenatis neque nibh sed arcu. Donec eget urna nulla. Praesent tincidunt nec velit ac interdum.";
    Date date = new Date();
    String sDate = new SimpleDateFormat("yyyyMMdd").format(date);
    String as = new String ("'"); 
    String das = new String("''"); 
    titre = titre.replace(as, das);
    contenu = contenu.replace(as, das);
    as = ("\\"); 
    das = ("\\\\");
    titre = titre.replace(as, das);
    contenu = contenu.replace(as, das);
    as = ("\""); 
    das = ("\"\"");
    titre = titre.replace(as, das);
    contenu = contenu.replace(as, das);
    Actu actu = Actu.create(con, sDate, titre, contenu);
%>