<%-- 
    Document   : site
    Created on : 05 Mai 2014, 16:54:26
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Evaluation</title>
    <%@include file="includes/head.jspf"%>
</head>

<body>
<div class="page" data-role="page" id="evaluationPage">

    <%@include file="includes/tutoheader.jspf" %>
    
    <div role="main" class="ui-content">
        <br/><br/>
        
        <div data-demo-html="true">
            <div data-role="collapsibleset" data-theme="a"
                 class="ui-alt-icon">
                <div data-role="collapsible">
                    <h3><span id="rc01">Question 01</span></h3>
                    <form id="form1">
                        <fieldset id="fieldset1" data-role="controlgroup" class="fieldset">
                            <legend>Une supernova correspond à :</legend>
                            <input name="rc01" id="rc010" value="01 0" checked="checked" type="radio">
                            <label for="rc010">Pas de réponse</label>
                            <input name="rc01" id="rc011" value="01 1" type="radio">
                            <label for="rc011">la naissance d'une étoile</label>
                            <input name="rc01" id="rc012" value="01 2" type="radio">
                            <label for="rc012">la mort d'une étoile</label>
                            <input name="rc01" id="rc013" value="01 3" type="radio">
                            <label for="rc013">le passage d'une météorite dans une galaxie</label>
                        </fieldset>
                    </form>
                </div>
                <div data-role="collapsible">
                    <h3><span id="rc02">Question 02</span></h3>
                    <form>
                        <fieldset id="fieldset2" data-role="controlgroup" class="fieldset">
                            <legend>L'intensité lumineuse maximale d'une supernova est atteinte :</legend>
                            <input name="rc02" id="rc020" value="02 0" checked="checked" type="radio">
                            <label for="rc020">Pas de réponse</label>
                            <input name="rc02" id="rc021" value="02 1" type="radio">
                            <label for="rc021">au bout d'une heure</label>
                            <input name="rc02" id="rc022" value="02 2" type="radio">
                            <label for="rc022">dans les premiers jours</label>
                            <input name="rc02" id="rc023" value="02 3" type="radio">
                            <label for="rc023">au bout d'un mois</label>
                        </fieldset>
                    </form>
                </div>
                <div data-role="collapsible">
                    <h3><span id="rc03">Question 03</span></h3>
                    <form>
                        <fieldset id="fieldset3" data-role="controlgroup" class="fieldset">
                            <legend>Les images de cette application sont obtenues à partir de :</legend>
                            <input name="rc03" id="rc030" value="03 0" checked="checked" type="radio">
                            <label for="rc030">Pas de réponse</label>
                            <input name="rc03" id="rc031" value="03 1" type="radio">
                            <label for="rc031">un télescope</label>
                            <input name="rc03" id="rc032" value="03 2" type="radio">
                            <label for="rc032">deux télescopes</label>
                            <input name="rc03" id="rc033" value="03 3" type="radio">
                            <label for="rc033">trois télescopes</label>
                            <input name="rc03" id="rc034" value="03 4" type="radio">
                            <label for="rc034">plus de trois télescopes</label>
                        </fieldset>
                    </form>
                </div>
                <div data-role="collapsible">
                    <h3><span id="rc04">Question 04</span></h3>
                    <form>
                        <fieldset id="fieldset4" data-role="controlgroup" class="fieldset">
                            <legend>Les galaxies surveillées chaque année sont au nombre de :</legend>
                            <input name="rc04" id="rc040" value="04 0" checked="checked" type="radio">
                            <label for="rc040">Pas de réponse</label>
                            <input name="rc04" id="rc041" value="04 1" type="radio">
                            <label for="rc041">10</label>
                            <input name="rc04" id="rc042" value="04 2" type="radio">
                            <label for="rc042">100</label>
                            <input name="rc04" id="rc043" value="04 3" type="radio">
                            <label for="rc043">1000</label>
                            <input name="rc04" id="rc044" value="04 4" type="radio">
                            <label for="rc044">10000</label>
                        </fieldset>
                    </form>
                </div>
                <div data-role="collapsible">
                    <h3><span id="rc05">Question 05</span></h3>
                    <form>
                        <div class="tutoImg">
                            <img src="images/test01.jpg">
                            <img src="images/test01Ref.jpg">
                        </div>
                        <fieldset id="fieldset5" data-role="controlgroup" class="fieldset">
                            <legend>La trainée claire à gauche est due :</legend>
                            <input name="rc05" id="rc050" value="05 0" checked="checked" type="radio">
                            <label for="rc050">Pas de réponse</label>
                            <input name="rc05" id="rc051" value="05 1" type="radio">
                            <label for="rc051">au passage d'un cosmique</label>
                            <input name="rc05" id="rc052" value="05 2" type="radio">
                            <label for="rc052">au passage d'un satellite</label>
                            <input name="rc05" id="rc053" value="05 3" type="radio">
                            <label for="rc053">à une supernova</label>
                        </fieldset>
                    </form>
                </div>
                <div data-role="collapsible">
                    <h3><span id="rc06">Question 06</span></h3>
                    <form>
                        <fieldset data-role="controlgroup">
                            <legend>Les supernovae visibles par cette application seront elles rares ?</legend>
                            <input name="rc06" id="rc060" value="06 0" checked="checked" type="radio">
                            <label for="rc060">je ne sais pas !</label>
                            <input name="rc06" id="rc061" value="06 1" type="radio">
                            <label for="rc061">environ 1 par mois</label>
                            <input name="rc06" id="rc062" value="06 2" type="radio">
                            <label for="rc062">environ 2 par an</label>
                            <input name="rc06" id="rc063" value="06 3" type="radio">
                            <label for="rc063">environ 1 tout les 5 ans</label>
                        </fieldset>
                    </form>
                </div>
                <div data-role="collapsible">
                    <h3><span id="rc07">Question 07</span></h3>
                    <form>
                        <fieldset data-role="controlgroup">
                            <legend>Qu'est ce qu'une galaxie ?</legend>
                            <input name="rc07" id="rc070" value="07 0" checked="checked" type="radio">
                            <label for="rc070">je ne sais pas !</label>
                            <input name="rc07" id="rc071" value="07 1" type="radio">
                            <label for="rc071">une étoile</label>
                            <input name="rc07" id="rc072" value="07 2" type="radio">
                            <label for="rc072">un amas d'étoiles</label>
                            <input name="rc07" id="rc073" value="07 3" type="radio">
                            <label for="rc073">une étoile qui explose</label>
                        </fieldset>
                    </form>
                </div>
                <div data-role="collapsible">
                    <h3><span id="rc08">Question 08</span></h3>
                    <form>
                        <fieldset data-role="controlgroup">
                            <legend>Si je vois une nouvelle source de lumière, qu'est ce que je fais ?</legend>
                            <input name="rc08" id="rc080" value="08 0" checked="checked" type="radio">
                            <label for="rc080">je ne sais pas !</label>
                            <input name="rc08" id="rc081" value="08 1" type="radio">
                            <label for="rc081">j'envoie une candidate immédiatement</label>
                            <input name="rc08" id="rc082" value="08 2" type="radio">
                            <label for="rc082">je vérifie l'historique avant d'envoyer</label>
                            <input name="rc08" id="rc083" value="08 3" type="radio">
                            <label for="rc083">je n'envoie rien</label>
                        </fieldset>
                    </form>
                </div>
                <div data-role="collapsible">
                    <h3><span id="rc09">Question 09</span></h3>
                    <form>
                        <div class="tutoImg2">
                            <img src="images/tuto36.jpg">
                        </div>
                        <fieldset data-role="controlgroup">
                            <legend>Y a t-il une supernova dans cette image?</legend>
                            <input name="rc09" id="rc090" value="09 0" checked="checked" type="radio">
                            <label for="rc090">je ne sais pas !</label>
                            <input name="rc09" id="rc091" value="09 1" type="radio">
                            <label for="rc091">Oui, j'en suis sûr</label>
                            <input name="rc09" id="rc092" value="09 2" type="radio">
                            <label for="rc092">Je pense mais je vérifie avec histo et blink</label>
                            <input name="rc09" id="rc093" value="09 3" type="radio">
                            <label for="rc093">je n'envoie rien</label>
                        </fieldset>
                    </form>
                </div>
                <div data-role="collapsible">
                    <h3><span id="rc10">Question 10</span></h3>
                    <form>
                        <div class="tutoImg">
                            <img src="images/test01Ref.jpg">
                            <img src="images/test01Ref.jpg">
                        </div>
                        <fieldset data-role="controlgroup">
                            <legend>Y a t-il une supernova dans cette image?</legend>
                            <input name="rc10" id="rc100" value="10 0" checked="checked" type="radio">
                            <label for="rc100">je ne sais pas !</label>
                            <input name="rc10" id="rc101" value="10 1" type="radio">
                            <label for="rc101">Oui j'en suis sûr</label>
                            <input name="rc10" id="rc102" value="10 2" type="radio">
                            <label for="rc102">Je pense mais je vérifie avec histo et blink</label>
                            <input name="rc10" id="rc103" value="10 3" type="radio">
                            <label for="rc103">je pense qu'il n'y en a pas</label>
                        </fieldset>
                    </form>
                </div>
                <div data-role="collapsible">
                    <h3><span id="rc11">Question 11</span></h3>
                    <form>
                        <div class="tutoImg2">
                            <img src="images/tuto35.jpg">
                        </div>
                        <fieldset data-role="controlgroup">
                            <legend>Y a t-il une supernova dans cette image?</legend>
                            <input name="rc11" id="rc110" value="11 0" checked="checked" type="radio">
                            <label for="rc110">je ne sais pas !</label>
                            <input name="rc11" id="rc111" value="11 1" type="radio">
                            <label for="rc111">Oui, j'en suis sûr</label>
                            <input name="rc11" id="rc112" value="11 2" type="radio">
                            <label for="rc112">Je pense mais je vérifie avec histo et blink</label>
                            <input name="rc11" id="rc113" value="11 3" type="radio">
                            <label for="rc113">je n'envoie rien</label>
                        </fieldset>
                    </form>
                </div>
            </div>
            
            <div class="ui-grid-a">
                <div class="ui-block-a">
                    <button id="btnResetQCM" class="ui-btn">Reset</button>
                </div>
                <div class="ui-block-b">
                    <button id="btnTestQCM" class="ui-btn">Envoyer</button>
                </div>
            </div>
        </div>
        <%-- le script pour s'exécuter doit être dans la page data-role --%>
    <script>
        var totalQCM = new Array();
        var nbQuestions = 11;
        
        // A l'initialisation de la page
        $(function() {
            $("#btnResetQCM").bind("click", resetQCM);
            $("#btnTestQCM").bind("click", testQCM);
            $("#btnPopupInscription").bind("click", inscription);
            $("#btnPopupDejaInscrit").bind("click", dejaInscrit);
            $("#btnPopupQCMRate").bind("click", QCMNonReussi);
            resetQCM();
            $("input[type='radio']").bind( "change", function(event, ui) {
                // valeur = "01 2"    
                //           01 : num question (0 à n-1)
                //            2 : num du choix
                value = $(this).val();
                question =  parseInt(value.substring(0,2));
                choix =  parseInt(value.substring(3,4));
                totalQCM[question - 1] = choix;
                id = '#' + $(this).attr('name');
                // le titre est gris si la question est traitée, noir sinon
                if (choix > 0)
                    $(id).css('color', 'lightgrey');
                else 
                    $(id).css('color', 'black');
            });
        });

        // on reset toutes les forms
        function resetQCM() {
            for (i = 0; i < nbQuestions; i++) {
                $('form')[i].reset();
                totalQCM[i] = 0;
                if (i+1 >= 10)                  // tous les titres sont noirs
                    val = (i + 1).toString();
                else
                    val = "0" + (i + 1).toString();
                id = '#rc' + val;
                $(id).css('color', 'black');
            }
        }
 
        function testQCM() {
            nbReponses = nbReponsesQCM();
            if (nbReponses >= nbQuestions) {    // est ce fini ?
                envoiQCM();
            }
            else {                              // popup d'avertissement
                $('#popupPbQCM').popup( "open" );
            }
        }
        
        function nbReponsesQCM() {
            var total = 0;
            
            for (i = 0; i < nbQuestions; i++) {
                if (totalQCM[i] > 0)
                    total++;
            }
            return total;
        }
        
        function envoiQCM() {
            var reponses = "";
            for (i = 0; i < nbQuestions; i++) {
                reponses += totalQCM[i] + "|";
            }
            $.ajax({
                url  : 'discovery.jsp?action=ajax_QCM',
                type : 'POST',
                // On passe nos parametres par POST au script ajax_QCM.jsp
                // pour transmettre les réponses au questionnaire 
                data : 'reponses=' + reponses.toString(),
                success: function(data) {
                    if (data.indexOf("oui") !== -1) {
                        $('#popupInscription').popup( "open" );
                    }
                    else if (data.indexOf("inscrit") !== -1) {
                        $('#popupDejaInscrit').popup( "open" );
                    }
                    else {
                        $('#popupQCMRate').popup( "open" );
                    }
                },
                error : function(resultat, statut, erreur) {
                    alert("Désolé, le serveur ne répond pas");
                }
            });
        }
        
        function inscription() {
            // sans ajax, inscription.jsp ne marche pas sans ajax.
            window.location.href = "discovery.jsp?action=inscription";
        }

        function dejaInscrit() {
            $.mobile.changePage("discovery.jsp?action=infoUser", { transition: "slide"} );
        }
        
        function QCMNonReussi() {
            $.mobile.changePage("tuto1.jsp", { transition: "slide"} );
        }
    </script>
    </div>

    <%@include file="includes/footer.jspf" %>
    
    <!-- popup pb avec QCM en mode modal-->
    <div id="popupInscription" data-role="popup" data-theme="a" data-overlay-theme="b"
         class="ui-corner-all ui-alt-icon" data-corners="true" data-position-to="window" data-dismissible="false">
        <div class="mesPopups" align="center">
            <br/>
            <h3 id="textPopupInscription">Bravo !<br/>Vous pouvez maintenant vous inscrire.</h3>
            <br/>
            <button id="btnPopupInscription" class="ui-btn ui-corner-all">OK</button>
        </div>
    </div>
    
    <!-- popup déjà inscrit en mode modal-->
    <div id="popupDejaInscrit" data-role="popup" data-theme="a" data-overlay-theme="b"
         class="ui-corner-all ui-alt-icon" data-corners="true" data-position-to="window" data-dismissible="false">
        <div class="mesPopups" align="center">
            <br/>
            <h3 id="textPopupDejaInscrit">Bravo !<br/>Mais vous êtes déjà inscrit.</h3>
            <br/>
            <button id="btnPopupDejaInscrit" class="ui-btn ui-corner-all">OK</button>
        </div>
    </div>
    
    <!-- popup pb avec QCM en mode modal-->
    <div id="popupQCMRate" data-role="popup" data-theme="a" data-overlay-theme="b"
         class="ui-corner-all ui-alt-icon" data-corners="true" data-position-to="window" data-dismissible="false">
        <div class="mesPopups" align="center">
            <br/>
            <h3 id="textPopupQCMRate">Vous avez fait trop d'erreurs<br/>Revoyez le tutoriel.</h3>
            <br/>
            <button id="btnPopupQCMRate" class="ui-btn ui-corner-all">OK</button>
        </div>
    </div>
    
    <!-- popup pb avec QCM en mode non modal-->
    <div id="popupPbQCM" data-role="popup" data-theme="a" data-overlay-theme="b"
         class="ui-corner-all ui-alt-icon" data-corners="true" data-position-to="window" data-dismissible="true">
        <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow 
             ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
        <div class="mesPopups" align="center">
            <br/>
            <h3 id="popupTextPbQCM">Vous n'avez répondu à toutes les questions.</h3>
            <br/>
        </div>
    </div>
</div>
    
</body>

</html>
