<%@page import="com.metier.DiscoSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Mot de Passe Perdu</title>
    <%@include file="../includes/head.jspf" %>
</head>

<body>
<div class="page" data-role="page" id="infoPopUpMotDePassePerdu" >
    <div class="header" data-role="header" data-id="main-header" data-theme="b"
                                  data-tap-toggle="false" data-position="fixed" data-fullscreen="true">
        <h1>Mot de Passe Perdu</h1>
        <%@include file="../includes/user.jspf" %>
    </div>
    
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script>
        $.validator.addMethod("nomOnly", 
            function(value, element) {
                return !/[^a-zA-Z0-9àáâãäåçèéêëìíîïòóôõöùúûüýÿ_. ]/.test(value);
            }, "Que des caractères alphanumériques accentués."
        );

        $(document).ready(function () {
            $('#formMotDePassePerdu').validate({
            rules: {
                MotDePassePerduNom: {
                    minlength: 4, maxlength: 20, nomOnly: true, required: true
                }
            },
            messages: {
                MotDePassePerduNom: {
                    minlength: "Au moins 4 caractères",
                    maxlength: "Au max 20 caractères",
                    required:  "Entrez votre pseudo."
                }
            },
            errorPlacement: function (error, element) {
                error.appendTo(element.parent().next());
            }
        });
        });

        function infoPopUpMotDePassePerdu() {
            if ($('#formMotDePassePerdu').valid()) {
                setTimeout(function () {
                    $("#popupSendMotDePassePerdu").popup("open");
                }, 100);
            }
        }
    </script>
    
    <div role="main" class="ui-content"><br/><br/>
        <form id="formMotDePassePerdu" method="post" onsubmit="infoPopUpMotDePassePerdu();" action="discovery.jsp">
            <br/><br/>Nous allons vous envoyer un nouveau mot de passe généré par notre serveur.<br/>
            <br/>Il va ressembler par exemple a ça : 
            <% 
                String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
                String pass = "";
                for(int x=0;x<8;x++)
                {
                   int i = (int)Math.floor(Math.random() * chars.length());
                   pass += chars.charAt(i);
                }
            %>
            <strong><%= pass %></strong>
            <br/><br />
                      Nous vous invitons ensuite a le changer le plus rapidement possible.<br/><br/><br/>
            <div data-role="fieldcontain">
                <label for="motDePassePerduPseudo" data-theme="d">Votre pseudo : </label>
                <input type="text" name="motDePassePerduPseudo" id="motDePassePerduPseudo"
                                    data-theme="d" placeholder="A compléter"/>  
                <span></span>
            </div>
            <br/>
            <label for="motDePassePerduAction" data-theme="a"></label>
            <input name="action" id="pseudoPerduAction" type="hidden" value="reqMotDePassePerdu"/>
            <button id="btnMotDePassePerduOK" name="btnMotDePassePerduOK" data-theme="a">Envoyer</button>
        </form>
    </div>

    <%@include file="../includes/footer.jspf" %>
    
    <!-- popup message en mode modal-->
    <div id="popupSendMotDePassePerdu" data-role="popup" data-theme="a" data-overlay-theme="b"
         class="ui-corner-all" data-corners="true" data-position-to="window" data-dismissible="false">
        <div class="mesPopups" align="center">
            <br/>
            <h3 id="popupTextSendMotDePassePerdu">Attendez, je transmets votre demande...</h3>
            <div class="progressBar"><div></div></div>
            <br/>
        </div>
    </div>
</div>
</body>
</html>