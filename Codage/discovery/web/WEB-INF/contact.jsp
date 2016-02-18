<%-- 
    Document   : site
    Created on : 05 Mai 2014, 16:54:26
    Author     : 
--%>
<%@page import="com.metier.DiscoSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Contact</title>
    <%@include file="../includes/head.jspf" %>
</head>

<body>
<div class="page" data-role="page" id="contactID" >
    <%@include file="../includes/div_header.jspf" %>
        <h1>Compte</h1>
        <%@include file="../includes/user.jspf" %>
    </div>
    
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script>
        //que des cars alphanumérique pour "textOnly"
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
            $('#formContact').validate({
            rules: {
                contactNom: {
                    minlength: 4, maxlength: 20, nomOnly: true, required: true
                },
                contactEMail: {
                    email: true, required: true
                },
                contactTexte: {
                    maxlength: 800, required: true
                }
            },
            messages: {
                contactNom: {
                    minlength: "Au moins 4 caractères",
                    maxlength: "Au max 20 caractères",
                    required:  "Entrez votre pseudo."
                },
                contactEMail: {
                    email: "Entrez un mail valide",
                    required:  "Entrez votre EMail."
                },
                contactTexte: {
                    maxlength: "Au max 800 caractères",
                    required:  "Vous devez mettre un contenu."
                }
            },
            errorPlacement: function (error, element) {
                error.appendTo(element.parent().next());
            }
        });
        });

        function infoPopUp() {
            if ($('#formContact').valid()) {
                setTimeout(function () {
                    $("#popupSendContact").popup("open");
                }, 100);
            }
        }
    </script>
    
    <div role="main" class="ui-content">
        <br/><br/>
        <br/>
        <form id="formContact" method="post" onsubmit="infoPopUp();" action="discovery.jsp">
            <br/><br/>
            <div data-role="fieldcontain">
                <%
                    out.println("<label for='contactNom' data-theme='d'>Votre nom:</label>"
                                + "<input type='text' name='contactNom' id='contactNom' "
                                + "data-theme='d' placeholder='A compléter' ");
                    if (user != null)
                        out.println("value='" + user.getPseudo() + "'");
                    out.println("/>  <span></span>");
                %>      
            </div>
            <div data-role="fieldcontain">
                <%
                    out.println("<label for='contactEMail' data-theme='d'>Votre EMail:</label>"
                                + "<input type='email' name='contactEMail' id='contactEMail' "
                                + "data-theme='d' placeholder='A compléter' ");
                    if (user != null)
                        out.println("value='" + user.getEmail() + "'");
                    out.println("/> <span></span>");
                %>                
            </div>
            
            <div class="fieldcontain">
              <label for="contactTexte" data-theme="a">Votre demande:</label>
              <textarea name="contactTexte" id="contactTexte"></textarea>
            </div>
            <br/>
            <label for="contactAction" data-theme="a"></label>
            <input name="action" id="contactAction" type="hidden" value="reqContact"/>
            <button type="submit" id="btnContactOK" name="contactOK" data-theme="a">Envoyer</button>
        </form>
    </div>

    <%@include file="../includes/footer.jspf" %>
    
    <!-- popup message en mode modal-->
    <div id="popupSendContact" data-role="popup" data-theme="a" data-overlay-theme="b"
         class="ui-corner-all" data-corners="true" data-position-to="window" data-dismissible="false">
        <div class="mesPopups" align="center">
            <br/>
            <h3 id="popupTextSendContact">Attendez, je transmets votre mail</h3>
            <div class="progressBar"><div></div></div>
            <br/>
        </div>
    </div>
</div>
</body>
</html>