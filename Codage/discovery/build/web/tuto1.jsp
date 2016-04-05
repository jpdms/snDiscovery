<%-- 
    Document   : site
    Created on : 05 Mai 2014, 16:54:26
    Author     : 
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Tuto1</title>
    <%@include file="includes/head.jspf" %>
</head>

<body>
<div class="page" data-role="page" id="tuto1Page">
    <%@include file="includes/tutoheader.jspf" %>
    
    <div role="main" class="ui-content">
        <br/><br/>
        <p>Une supernova est un phénomène explosif violent dû à la mort d'une étoile.<br/>
        A nos yeux, une supernova apparaît comme une nouvelle étoile dont l'intensité 
        lumineuse s’accentue en quelques jours puis s’atténue jusqu’à disparaître.<br/>
        Cette application propose les images de galaxies prises chaque nuit par 2 télescopes 
        robotisés (situés au Chili et à Nice).<br/>
        Environ un millier de galaxies proches sont observées chaque année.<br/>
        Ces photos sont consultables en restant anonyme, mais pour proposer
        une image candidate, vous devez être inscrit.<br/>
        Pour vous inscrire, il faut passer un QCM, qui vous donnera le grade 1
        (le grade va de 1 à 5).<br/>
        Dans le cas d’un signalement, des chercheurs experts vont regarder votre 
        proposition et vous en rendre compte par email (découverte avérée, 
        supernova déjà connue, astéroïde connu, comète, satellite, reflet, etc...).<br/>
        Si c'est une supernova, vous avez gagné ! Elle sera signalée aux instances 
        internationales et si vous êtes le premier à l'avoir trouvée, vous serez 
        identifié comme le découvreur !<br/>
        Vous pouvez statistiquement découvrir une supernova par mois.</p>
        <p>En fonction de la perspicacité de vos signalements, les experts feront
        progresser votre grade afin d'accéder à de nouvelles fonctionnalités :-)
        et peut-être devenir vous même un expert.<br/>
        Au cas où un utilisateur fournirait systématiquement des signalements farfelus
        nous nous réservons le droit de bloquer son compte.</p>
        <a href="tuto2.jsp" class="ui-btn ui-shadow ui-corner-all">Page 2</a>
    </div>

    <%@include file="includes/footer.jspf" %>
    
</div>
</body>
</html>
