 $(function() {
    $("#btnConfirmCandidat").on("click", confirmCandidat);
    $("#btnRefuserCandidat").on("click", refuserCandidat);
});

function popupSendMail() {
    if (sendingMail) {
        sendingMail = false;
        $('#popupSendMail').popup('open');
    }
}
 
 function resizecanvas(){ 
    var cWidth = document.getElementById("imgobs").width
    var cHeight = document.getElementById("imgobs").height;
    $("#CanvasObs").attr('width',  cWidth); //max width
    $("#CanvasObs").attr('height', cHeight); //max height
    var cX = document.getElementById("cX").value;
    var cY = document.getElementById("cY").value;
    cX = cWidth*cX;
    cX = cX/256;                        
    cY = cWidth*cY;
    cY = cY/256;
    var t = cWidth * 60;
    t= t/256;
    var moins = cWidth * 30;
    moins = moins/256;
    var c = document.getElementById("CanvasObs");
    var ctx = c.getContext("2d");
    ctx.strokeStyle="LightCyan";
    ctx.rect(cX - moins, cY - moins, t, t);
    ctx.stroke();  
}

function initcanvas(){
    // Récupere la taille de l'image
    var cWidth = document.getElementById("imgobs").width
    var cHeight = document.getElementById("imgobs").height;
    // Initialise la taille du canvas en fonction de la taille de l'image
    $("#CanvasObs").attr('width',  cWidth); //max width
    $("#CanvasObs").attr('height', cHeight); //max height
    // Récupere les coordonnées du carré
    var cX = document.getElementById("cX").value;
    var cY = document.getElementById("cY").value;
    // Traitement
    cX = cWidth*cX;
    cX = cX/256;                        
    cY = cWidth*cY;
    cY = cY/256;
    var t = cWidth * 60;
    t= t/256;
    var moins = cWidth * 30;
    moins = moins/256;
    // Dessine le carré
    var c = document.getElementById("CanvasObs");
    var ctx = c.getContext("2d");
    ctx.strokeStyle="LightCyan";
    ctx.rect(cX - moins, cY - moins, t, t);
    ctx.stroke();    
}

function afficheInfos() {
    var nom = document.getElementById("nomGal").value;
    var telescope = document.getElementById("nomTele").value;
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

function afficheHisto() {
    var nom = document.getElementById("nomGal").value;
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


function confirmCandidat() {
    sendingMail = true;
    $.ajax({
        // transmettre les infos de la candidate
        url  : 'discovery.jsp?action=validerSupernova',
        type : 'POST',
        dataType : 'html',
        success: function(data) {
            $('.progressBar').hide();
            $('#popupSendMail').popup( "option", "dismissible", true );
            // résout un bug de popup sans sortir de l'app
            $(location).attr('href',"msgDisco.jsp?msg=" + data);
        },
        error : function(resultat, statut, erreur) {
            $('.progressBar').hide();
            $('#popupTextSendMail').text("Impossible de valider cette candidate !");
            $('#popupSendMail').popup( "option", "dismissible", true );
            return false;
        }
    });
}

function refuserCandidat() {
    sendingMail = true;
    $.ajax({
        // transmettre les infos de la candidate
        url  : 'discovery.jsp?action=refuserSupernova',
        type : 'POST',
        dataType : 'html',
        success: function(data) {
            $('.progressBar').hide();
            $('#popupSendMail').popup( "option", "dismissible", true );
            // résout un bug de popup sans sortir de l'app
            $(location).attr('href',"msgDisco.jsp?msg=" + data);
        },
        error : function(resultat, statut, erreur) {
            $('.progressBar').hide();
            $('#popupTextSendMail').text("Impossible de refuser cette candidate !");
            $('#popupSendMail').popup( "option", "dismissible", true );
            return false;
        }
    });
}
