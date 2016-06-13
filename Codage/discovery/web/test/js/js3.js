var keygen;
function genKey(){
    prog = document.getElementById("progBar");
    prog.setAttribute("aria-valuenow", "20");
    prog.setAttribute("style", "width:20%");
    prog.innerText = '20%';
    document.getElementById("source").innerText = 'String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";\n\
String key = "";\n\
for(int x=0;x<8;x++){\n\
int i = (int)Math.floor(Math.random() * chars.length());\n\
key += chars.charAt(i);}\n\
';
    document.getElementById("result").innerText = 'Cl\351 de validation : ' + keygen;
    document.getElementById("user").setAttribute("class", "btn btn-primary active");
    document.getElementById("user").setAttribute("onClick", "user()");
    document.getElementById("genKey").setAttribute("class", "btn btn-primary disabled");
    document.getElementById("genKey").setAttribute("onClick", "");
}
function user(){
    prog = document.getElementById("progBar");
    prog.setAttribute("aria-valuenow", "40");
    prog.setAttribute("style", "width:40%");
    prog.innerText = '40%';
    document.getElementById("source").innerText = '\
//Cr\351ation de l utilisateur\n\User.create(con, "test", "test", "blanchonenzo@gmail.com", mdp, "'+keygen+'");';
    document.getElementById("result").innerText = 'Utilisateur cr\351e\n\
Pseudo : test\n\
Mot de passe : test\n\
Adresse e-mail : blanchonenzo@gmail.com\n\
Compte valid\351 : Non';
    document.getElementById("sendMail").setAttribute("class", "btn btn-primary active");
    document.getElementById("sendMail").setAttribute("onClick", "sendMail()");
    document.getElementById("user").setAttribute("class", "btn btn-primary disabled");
    document.getElementById("user").setAttribute("onClick", "");
    $.ajax({
       url : 'ajax/ajax_val_1.jsp',
       type : 'POST',
       data : 'key=' + keygen,
       dataType : 'html'
    });
}

function sendMail(){
    prog = document.getElementById("progBar");
    prog.setAttribute("aria-valuenow", "75");
    prog.setAttribute("style", "width:75%");
    prog.innerText = '75%';
    document.getElementById("source").innerText = '\
//Envoi du mail \n\ SmtpSend.sendMessage("Demande d inscription sur snDiscovery", contenu, user.getEmail);';
    document.getElementById("result").innerText = 'Mail envoy\351';
    document.getElementById("testVal").setAttribute("class", "btn btn-primary active");
    document.getElementById("testVal").setAttribute("onClick", 'document.getElementById("formVal").submit()');
    document.getElementById("sendMail").setAttribute("class", "btn btn-primary disabled");
    document.getElementById("sendMail").setAttribute("onClick", "");
    $.ajax({
       url : 'ajax/ajax_val_2.jsp',
       type : 'POST',
       data : 'key=' + keygen,
       dataType : 'html'
    });
}

function sup(){
    prog = document.getElementById("progBar");
    prog.setAttribute("aria-valuenow", "100");
    prog.setAttribute("style", "width:100%");
    prog.innerText = '100%';
    document.getElementById("source").innerText = '\
user.delete(con);';
    document.getElementById("result").innerText = 'Utilisateur supprim\351';
    document.getElementById("sup").setAttribute("class", "btn btn-primary disabled");
    document.getElementById("sup").setAttribute("onClick", "");
    $.ajax({
       url : 'ajax/ajax_pseudo_perdu_4.jsp',
       type : 'POST',
       dataType : 'html'
    });
}