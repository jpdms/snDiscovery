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
    int id = Integer.parseInt(request.getParameter("id"));
    String titre = "L'article de test";
    String contenu = "Le corps de l'actu est presque vide...";
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
    String sContenu = new String(contenu.getBytes(), "utf8");
    String sTitre = new String(titre.getBytes(), "utf8");
    Actu actu = Actu.getById(con, id);
    actu.setContenu(sContenu);
    actu.setTitre(sTitre);
    actu.save(con);
%>