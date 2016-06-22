<!DOCTYPE html>
<html lang="en">
<head>
  <title>Démonstration</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="js/js3.js" type="text/javascript"></script>
</head>
<body>
<%
    String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    String pass = "";
    for(int x=0;x<8;x++)
    {
       int i = (int)Math.floor(Math.random() * chars.length());
       pass += chars.charAt(i);
    }
%>
<script type="text/javascript">
        keygen = "<%=pass%>";
</script>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Démonstration</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="index.jsp">Récupération mot de passe</a></li>
      <li><a href="index_2.jsp">Récupération pseudo</a></li>
      <li class="active"><a href="index_3.jsp">Validation du mail</a></li>
    </ul>
  </div>
</nav>
<div class="container">
  <h3>Validation du mail :</h3>
  <p>Procédure :</p>
    <form id="formVal" method="post" action="index_3_2.jsp">
  <input type="hidden" name="key" value="<%=pass%>">
  </form>
  <div class="progress">
    <div id="progBar" class="progress-bar progress-bar-striped active" role="progressbar"
    aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%">
      0%
    </div>
  </div>
  <button id="genKey" onClick="genKey()" type="button" class="btn btn-primary active">Générer une clé de validation</button>
  <button id="user" onClick="" type="button" class="btn btn-primary disabled">Créer un utilisateur</button>
  <button id="sendMail" onClick="" type="button" class="btn btn-primary disabled">Envoyer le mail de validation</button>

  <button id="testVal" onClick="" type="button" class="btn btn-primary disabled">Tester la validité du compte</button>
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
    <div class="panel-heading">Résultat :</div>
    <div id="result" class="panel-body"></div>
  </div>
      </div>
  </div>
</div>

</body>
</html>
