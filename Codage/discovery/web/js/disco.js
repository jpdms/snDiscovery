/* global imagesNoms, cheminCalern, cheminChili, cheminRef */

// --------------- Gestion de la position de l'image ----------------- 
var position = 1;                              // indice courant de l'observation
var img = new Image();                         // image de la candidate
var holdCords = { holdX : -100, holdY : -100}; // position de la candidate
var sendingMail = false;
var timer;
var x = 0;
var images = new Array();

// --------------------- callback ----------------------- 
$(function() {
    $("#clicZoomLeft").on("click", popupZoomLeft);
    $("#clicZoomRight").on("click", popupZoomRight);
    $("#btnPcdt").on("click", imagePrecedente);
    $("#btnSvt").on("click", imageSuivante);
    $("#btnCandidat").on("click", initCandidat);
    $("#btnCandidatRef").on("click", initCandidatRef);
    $("#mon_canvas").on("tap",  tapHandler);
    $("#mon_canvas").on("vmousedown", vMouseDownHandler);
    $("#btnInfos").on("click", afficheInfos);
    $("#btnHisto").on("click", afficheHisto);
    $("#popupBlink").on("popupafteropen", startBlink);
    $("#popupBlink").on("popupafterclose", stopBlink);
    
    $("#btnConfirmCandidat").on("click", confirmCandidat);
    $("#btnPseudoPerduOK").on("click", dmdPseudoPerdu);
    $("#btnMotDePassePerduOK").on("click", dmdPseudoPerdu);
    $("#popupCandidat").on("popupafterclose", popupSendMail);
    $("#popupCandidatRef").on("popupafterclose", popupSendMail);
    $("#popupPseudoPerdu").on("popupafterclose", popupSendPseudo);
    $("#popupMotDePassePerdu").on("popupafterclose", popupSendMotDePasse);
});

// -------------------------------------------------------------------
function nouvelleDate(dateCrt) {
    // résout le pb d'une app sous IPhone sans sortir de l'app
    $(location).attr('href',"disco.jsp?date=" + dateCrt);
}

function popupSendMail() {
    if (sendingMail) {
        sendingMail = false;
        $('#popupSendMail').popup('open');
    }
}

function popupSendPseudo() {
    if ($('#formPseudoPerdu').valid() && sendingMail) {
        sendingMail = false;
        setTimeout(function () {
            $("#popupSendPseudo").popup("open");
        }, 100);
    }
}

function popupSendMotDePasse() {
    if ($('#formMotDePassePerdu').valid() && sendingMail) {
        sendingMail = false;
        setTimeout(function () {
            $("#popupSendMotDePasse").popup("open");
        }, 100);
    }
}

// Appui sur le bouton de demande de pseudo
function dmdPseudoPerdu() {
    var pseudoPerduEMail = $("#pseudoPerduEMail").val();
    
    sendingMail = true;
    $.ajax({
        url  : 'discovery.jsp?action=pseudoPerduEMail',
        type : 'POST',
        data : 'pseudoPerduEMail=' + pseudoPerduEMail,
        dataType : 'html',
        success: function(data) {
            $('.progressBar').hide();
            $('#popupSendPseudo').popup( "option", "dismissible", true );
            // résout un bug de popup sans sortir de l'app
            $(location).attr('href',"msgDisco.jsp?msg=" + data);
        },
        error : function(resultat, statut, erreur) {
            $('.progressBar').hide();
            $('#popupTextSendPseudo').text("Impossible de vous envoyer votre pseudo !");
            $('#popupSendPseudo').popup( "option", "dismissible", true );
            return false;
        }
    });
}
    
// Appui sur le bouton de confirmation d'identification d'un candidat
// il faut d'abord vérifié que le user a pointé l'endroit repéré
function confirmCandidat() {
    var imgNom = imagesNoms[position-1];
    var chemin = (imgNom.charAt(0) == 'F') ? cheminCalern : cheminChili;
    var nom = imgNom.substring(2, imgNom.length);
    var certitude = $('input[name=rdoCertitude]:checked', '#formCandidat').val();
    
    sendingMail = true;
    $.ajax({
        // transmettre les infos de la candidate
        url  : 'discovery.jsp?action=ajax_candidate',
        type : 'POST',
        data :    'nomGalaxie=' + nom
                + '&chemin=' + chemin
                + '&certitude=' + certitude
                + '&xPos=' + holdCords.holdX
                + '&yPos=' + holdCords.holdY,
        dataType : 'html',
        success: function(data) {
            $('.progressBar').hide();
            $('#popupSendMail').popup( "option", "dismissible", true );
            // résout un bug de popup sans sortir de l'app
            $(location).attr('href',"msgDisco.jsp?msg=" + data);
        },
        error : function(resultat, statut, erreur) {
            $('.progressBar').hide();
            $('#popupTextSendMail').text("Impossible d'informer les chercheurs !");
            $('#popupSendMail').popup( "option", "dismissible", true );
            return false;
        }
    });
}

function initCandidat() {
    initCanvas();
    var imgNom = imagesNoms[position-1];
    var nom = imgNom.substring(2, imgNom.length);
    $("#nomCandidat").text(nom);
    // On ne peut pas valider tant que la position n'est pas pointée
    $("#btnConfirmCandidat").hide();
}

function initCandidatRef() {
    var srcRef = document.getElementById("imgobs").src;
    $("#imgModRef").attr('src',  srcRef);
    var nomGalaxie = document.getElementById("nomGalaxie").innerHTML;
    $("#nomGalaxieRef").attr('value',  nomGalaxie);
    var chemin = document.getElementById("imgModRef").src;
    $("#cheminRef").attr('value',  chemin);
}   

function popupZoomLeft() {
    var imgNom = imagesNoms[position-1];
    var chemin = (imgNom.charAt(0) == 'F') ? cheminCalern : cheminChili;
    var nom = imgNom.substring(2, imgNom.length);
    images[0] = chemin + nom + ".jpg";
    $("#imgZoomLeft").attr('src', images[0]);
}

function popupZoomRight() {
    var imgNom = imagesNoms[position-1];
    var nom = imgNom.substring(2, imgNom.length);
    images[1] = cheminRef + nom + ".jpg";
    $("#imgZoomRight").attr('src', images[1]);
}

function initCanvas() {
    // il n'y en a qu'un, mais jQuery nécessite de prendre le 1er élément ds ce cas
    var canvas = $("#mon_canvas")[0];
    // Contexte de dessin 2D du canvas
    var ctx = canvas.getContext("2d");
    var imgNom = imagesNoms[position-1];
    var chemin = (imgNom.charAt(0) == 'F') ? cheminCalern : cheminChili;
    var nom = imgNom.substring(2, imgNom.length);
    img.src = chemin + nom + ".jpg";
    // l'image est déjà chargée
    ctx.drawImage(img, 0, 0, 77, 77, 0, 0, canvas.width, canvas.height);
}

function imageSuivante() {
    position = suivant();
    nouvelleImage(position);
    var imgNom = imagesNoms[position-1];
    var chemin = (imgNom.charAt(0) == 'F') ? cheminCalern : cheminChili;
    var nom = imgNom.substring(2, imgNom.length);
    chemin = chemin + nom + ".jpg";
    $.ajax({
        // transmettre les infos de la candidate
        url  : 'discovery.jsp?action=ajax_lastImg',
        type : 'POST',
        data :    'pseudo=' + nom
                + '&chemin=' + chemin
                + '&pos=' + position,
        dataType : 'html',
    });
}

function imagePrecedente() {
    position = precedent();
    nouvelleImage(position);
}

// sur un tap on dessine autour un carré
function tapHandler(event) {
    // il n'y en a qu'un, mais jQuery nécessite de prendre le 1er élément ds ce cas
    var canvas = $("#mon_canvas")[0];
    // Contexte de dessin 2D du canvas
    var ctx = canvas.getContext("2d");
    // on efface l'ancienne image
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    // on redessine l'image
    ctx.drawImage(img, 0, 0, 77, 77, 0, 0, canvas.width, canvas.height);
    // dessine un carré autour du tap
    ctx.beginPath();
    ctx.strokeStyle="LightCyan";
    ctx.rect(holdCords.holdX - 30, holdCords.holdY - 30, 60, 60);
    ctx.stroke();
    // Maintenant on peut valider la découverte !!!
    $("#btnConfirmCandidat").show();
}

// permet de conserver les coordonnées du tap 
// par rapport à l'origine du canvas
function vMouseDownHandler(event) {
    // offset du canvas par rapport à la page
    var canvasOffset = $("#mon_canvas").offset();
    var offsetX = canvasOffset.left;
    var offsetY = canvasOffset.top;
    holdCords.holdX = parseInt(event.pageX - offsetX);
    holdCords.holdY = parseInt(event.pageY - offsetY);
};

function nouvelleImage(pos) {
    position = pos;
    var imgNom = imagesNoms[pos-1];
    var chemin = (imgNom.charAt(0) == 'F') ? cheminCalern : cheminChili;
    var nom = imgNom.substring(2, imgNom.length);
    var src = chemin + nom + ".jpg";
    var srcRef = cheminRef + nom + ".jpg";
    $("#imgobs").attr('src', src);
    $("#imgref").attr('src', srcRef);
    $("#nomGalaxie").text(nom);
    $("#numImages").text("(" + pos + "/" + imagesNoms.length + ")");
    if (pos == 1)
        $("#btnPcdt").addClass("ui-state-disabled");
    else
        $("#btnPcdt").removeClass("ui-state-disabled");
    if (pos == imagesNoms.length)
        $("#btnSvt").addClass("ui-state-disabled");
    else
        $("#btnSvt").removeClass("ui-state-disabled");
}

function clearArray(tab) {
    while(tab.length > 0) {
        tab.pop();
    }
}

function precedent() {
    return offset(-1);
}

function suivant() {
    return offset(1);
}

// _offset entre 1 et size()
function offset(_offset) {
    newPosition = position + _offset;
    if (newPosition <= 0)
        newPosition = 1;
    else if (newPosition > imagesNoms.length)
        newPosition = imagesNoms.length;
    return newPosition;
}

// --------------------- Gestion des infos ---------------------------

function afficheInfos() {
    var imgNom = imagesNoms[position-1];
    var telescope = (imgNom.charAt(0) == 'F') ? "Calern (France)" : "La Silla (Chili)";
    var nom = imgNom.substring(2, imgNom.length);
    $("#nomInfos").text("Nom : " + nom);
    
    $.ajax({
        url  : 'ajax_infosGalaxie.jsp',
        type : 'POST',
        data : 'nom=' + nom,
        success: function(data) {
            var tabInfos = data.split("|");
            $("#catInfos").text("Catégorie: " + tabInfos[1]);
            $("#textInfos").text("Informations: " + tabInfos[2]);
            $("#nbNovInfos").text("Supernovae découvertes: " + tabInfos[3]);
            $("#adrInfos").text("Ascension droite (degré): " + tabInfos[4]);
            $("#decInfos").text("Déclinaison (degré): " + tabInfos[5]);
            // conversion de méga parsec en million d'année lumière
            $("#distInfos").text("Distance (mal): " + 3.2616*tabInfos[6]);
            $("#magInfos").text("Magnitude: " + tabInfos[7]);
            $("#magTelescope").text("Télescope : " + telescope);
        },
        error : function(resultat, statut, erreur) {
            alert("Impossible de récupérer les infos.\n Msg: " + erreur);
        }
    });
}

// ------------------ Gestion de l'historique ------------------------
function afficheHisto() {
    var imgNom = imagesNoms[position-1];
    var nom = imgNom.substring(2, imgNom.length);
    $("#nomHisto").text("Nom : " + nom);
    
    $.ajax({
        url  : 'ajax_lastImages.jsp',
        type : 'POST',
        data : 'nom=' + nom,
        success: function(data) {
            var tabInfos = data.split("|");
            var codeHTML = "<div>";
            src = new Array("images/black.jpg", "images/black.jpg",
                            "images/black.jpg", "images/black.jpg",
                            "images/black.jpg", "images/black.jpg");
            for (i = 0; i < tabInfos.length; i++) {
                var info = tabInfos[i].replace(/\s/g,"");
                var leChemin = (info.charAt(0) == 'F') ? "/jpeg/Tarot_Calern/" : "/jpeg/Tarot_Chili/";
                var laDate = info.substring(1, info.length);
                
                str = leChemin + laDate + "/" + nom + ".jpg";
                src[i] = str;
            }
            
            for (i = 0; i < src.length; i++) {
                codeHTML += "<img src='" + src[i] + "'/>";
            }
            codeHTML += "</div>";
            $("#imgHisto").html(codeHTML);
        },
        error : function(resultat, statut, erreur) {
            alert("Impossible de récupérer les infos");
        }
    });
}

// ---------------------- Gestion du blink ---------------------------

function startBlink() {
    var imgNom = imagesNoms[position-1];
    var chemin = (imgNom.charAt(0) == 'F') ? cheminCalern : cheminChili;
    var nom = imgNom.substring(2, imgNom.length);
    $("#nomBlink").text("Galaxie : " + nom);
    images[0] = chemin + nom + ".jpg";
    images[1] = cheminRef + nom + ".jpg";
    timer = setInterval("changeImage()", 500);
    x = 0;
}

function stopBlink() {
    clearInterval(timer);
}

function changeImage() {
    x++;
    x = x % 2;
    $("#imgBlink").attr('src', images[x]);
}
// ------------------ Fin de gestion du blink -----------------------