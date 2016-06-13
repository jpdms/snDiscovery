<!DOCTYPE html>
<html lang="en">
<head>
  <title>D�monstration</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="js/js1.js" type="text/javascript"></script>
</head>
<body>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">D�monstration</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">R�cup�ration mot de passe</a></li>
      <li><a href="index_2.jsp">R�cup�ration pseudo</a></li>
      <li><a href="index_3.jsp">Validation du mail</a></li>
    </ul>
  </div>
</nav>
<%
    String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    String pass = "";
    for(int x=0;x<8;x++)
    {
       int i = (int)Math.floor(Math.random() * chars.length());
       pass += chars.charAt(i);
    }
    String oldpass = pass;
    pass = com.persistence.Utils.encryptPassword(pass);
%>
<script type="text/javascript">
        pass = "<%=pass%>";
        oldpass = "<%=oldpass%>";
</script>
<div class="container">
  <h3>R�cup�ration du mot de passe :</h3>
  <p>Un utilisateur a perdu son mot de passe, il donne son pseudo et envoie la demande. En retour, il re�oit un mail avec un nouveau mot de passe.</p>
  <p>Proc�dure :</p>
  <div class="progress">
    <div id="progBar" class="progress-bar progress-bar-striped active" role="progressbar"
    aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%">
      0%
    </div>
  </div>
  <button id="user" onClick="user()" type="button" class="btn btn-primary active">Cr�er un utilisateur</button>
  <button id="genMdp" onClick="" type="button" class="btn btn-primary disabled">G�n�rer et modifier le mot de passe</button>
  <button id="sendMail" onClick="" type="button" class="btn btn-primary disabled">Envoi du mail</button>
  <button id="sup" onClick="" type="button" class="btn btn-primary disabled">Supprimer l'utilisateur</button>
  <br/><br>
  <div class="row">
  <div class="col-md-6">
  <div class="panel panel-primary">
    <div class="panel-heading">Code:</div>
    <div id="source" class="panel-body"></div>
  </div>
</div>
        <div class="col-md-6">
  <div class="panel panel-primary">
    <div class="panel-heading">R�sultat :</div>
    <div id="result" class="panel-body"></div>
  </div>
      </div>
  </div>
</div>

</body>
</html>
