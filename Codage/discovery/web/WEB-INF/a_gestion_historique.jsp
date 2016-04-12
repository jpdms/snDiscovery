<%-- 
    Document   : infoUser
    Created on : 28 mai 2014, 14:54:51
    Author     : jpdms
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.persistence.Utils"%>
<%@page import="com.persistence.User"%>
<%@page import="com.metier.DiscoSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Historique</title>
    <%@include file="../includes/a_head.jspf"%>
</head>

<body>
<div class="page" data-role="page" id="infoUserPage">
    <%@include file="../includes/a_div_header.jspf" %>
        <h1>Historique</h1>
        <%@include file="../includes/a_user.jspf" %>
        <%
        if(!maSession.isModeExpert()){
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    %>
</div>
    
    <div role="main" id="mainInfoUser" class="ui-content">
        <br/><br/>
        <br/>
        <%
            String pUser = request.getParameter("pseudo");
            User userMod = User.getByPseudo(con, pUser);
            con = (Connection) session.getAttribute("con");
            if (con == null)
                con = ConnexionMySQL.newConnexion();
            session.setAttribute("con", con);
            Statement statement = con.createStatement();
            ResultSet candidate = statement.executeQuery("select * from candidate "
                                + " where userPseudo='" + userMod.getPseudo() + "'"
                                    + " order by `date`");
            ResultSet canrefuser = statement.executeQuery("select * from candidate "
                                + " where userPseudo='" + userMod.getPseudo() + "'"
                                    + " order by `date`");
            ResultSet decouverte = statement.executeQuery("select * from candidate "
                                + " where userPseudo='" + userMod.getPseudo() + "'"
                                    + " order by `date`");
        %>
      <center><h2>Historique de : <%=userMod.getPseudo()%></h2></center>
      <div class="table">
      <table data-role="table" class="ui-responsive ui-shadow">
      <thead>
        <tr>
          <th data-priority="1"> </th>
          <th data-priority="2">Type</th>
          <th data-priority="3">Date</th>
          <th data-priority="4">Image</th>
          <th data-priority="5">Résultat</th>
        </tr>
      </thead>
      <tbody>
        <% int cloop=0;
        while(candidate.next()){
            cloop=cloop+1;%>
          <tr>
            <td><%=cloop%></td>
            <td><%=candidate.getString("chemin")%></td>
            <td>19/03/2014</td>
            <td>IC3900</td>
            <td style="color:red">Refusé</td>
          </tr>
        <%} %>  
        <tr>
          <td>1</td>
          <td>Référence</td>
          <td>19/03/2014</td>
          <td>IC3900</td>
          <td style="color:red">Refusé</td>
        </tr>
        <tr>
          <td>2</td>
          <td>Référence</td>
          <td>19/03/2014</td>
          <td>IC739</td>
          <td style="color:green">Validé</td>
        </tr>        <tr>
          <td>3</td>
          <td>Candidate</td>
          <td>19/03/2014</td>
          <td>IC779</td>
          <td style="color:green">Validé</td>
        </tr>        <tr>
          <td>4</td>
          <td>Référence</td>
          <td>19/03/2014</td>
          <td>IC831</td>
          <td style="color:red">Refusé</td>
        </tr>        <tr>
          <td>5</td>
          <td>Candidate</td>
          <td>19/03/2014</td>
          <td>IC832</td>
          <td>En cours de validation</td>
        </tr>        <tr>
          <td>6</td>
          <td>Candidate</td>
          <td>19/03/2014</td>
          <td>MCG121525</td>
          <td style="color:red">Refusé</td>
        </tr>        <tr>
          <td>7</td>
          <td>Candidate</td>
          <td>19/03/2014</td>
          <td>mcg22849</td>
          <td style="color:red">Refusé</td>
        </tr>

      </tbody>
    </table>
      </div>      
        <br/>
            <a href="javascript:history.go(-1)" class="ui-btn ui-shadow ui-corner-all ui-btn-a">
        Retour
        </a>
    </div>

    <%@include file="../includes/a_footer.jspf" %>
</div>
</body>
</html>
