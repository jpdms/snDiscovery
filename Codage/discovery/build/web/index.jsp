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
                %>
                <%
           }}
        %>
    </div>
        <%
        if(maSession.getCssReload()){
            maSession.setCssReload(false);
        %>
                    <script>
                        window.location.reload();
                    </script>
        <%
        }
        %>            
    <div role="main" class="ui-content">
        <br/><br/>
        <h4>Cette application de science participative (crowdsourcing science) va  
            vous permettre de découvrir des supernovae.</h4>
        <div class="tutoImg">
            <img src="images/tuto01.jpg">
            <img src="images/tuto02.jpg">
        </div>
        Si vous en trouvez une, votre nom accompagnera cette découverte !<br/><br/>
        Si vous êtes novice, nous vous proposons un tutoriel. 
        Car pour vous inscrire, vous devez passer un QCM.<br/><br/><br/>
        AIDE :<br/>
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
        <center><p class="mini">V1.00 - 20 Septembre 2015<br/>
                                V2.00 - 18 mai 2016<br/>
                (Développement : BTS SNIR Lycée V. Hugo Colomiers 31)</p></center>
    </div>
    
    <%@include file="includes/footer.jspf" %>
</div>
</body>
</html>