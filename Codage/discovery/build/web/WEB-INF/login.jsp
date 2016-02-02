<%-- 
    Document   : site
    Created on : 05 Mai 2014, 16:54:26
    Author     : 
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html> 
<html lang="fr">
<head>
    <title>Login</title>
    <%@include file="../includes/head.jspf" %>
</head>

<body>
<div class="page" data-role="page" id="loginPage">
    <div class="header" data-role="header" data-id="main-header" data-theme="b"
                                  data-position="fixed" data-fullscreen="true">
        <h1>Compte</h1>
        <%@include file="../includes/user.jspf" %>
    </div>
    
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>

    <script type="text/javascript">
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
            $('#formLogin').validate({
            rules: {
                accountPseudo: {
                    minlength: 4, maxlength: 20, nomOnly: true, required: true
                },
                accountPassword: {
                    minlength: 4, maxlength: 15, required: true
                }
            },
            messages: {
                accountPseudo: {
                    minlength: "Au moins 4 caractères",
                    maxlength: "Au max 20 caractères",
                    required:  "Entrez votre pseudo."
                },
                accountPassword: {
                    minlength: "Au moins 4 caractères",
                    maxlength: "Au max 15 caractères",
                    required:  "Entrez votre mot de passe."
                }
            },
            errorPlacement: function (error, element) {
                error.appendTo(element.parent().next());
            }
        });
        });
    </script>
    
    <div role="main" class="ui-content">
        <div class="centrer">Compte</div><br/><br/>
        <div>
            <%
                String message = request.getParameter("message");
                if (message != null) {
                    if (message.equalsIgnoreCase("pbLogin")) {
                        out.print("Vérifiez le nom et le mot de passe");
                    }
                    else if (message.equalsIgnoreCase("bloque")) {
                        out.print("Votre compte est bloqué.\n"
                                + "Contactez l'administrateur");
                    }
                    else if (message.equalsIgnoreCase("pseudoPerduEMailInconnu")) {
                        out.print("Votre mail n'est pas connu.");
                    }
                    else if (message.equalsIgnoreCase("motDePassePseudoInconnu")) {
                        out.print("Votre pseudo n'est pas connu.");
                    }
                }
            %>
        </div>
        <br/>
        <form id="formLogin" method="post" action="discovery.jsp">
            <div data-role="fieldcontain">
                <label for="accountPseudo" data-theme="a">Pseudo:</label>
                <input type="text" name="accountPseudo" id="accountPseudo"
                      data-theme="a" placeholder="A compléter"/>  
                <span></span>                 
            </div>
            <div data-role="fieldcontain">
                <label for="accountPassword" data-theme="a" >Mot de passe:</label>
                <input type="password" name="accountPassword" id="accountPassword"
                        data-theme="a" placeholder="A compléter"/> 
                <span></span>   
            </div>
            <br/>
            <label for="accountAction" data-theme="a"></label>
            <input name="action" id="accountAction" type="hidden" value="reqLogin"/>
            <button type="submit" id="submitOK" name="submitOK" data-theme="a">OK</button>
        </form>
        <br/><br/>
        <div>
            <a href="discovery.jsp?action=contact" data-theme="a" 
                    class="ui-btn ui-shadow ui-corner-all ui-btn-a">
                Contacter l'administrateur !
            </a>
        </div><br/>
        <div>
            <a href="tuto1.jsp" data-theme="a"
               class="ui-btn ui-shadow ui-corner-all ui-btn-a">
               Pas de compte, faire le tuto !</a>
        </div>
    </div>

    <%@include file="../includes/footer.jspf" %>
</div>
</body>
</html>