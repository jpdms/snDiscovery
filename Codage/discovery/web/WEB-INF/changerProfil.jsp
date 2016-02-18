<%-- 
    Document   : changerProfil
    Created on : 28 mai 2014, 14:54:51
    Author     : jpdms
--%>
<%@page import="com.persistence.Utils"%>
<%@page import="com.persistence.User"%>
<%@page import="com.metier.DiscoSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>ChangerProfil</title>
    <%@include file="../includes/head.jspf" %>
</head>

<body>
<div class="page" data-role="page" id="changerProfilPage">
    <%@include file="../includes/div_header.jspf" %>
        <h1>Compte</h1>
        <%@include file="../includes/user.jspf" %>
    </div>
    
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script>
        //que des cars alphanumérique pour "nomOnly"
        $.validator.addMethod("nomOnly", 
            function(value, element) {
                return !/[^a-zA-Z0-9àáâãäåçèéêëìíîïòóôõöùúûüýÿ_. ]/.test(value);
            }, "Que des caractères alphanumériques accentués."
        );

        $(document).ready(function () {
            $('#formMajProfil').validate({
            rules: {
                cmdpNom: {
                    minlength: 4, maxlength: 30, nomOnly: true, required: true
                },
                cmdpEMail: {
                    email: true, required: true
                },
                cmdpNewPassword: {
                    minlength: 4, maxlength: 15
                },
                cmdpVerifPassword: {
                    minlength: 4, maxlength: 15, equalTo: "#cmdpNewPassword"
                }
            },
            messages: {
                cmdpNom: {
                    minlength: "Au moins 4 caractères",
                    maxlength: "Au max 30 caractères",
                    required:  "Entrez votre nom."
                },
                cmdpEMail: {
                    required:  "Entrez votre EMail."
                },
                cmdpNewPassword: {
                    minlength: "Au moins 4 caractères",
                    maxlength: "Au max 15 caractères"
                },
                cmdpVerifPassword: {
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
        <br/>
        <%
            maSession = (DiscoSession)session.getAttribute("maSession");
            user = maSession.getUser();
        %>
        <div>
            <%
                String message = request.getParameter("message");
                if (message != null) {
                    if (message.equalsIgnoreCase("pbPassword"))
                        out.print("Les mots de passe sont différents");
                    if (message.equalsIgnoreCase("pbBD"))
                        out.print("L'utilisateur n'a pas pu faire la modification, contacter l'administrateur du site");
                }
            %>
        </div>
        
        <form id="formMajProfil" method="post"
                                    action="discovery.jsp?action=reqMajProfil">
            <label for="cmdpPseudo" data-theme="a">Pseudo: <%= user.getPseudo() %></label>
            <div data-role="fieldcontain">
                <label for="cmdpNom" data-theme="a">Nom:</label>
                <input type="text" name="cmdpNom" id="cmdpNom"
                      data-theme="a" placeholder="Votre nouveau nom" 
                      value="<%= user.getUsername() %>"/>  
                <span></span>                 
            </div>
            <div data-role="fieldcontain">
                <label for="cmdpEMail" data-theme="a">EMail:</label>
                <input type="text" name="cmdpEMail" id="cmdpEMail"
                      data-theme="a" placeholder="Le nouveau EMail" 
                      value="<%= user.getEmail() %>"/>  
                <span></span>
            </div>
            <div data-role="fieldcontain">
                <label for="cmdpNewPassword" data-theme="a">Nouveau mot de passe:</label>
                <input type="password" name="cmdpNewPassword" id="cmdpNewPassword"
                      data-theme="a" placeholder="Uniquement pour le changer"/> 
                <span></span>
            </div>
            <div data-role="fieldcontain">
                <label for="cmdpVerifPassword" data-theme="a">Vérif. mot de passe:</label>
                <input type="password" name="cmdpVerifPassword" id="cmdpVerifPassword"
                      data-theme="a" placeholder="Vérification"/> 
                <span></span>
            </div>
            <br/>
            <div class="ui-grid-a">
                <div class="ui-block-a">
                    <a href="discovery.jsp?action=infoUser" id="cmdpAnnuler"  
                       data-role="button">Annuler</a>
                </div>
                <div class="ui-block-b">
                    <label for="cmdpAction" class="ui-hidden-accessible"></label>
                    <input name="action" id="cmdpAction" type="hidden" value="reqMajProfil">
                    <button type="submit" data-theme="a" name="submitOK">OK</button>
                </div>
            </div>
        </form>
        <br/>
    </div>

    <%@include file="../includes/footer.jspf" %>
</div>
</body>
</html>