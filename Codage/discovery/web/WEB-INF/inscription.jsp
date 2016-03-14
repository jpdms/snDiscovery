<%-- 
    Document   : site
    Created on : 05 Mai 2014, 16:54:26
    Author     : 
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Inscription</title>
    <%@include file="../includes/head.jspf" %>
</head>

<body>
<div class="page" data-role="page" id="inscriptionPage">
    <%@include file="../includes/div_header.jspf" %>
        <h1>Compte</h1>
        <%@include file="../includes/user.jspf" %>
    </div>
    
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script>
        //que des cars alphanumérique 
        $.validator.addMethod("textOnly", 
            function(value, element) {  // un car n'est pas alphanumérique
                return !/[^a-zA-Z0-9]/.test(value);
            }, "Que des caractères alphanumériques."
        );

        $.validator.addMethod("nomOnly", 
            function(value, element) {
                return !/[^a-zA-Z0-9àáâãäåçèéêëìíîïòóôõöùúûüýÿ_. ]/.test(value);
            }, "Que des caractères alphanumériques accentués."
        );

        $(document).ready(function () {
            $('#formInscription').validate({
            rules: {
                inscriptionPseudo: {
                    minlength: 4, maxlength: 20, required: true
                },
                inscriptionNom: {
                    minlength: 4, maxlength: 30, nomOnly: true, required: true
                },
                inscriptionEMail: {
                    email: true, required: true
                },
                inscriptionVerifEMail: {
                    email: true, required: true,
                    equalTo: "#inscriptionEMail"
                },
                inscriptionPassword: {
                    minlength: 4, maxlength: 15, required: true
                },
                inscriptionVerifPassword: {
                    minlength: 4, maxlength: 15, required: true,
                    equalTo: "#inscriptionPassword"
                }
            },
            messages: {
                inscriptionPseudo: {
                    minlength: "Au moins 4 caractères",
                    maxlength: "Au max 20 caractères",
                    required:  "Entrez votre pseudo."
                },
                inscriptionNom: {
                    minlength: "Au moins 4 caractères",
                    maxlength: "Au max 30 caractères",
                    required:  "Entrez votre nom."
                },
                inscriptionEMail: {
                    required:  "Entrez votre EMail."
                },
                inscriptionVerifEMail: {
                    required:  "Entrez votre EMail.",
                    equalTo:   "Identique au champ précédent"
                },
                inscriptionPassword: {
                    minlength: "Au moins 4 caractères",
                    maxlength: "Au max 15 caractères"
                },
                inscriptionVerifPassword: {
                    minlength: "Au moins 4 caractères",
                    maxlength: "Au max 15 caractères",
                    equalTo:   "Identique au champ précédent"
                }
            },
            errorPlacement: function (error, element) {
                error.appendTo(element.parent().next());
            }
        });
        });
    </script>
    
    <div role="main" class="ui-content">
        <br/><br/>
        <div>
            <%
                String message = request.getParameter("message");
                if (message != null) {
                    if (message.equalsIgnoreCase("pbPseudo")) {
                        out.print("Ce pseudo existe déjà");
                    }
                    else if (message.equalsIgnoreCase("pbEmail")) {
                        out.print("Ce mail existe déjà");
                    }
                    else if (message.equalsIgnoreCase("pbInscription")) {
                        out.print("Impossible de vous inscrire");
                    }
                }
            %>
        </div>
        <br/>
        <form id="formInscription" method="post" action="discovery.jsp">
            <br/><br/>
            <div data-role="fieldcontain">
                <label for="inscriptionPseudo" data-theme="a">Pseudo:</label>
                <input type="text" name="inscriptionPseudo" id="inscriptionPseudo"
                      data-theme="a" placeholder="A compléter"/>  
                <span></span>
            </div>
            <div data-role="fieldcontain">
                <label for="inscriptionNom" data-theme="a">Nom:</label>
                <input type="text" name="inscriptionNom" id="inscriptionNom"
                      data-theme="a" placeholder="A compléter"/>  
                <span></span>
            </div>
            <div data-role="fieldcontain">
                <label for="inscriptionEMail" data-theme="a">EMail:</label>
                <input type="email" name="inscriptionEMail" id="inscriptionEMail"
                      data-theme="a" placeholder="Votre EMail" /> 
                <span></span>
            </div>
            <div data-role="fieldcontain">
                <label for="inscriptionVerifEMail" data-theme="a">EMail:</label>
                <input type="email" name="inscriptionVerifEMail" id="inscriptionVerifEMail"
                      data-theme="a" placeholder="Pour vérification" /> 
                <span></span>                 
            </div>
            <div data-role="fieldcontain">
                <label for="inscriptionPassword" data-theme="a" >Mot de passe:</label>
                <input type="password" name="inscriptionPassword" id="inscriptionPassword"
                        data-theme="a" placeholder="A compléter"/>  
                <span></span>
            </div>
            <div data-role="fieldcontain">
                <label for="inscriptionVerifPassword" data-theme="a" >Mot de passe:</label>
                <input type="password" name="inscriptionVerifPassword" id="inscriptionVerifPassword"
                        data-theme="a" placeholder="Pour vérification"/> 
                <span></span>
            </div>
            <br/>
            <label for="inscriptionAction" data-theme="a"></label>
            <input name="path" type="hidden" id="path" value="" />
            <script>
            document.getElementById('path').value = window.location.host;
            </script>
            <input name="action" id="inscriptionAction" type="hidden" value="reqInscription"/>
            <button type="submit" id="submitOK" name="submitOK" data-theme="a">OK</button>
        </form>
        <br/><br/>
    </div>

    <%@include file="../includes/footer.jspf" %>
</div>
</body>
</html>