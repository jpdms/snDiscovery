<%-- 
    Document   : site
    Created on : 05 Mai 2014, 16:54:26
    Author     : 
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Acceuil</title>
    <%@include file="includes/head.jspf" %>
</head>

<body>
<div class="page" data-role="page" id="homePage">
    <%@include file="includes/div_header.jspf" %>
        <h1>Accueil</h1>
        <%@include file="includes/user.jspf" %>
        <%
        if(user != null){
            if(maSession.isModeExpert()){
                 maSession.setModeExpert(false);
            }
        }
        %>
    </div>
        <%
        if(user != null){
            if(maSession.getCssReload()){
                maSession.setCssReload(false);
                %>
                    <script>
                        window.location.reload();
                    </script>
                <%
            }
        }
        %>            
    <div role="main" class="ui-content">
        <br/><br/>
        <h4>Cette application de science participative (crowdsourcing science) va  
            vous permettre de découvrir des supernovae.</h4>
        <center><div class="mesImages">
            <img style="border: 1px solid #aaa; border-radius: 8px; padding: 2px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" 
                 src="images/tuto01.jpg"/>
            <img style="border: 1px solid #aaa; border-radius: 8px; padding: 2px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" 
                 src="images/tuto02.jpg"/>
            </div></center>
        <br/>
        <p>Si vous en trouvez une, votre nom accompagnera cette découverte !</p>
        <p>Si vous êtes novice, nous vous proposons un tutoriel. Car pour vous inscrire, vous devez passer un QCM.</p>
        <br/>
        <p>AIDE :</p>
        <ol>
            <li>En tournant votre téléphone à l'horizontale, l'observation des images sera plus facile.</li>
            <li>Pour cacher la barre de navigation du navigateur :<br/>
            <ul>
                <li>Sur IPhone, mettre un signet (bookmark) de ce site sur le bureau.</li>
                <li>Sur Androïd, créer un signet (bookmark) du site, puis créer un
            raccourci sur l'écran d'accueil par un appui long sur ce signet.</li>
            </ul>
            </li>
        </ol>
        <br/>
        <center><br/><br/><br/>
            <p class="mini">V2.00 - 16 mars 2016<br/>Développement : BTS SNIR Lycée V. Hugo Colomiers 31
            </p>
        </center>
    </div>
    
    <%@include file="includes/footer.jspf" %>
</div>
</body>
</html>