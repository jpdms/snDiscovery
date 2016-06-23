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
            con = (Connection) session.getAttribute("con");
            if (con == null)
                con = ConnexionMySQL.newConnexion();
            session.setAttribute("con", con);
            Statement statement = con.createStatement();
            ResultSet canrefuser = statement.executeQuery("select * from canrefuser "
                                        + " where userPseudo='" + pUser + "'"
                                            + " order by `date` desc");
            canrefuser.first();
            canrefuser.previous(); 
            int loop = 0;
        %>
      <center><h2>Historique de : <%=pUser%></h2></center>
      <div class="table">
      <h2>Historique des candidates refusées : </h2>
      <%if(canrefuser.next()){%>
      <table data-role="table" class="ui-responsive ui-shadow">
      <thead>
        <tr>
          <th data-priority="1"> </th>
          <th data-priority="2">Type</th>
          <th data-priority="3">Date</th>
          <th data-priority="4">Image</th>
        </tr>
      </thead>
      <tbody>
        <%
        while(!canrefuser.isAfterLast()){
            if(canrefuser.getString("userPseudo").equals(pUser)){
            loop++;
            %>
            
                <tr>
                  <td><%= loop %></td>
                  <td style="color:red">Refusé</td>
                  <td><%= canrefuser.getString("date") %></td>
                  <td><%= canrefuser.getString("nomImage") %></td>
                </tr>
        <%}
          canrefuser.next();  
        }
        loop=0;%>
      </tbody>
    </table>
      <%}
      else{%>
      <p>L'utilisateur n'a pas de candidates refusée.</p>
      <%}%>
      <h2>Historique des candidate validées : </h2>
      <%
        ResultSet decouverte = statement.executeQuery("select * from decouverte "
                            + " where userPseudo='" + pUser + "'"
                                + " order by `date` desc");
        decouverte.first();
        decouverte.previous();
        if(decouverte.next()){
      %>
      <table data-role="table" class="ui-responsive ui-shadow">
      <thead>
        <tr>
          <th data-priority="1"> </th>
          <th data-priority="2">Type</th>
          <th data-priority="3">Date</th>
          <th data-priority="4">Image</th>
        </tr>
      </thead>
      <tbody>
        <% 
        while(!decouverte.isAfterLast()){
            if(decouverte.getString("userPseudo").equals(pUser)){
            loop++;
            %>
                <tr>
                  <td><%= loop %></td>
                  <td style="color:green">Decouverte</td>
                  <td><%= decouverte.getString("date") %></td>
                  <td><%= decouverte.getString("nomImage") %></td>
                </tr>
        <%}
          decouverte.next();
        }
        loop=0;%>
      </tbody>
    </table>
    <%}
        else{%>
        <p>L'utilisateur n'a pas de candidates validée.</p>
        <%}%>
      <h2>Historique des candidates en cours : </h2>
      <%
        ResultSet candidate = statement.executeQuery("select * from  candidate canrefuser"
                              + " where userPseudo='" + pUser + "'"
                                  + " order by `date` desc");
         candidate.first();
         candidate.previous();
        if(candidate.next()){%>
      <table data-role="table" class="ui-responsive ui-shadow">
      <thead>
        <tr>
          <th data-priority="1"> </th>
          <th data-priority="2">Type</th>
          <th data-priority="3">Date</th>
          <th data-priority="4">Image</th>
        </tr>
      </thead>
      <tbody>
        <% 
        while(!candidate.isAfterLast()){
            if(candidate.getString("userPseudo").equals(pUser)){
            loop++;
            %>       <tr>
                  <td><%= loop %></td>
                  <td>Candidate</td>
                  <td><%= candidate.getString("date") %></td>
                  <td><%= candidate.getString("nomImage") %></td>
                </tr>
        <%}
          candidate.next();  
        }
        loop=0;%>
      </tbody>
    </table>
    <%}
        else{
    %>
    <p>L'utilisateur n'a pas de candidates en cours.</p>
    <%}%>
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
