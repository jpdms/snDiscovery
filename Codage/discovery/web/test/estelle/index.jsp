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
      <li class="active"><a href="#">Actu</a></li>
      <li><a href="#"></a></li>
      <li><a href="#"></a></li>
    </ul>
  </div>
</nav>
<div class="container">
  <h3>Actu :</h3>
  <p>Proc�dure :</p>
  <div class="progress">
    <div id="progBar" class="progress-bar progress-bar-striped active" role="progressbar"
    aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%">
      0%
    </div>
  </div>
  <button id="add" onClick="add()" type="button" class="btn btn-primary active">Ajouter une actualit�</button>
  <button id="mod" onClick="" type="button" class="btn btn-primary disabled">Modifier l'actualit�</button>
  <button id="sup" onClick="" type="button" class="btn btn-primary disabled">Supprimer l'actualit�</button>
  <br/><br>
  <div id="idActu" class="row" style="display: none;">
  <div class="col-xs-2">
      <label for="ex1">ID ACTU</label>
      <input class="form-control" id="id" type="text">
  </div>
  </div><br/>
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
