<%@page import="java.sql.Connection"%>
<%@page import="com.metier.*"%>
<%@page import="com.persistence.*"%>
<%
    Connection con = (Connection) session.getAttribute("con");
    if (con == null)
        con = ConnexionMySQL.newConnexion();
    session.setAttribute("con", con);
    String key  = request.getParameter("key");
    String contenu = "Bonjour Mme/Mr test ! \n\n"
            + "Votre inscription sur le site de d�couverte de supernovae est presque termin�e !"
            + "\nVous devez valider votre compte en cliquant sur le lien ci-dessous : "
            + "http://localhost:8084/sndiscovery/reqMailConfirme.jsp?pseudo=test&key=" + key
            + "\nVotre pseudo est test"
            + "\n\nA bient�t � la d�couverte de Supernovae :)";
    SmtpSend.sendMessage("Demande d'inscription sur snDiscovery", contenu, "blanchonenzo@gmail.com"); 
%>