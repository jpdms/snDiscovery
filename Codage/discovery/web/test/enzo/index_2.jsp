<!DOCTYPE html>
<html lang="en">
<head>
  <title>Démonstration</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="js/js2.js" type="text/javascript"></script>
</head>
<body>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Démonstration</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="index.jsp">Récupération mot de passe</a></li>
      <li class="active"><a href="index_2.jsp">Récupération pseudo</a></li>
      <li><a href="index_3.jsp">Validation du mail</a></li>
    </ul>
  </div>
</nav>
<div class="container">
  <h3>Récupération du pseudo :</h3>
  <p>Un utilisateur a perdu son pseudo, il donne son adresse mail et envoie la demande. En retour, il reçoit un mail avec son pseudo.</p>
  <p>Procédure :</p>
  <div class="progress">
    <div id="progBar" class="progress-bar progress-bar-striped active" role="progressbar"
    aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%">
      0%
    </div>
  </div>
  <button id="user" onClick="user()" type="button" class="btn btn-primary active">Créer un utilisateur</button>
  <button id="genMdp" onClick="" type="button" class="btn btn-primary disabled">Associer le mail a un pseudo</button>
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
    <div class="panel-heading">Résultat :</div>
    <div id="result" class="panel-body"></div>
  </div>
      </div>
  </div>
</div>

</body>
</html>
