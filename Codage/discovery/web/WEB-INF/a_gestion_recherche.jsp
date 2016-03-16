<%-- 
    Document   : infoUser
    Created on : 28 mai 2014, 14:54:51
    Author     : jpdms
--%>
<%@page import="com.persistence.Utils"%>
<%@page import="com.persistence.User"%>
<%@page import="com.metier.DiscoSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Infos</title>
    <%@include file="../includes/a_head.jspf"%>
</head>

<body>
<div class="page" data-role="page" id="infoUserPage">
    <%@include file="../includes/div_header.jspf" %>
        <h1>Compte</h1>
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
            user = maSession.getUser();
        %>
                <blockquote>
            <input type="search" name="search" placeholder="Entrez un pseudo." id="search">
        </blockquote>
        <fieldset style="margin: auto; text-align: center;" data-role="controlgroup" data-type="horizontal" data-mini="true">
            <label for="select-native-15">Select A</label>
            <select name="select-native-15" id="select-native-15">
                <option value="#"> = </option>
                <option value="#"> < </option>
                <option value="#"> <= </option>
                <option value="#"> > </option>
                <option value="#"> >= </option>
            </select>
            <label for="select-native-14">Select B</label>
                <select name="select-native-14" id="select-native-14">
                    <option value="#">Grade</option>
                    <option value="#">1</option>
                    <option value="#">2</option>
                    <option value="#">3</option>
                    <option value="#">4</option>
                    <option value="#">5</option>
                </select>
            <button onclick="window.location.href='discovery.jsp?action=gestionrecherche'">Rechercher</button>
        </fieldset>
        <br/>
      <div class="table">
      <table data-role="table" class="ui-responsive ui-shadow">
      <thead>
        <tr>
          <th data-priority="1"> </th>
          <th data-priority="2">Pseudo</th>
          <th data-priority="3">Grade</th>
          <th data-priority="4">Email</th>
          <th data-priority="5">Blacklister</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td><a href="#">User1</a></td>
          <td>5</td>
          <td>user1@gmail.com</td>
          <td style="color:green">Non</td>
        </tr>
        <tr>
          <td>2</td>
          <td>User2</td>
          <td>3</td>
          <td>user2@gmail.com</td>
          <td style="color:green">Non</td>
        </tr>        
        <tr>
          <td>3</td>
          <td>User3</td>
          <td>1</td>
          <td>user3@gmail.com</td>
          <td style="color:Red">Oui</td>
        </tr>        
        <tr>
          <td>4</td>
          <td>User4</td>
          <td>4</td>
          <td>user4@gmail.com</td>
          <td style="color:green">Non</td>
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
