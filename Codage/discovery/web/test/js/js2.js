function user(){
    prog = document.getElementById("progBar");
    prog.setAttribute("aria-valuenow", "25");
    prog.setAttribute("style", "width:25%");
    prog.innerText = '25%';
    document.getElementById("source").innerText = '\
//Cr\351ation de l utilisateur\n\User.create(con, "test", "test", "blanchonenzo@gmail.com", mdp, "ok");';
    document.getElementById("result").innerText = 'Utilisateur cr\351e\n\
Pseudo : test\n\
Mot de passe : test\n\
Adresse e-mail : blanchonenzo@gmail.com\n\
Compte valid\351 : Oui';
    document.getElementById("genMdp").setAttribute("class", "btn btn-primary active");
    document.getElementById("genMdp").setAttribute("onClick", "genMdp()");
    document.getElementById("user").setAttribute("class", "btn btn-primary disabled");
    document.getElementById("user").setAttribute("onClick", "");
    $.ajax({
       url : 'ajax/ajax_pseudo_perdu_1.jsp',
       type : 'POST',
       dataType : 'html'
    });
}

function genMdp(){
    prog = document.getElementById("progBar");
    prog.setAttribute("aria-valuenow", "50");
    prog.setAttribute("style", "width:50%");
    prog.innerText = '50%';
    document.getElementById("source").innerText = 'String pseudo = User.getPseudoByMail(con, mail);';
    document.getElementById("result").innerText = 'pseudo = test';
    document.getElementById("sendMail").setAttribute("class", "btn btn-primary active");
    document.getElementById("sendMail").setAttribute("onClick", "sendMail()");
    document.getElementById("genMdp").setAttribute("class", "btn btn-primary disabled");
    document.getElementById("genMdp").setAttribute("onClick", "");
    $.ajax({
       url : 'ajax/ajax_pseudo_perdu_2.jsp',
       type : 'POST',
       dataType : 'html',
    });
}

function sendMail(){
    prog = document.getElementById("progBar");
    prog.setAttribute("aria-valuenow", "75");
    prog.setAttribute("style", "width:75%");
    prog.innerText = '75%';
    document.getElementById("source").innerText = '\
//Envoi du mail \n\ SmtpSend.sendMessage("Nouveau pseudo", contenu, user.getEmail);';
    document.getElementById("result").innerText = 'Mail envoy\351';
    document.getElementById("sup").setAttribute("class", "btn btn-primary active");
    document.getElementById("sup").setAttribute("onClick", "sup()");
    document.getElementById("sendMail").setAttribute("class", "btn btn-primary disabled");
    document.getElementById("sendMail").setAttribute("onClick", "");
    $.ajax({
       url : 'ajax/ajax_pseudo_perdu_3.jsp',
       type : 'POST',
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