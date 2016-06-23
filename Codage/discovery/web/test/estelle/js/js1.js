function add(){
    prog = document.getElementById("progBar");
    prog.setAttribute("aria-valuenow", "33");
    prog.setAttribute("style", "width:33%");
    prog.innerText = '33%';
    document.getElementById("source").innerText = 'as = ("\\"); \n\
das = ("\\\\");\n\
    titre = titre.replace(as, das);\n\
    contenu = contenu.replace(as, das);\n\
    Date date = new Date();\n\
String sDate = new SimpleDateFormat("yyyyMMdd").format(date);\n\
Actu actu = Actu.create(con, sDate, titre, contenu);';
    document.getElementById("result").innerText = 'Actu cr\351e';
    document.getElementById("mod").setAttribute("class", "btn btn-primary active");
    document.getElementById("mod").setAttribute("onClick", "mod()");
    document.getElementById("add").setAttribute("class", "btn btn-primary disabled");
    document.getElementById("add").setAttribute("onClick", "");
    document.getElementById("idActu").style.display="block";
    $.ajax({
       url : 'ajax/ajax_add_actu.jsp',
       type : 'POST',
       dataType : 'html'
    });
}

function mod(){
    id = document.getElementById("id").value;
    prog = document.getElementById("progBar");
    prog.setAttribute("aria-valuenow", "66");
    prog.setAttribute("style", "width:66%");
    prog.innerText = '66%';
    document.getElementById("source").innerText = '    Actu actu = Actu.getById(con, id);\n\
    actu.setContenu(sContenu);\n\
    actu.setTitre(sTitre);\n\
    actu.save(con);';
    document.getElementById("result").innerText = 'Actu modifi\351e';
    document.getElementById("sup").setAttribute("class", "btn btn-primary active");
    document.getElementById("sup").setAttribute("onClick", "sup()");
    document.getElementById("mod").setAttribute("class", "btn btn-primary disabled");
    document.getElementById("mod").setAttribute("onClick", "");
    $.ajax({
       url : 'ajax/ajax_mod_actu.jsp',
       type : 'POST',
       data : 'id=' + id,
       dataType : 'html'
    });
}

function sup(){
    prog = document.getElementById("progBar");
    prog.setAttribute("aria-valuenow", "100");
    prog.setAttribute("style", "width:100%");
    prog.innerText = '100%';
    document.getElementById("source").innerText = '    Actu actu = Actu.getById(con, id);\n\
    actu.delete(con);';
    document.getElementById("result").innerText = 'Actu supprim\351e';
    document.getElementById("sup").setAttribute("class", "btn btn-primary disabled");
    document.getElementById("sup").setAttribute("onClick", "");
    $.ajax({
       url : 'ajax/ajax_sup_actu.jsp',
       type : 'POST',
       data : 'id=' + id,
       dataType : 'html'
    });
}