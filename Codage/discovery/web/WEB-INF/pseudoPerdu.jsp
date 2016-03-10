<%@page import="com.metier.DiscoSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Pseudo Perdu</title>
    <%@include file="../includes/head.jspf" %>
</head>

<body>
<div class="page" data-role="page" id="infoPopUpPseudoPerdu" >
    <div class="header" data-role="header" data-id="main-header" data-theme="b"
                                  data-tap-toggle="false" data-position="fixed" data-fullscreen="true">
        <h1>Pseudo Perdu</h1>
        <%@include file="../includes/user.jspf" %>
    </div>
    
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script type="text/javascript">
        $.validator.addMethod("textOnly", 
            function(value, element) {  // un car n'est pas alphanumérique
                return !/[^a-zA-Z0-9_.-@]/.test(value);
            }, "Que des caractères alphanumériques."
        );
        
        $(document).ready(function () {
            $('#formPseudoPerdu').validate({
            rules: {
                MailPseudoPerdu: {
                    textOnly: true, required: true
                }
            },
            messages: {
                MailPseudoPerdu: {
                    required:  "Entrez votre adresse e-mail."
                }
            },
            errorPlacement: function (error, element) {
                error.appendTo(element.parent().next());
            }
        });
        });
    </script>
    
    <div role="main" class="ui-content"><br/><br/>
        <form id="formPseudoPerdu" method="post" onsubmit="infoPopUpPseudoPerdu();" action="discovery.jsp">
            <br/><br/>Nous allons vous envoyer votre pseudo par mail.<br/>
            <div data-role="fieldcontain">
                <label for="PseudoPerdumail" data-theme="d">Votre mail : </label>
                <input type="email" name="MailPseudoPerdu" id="MailPseudoPerdu"
                                    data-theme="d" placeholder="A compléter"/>  
                <span></span>
            </div>
            <br/>
            <label for="PseudoPerduAction" data-theme="a"></label>
            <input name="action" id="pseudoPerduAction" type="hidden" value="reqPseudoPerdu"/>
            <button id="btnPseudoPerduOK" name="btnPseudoPerduOK" data-theme="a">Envoyer</button>
        </form>
    </div>

    <%@include file="../includes/footer.jspf" %>
    
    <!-- popup message en mode modal-->
    <div id="popupSendPseudoPerdu" data-role="popup" data-theme="a" data-overlay-theme="b"
         class="ui-corner-all" data-corners="true" data-position-to="window" data-dismissible="false">
        <div class="mesPopups" align="center">
            <br/>
            <h3 id="popupTextSendPseudoPerdu">Attendez, je transmets votre demande...</h3>
            <div class="progressBar"><div></div></div>
            <br/>
        </div>
    </div>
</div>
</body>
</html>