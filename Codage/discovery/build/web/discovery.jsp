<%-- 
    Document   : Controlleur du site
    Created on : 29 janv. 2014, 16:54:26
    Author     : 
--%>

<%@page import="java.sql.Connection"%>
<%@page import="com.persistence.*"%>
<%@page import="com.metier.*"%>

<%  
    Connection con = (Connection) session.getAttribute("con");
    if (con == null)
        con = ConnexionMySQL.newConnexion();
    session.setAttribute("con", con);
    
    // traitement des actions possibles
    String action = request.getParameter("action");
    DiscoSession maSession = (DiscoSession)session.getAttribute("maSession");
    // --------------------------------------------------------------------
    if (action == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    else {
        if (action.equals("ajax_QCM")) {
            request.getRequestDispatcher("WEB-INF/ajax_QCM.jsp").forward(request, response);
        }
        else if (maSession == null) {                 // user non connecté
            if (action.equals("login")) {
                request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
            }
            else if (action.equals("reqLogin")) {
                request.getRequestDispatcher("WEB-INF/reqLogin.jsp").forward(request, response);
            }
            else if (action.equals("inscription")) {
                request.getRequestDispatcher("WEB-INF/inscription.jsp").forward(request, response);
            }
            else if (action.equals("reqInscription")) {
                request.getRequestDispatcher("WEB-INF/reqInscription.jsp").forward(request, response);
            }
            else if (action.equals("MotDePassePerdu")) {
                request.getRequestDispatcher("WEB-INF/motDePassePerdu.jsp").forward(request, response);
            }
            else if (action.equals("reqMotDePassePerdu")) {
                request.getRequestDispatcher("WEB-INF/reqMdpPerdu.jsp").forward(request, response);
            }
            else if (action.equals("PseudoPerdu")) {
                request.getRequestDispatcher("WEB-INF/pseudoPerdu.jsp").forward(request, response);
            }
            else if (action.equals("reqPseudoPerdu")) {
                request.getRequestDispatcher("WEB-INF/reqPseudoPerdu.jsp").forward(request, response);
            }
            else if (action.equals("ajax_pseudo")) {
                request.getRequestDispatcher("WEB-INF/ajax_pseudo.jsp").forward(request, response);
            }
            else if (action.equals("ajax_motDePasse")) {
                request.getRequestDispatcher("WEB-INF/ajax_motDePasse.jsp").forward(request, response);
            }
            else if (action.equals("pbAdminMode")) {
                request.getRequestDispatcher("WEB-INF/login.jsp?message=pbAdminMode").forward(request, response);
            }
            else { 
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
        // user connecté et admin
        else if(maSession.isModeExpert()){
            com.persistence.User user = maSession.getUser();
            if(action.equals("aRef"))
            {
                request.getRequestDispatcher("WEB-INF/a_reference.jsp").forward(request, response);
            }            
            else if(action.equals("aRef_null"))
            {
                request.getRequestDispatcher("WEB-INF/a_reference_null.jsp").forward(request, response);
            }
            else if(action.equals("aRefAdd"))
            {
                request.getRequestDispatcher("WEB-INF/a_val_ref.jsp").forward(request, response);
            }
            else if(action.equals("aRefDel"))
            {
                request.getRequestDispatcher("WEB-INF/a_del_ref.jsp").forward(request, response);
            }
            else if(action.equals("aRefMsgVal"))
            {
                request.getRequestDispatcher("WEB-INF/a_ref_msg.jsp").forward(request, response);
            }
            else if(action.equals("aRefMsgDel"))
            {
                request.getRequestDispatcher("WEB-INF/a_ref_msg_del.jsp").forward(request, response);
            }
            else if(action.equals("aVal"))
            {
                request.getRequestDispatcher("WEB-INF/a_valider.jsp").forward(request, response);
            }
            else if(action.equals("aVal_null"))
            {
                request.getRequestDispatcher("WEB-INF/a_valider_null.jsp").forward(request, response);
            }
            else if(action.equals("validerSupernova"))
            {
                request.getRequestDispatcher("WEB-INF/a_req_valider.jsp").forward(request, response);
            }
            else if(action.equals("validerSupernova_confirme"))
            {
                request.getRequestDispatcher("WEB-INF/a_req_valider_confirme.jsp").forward(request, response);
            }
            else if(action.equals("refuserSupernova"))
            {
                request.getRequestDispatcher("WEB-INF/a_req_refuser.jsp").forward(request, response);
            }
            else if(action.equals("refuserSupernova_confirme"))
            {
                request.getRequestDispatcher("WEB-INF/a_req_refuser_confirme.jsp").forward(request, response);
            }
            else if(action.equals("aGestion"))
            {
                request.getRequestDispatcher("WEB-INF/a_gestion.jsp").forward(request, response);
            }            
            else if(action.equals("aCompte"))
            {
                request.getRequestDispatcher("WEB-INF/a_compte.jsp").forward(request, response);
            }            
            else if(action.equals("aActu"))
            {
                request.getRequestDispatcher("WEB-INF/a_actu.jsp").forward(request, response);
            }
            else if(action.equals("addActu"))
            {
                request.getRequestDispatcher("WEB-INF/a_add_actu.jsp").forward(request, response);
            }
            else if(action.equals("modActu"))
            {
                request.getRequestDispatcher("WEB-INF/a_mod_actu.jsp").forward(request, response);
            }
            else if(action.equals("reqModActu"))
            {
                request.getRequestDispatcher("WEB-INF/a_req_mod_actu.jsp").forward(request, response);
            }
            else if(action.equals("delActu"))
            {
                request.getRequestDispatcher("WEB-INF/a_del_actu.jsp").forward(request, response);
            }
            else if(action.equals("reqDelActu"))
            {
                request.getRequestDispatcher("WEB-INF/a_req_del_actu.jsp").forward(request, response);
            }
            else if (action.equals("gestioncompte"))
            {
                request.getRequestDispatcher("WEB-INF/a_gestion_compte.jsp").forward(request, response);
            }
            else if (action.equals("aGestionRecherche"))
            {
                request.getRequestDispatcher("WEB-INF/a_gestion_recherche.jsp").forward(request, response);
            }
            else if (action.equals("aGestionRechercheFail"))
            {
                request.getRequestDispatcher("WEB-INF/a_gestion.jsp?erreur=recherchefail").forward(request, response);
            }
            else if (action.equals("gestionhistorique"))
            {
                request.getRequestDispatcher("WEB-INF/a_gestion_historique.jsp").forward(request, response);
            }
            else if (action.equals("gestioncontact"))
            {
                request.getRequestDispatcher("WEB-INF/a_gestion_contact.jsp").forward(request, response);
            }
            else if (action.equals("blacklist"))
            {
                request.getRequestDispatcher("WEB-INF/a_blacklist.jsp").forward(request, response);
            }
            else if (action.equals("changergrade"))
            {
                request.getRequestDispatcher("WEB-INF/a_mod_grade.jsp").forward(request, response);
            }
            else if (action.equals("decoadmin"))
            {
                maSession.setModeExpert(false);
                request.getRequestDispatcher("compte.jsp").forward(request, response);
            }
            else if (action.equals("msg"))
            {
                request.getRequestDispatcher("WEB-INF/a_msg.jsp").forward(request, response);
            }
            else{
                request.getRequestDispatcher("WEB-INF/a_compte.jsp").forward(request, response);
            }
        }
        else {
            com.persistence.User user = maSession.getUser();
            // Dmd de changement de profil
            if (action.equals("changerProfil")) {
                request.getRequestDispatcher("WEB-INF/changerProfil.jsp").forward(request, response);
            }
            else if (action.equals("reqMajProfil")) {
                request.getRequestDispatcher("WEB-INF/reqMajProfil.jsp").forward(request, response);
            }
            else if (action.equals("infoUser")) {
                request.getRequestDispatcher("WEB-INF/infoUser.jsp").forward(request, response);
            }
            else if (action.equals("contact")) {
                request.getRequestDispatcher("WEB-INF/contact.jsp").forward(request, response);
            } 
            else if (action.equals("reqContact")) {
                request.getRequestDispatcher("WEB-INF/reqContact.jsp").forward(request, response);
            } 
            else if (action.equals("reqAdmin")) {
                if (user.getGrade()==5) {
                    maSession.setModeExpert(true);
                    request.getRequestDispatcher("WEB-INF/a_compte.jsp").forward(request, response);
                }
                else {request.getRequestDispatcher("compte.jsp").forward(request, response);}
            }
            else if (action.equals("reqAddReference")) {
                request.getRequestDispatcher("WEB-INF/reqReference.jsp").forward(request, response);
            }
            else if (action.equals("pbAdminMode")) {
                request.getRequestDispatcher("WEB-INF/infoUser.jsp?message=pbAdminMode").forward(request, response);
            }
            else if (action.equals("deconnexion")) { 
                session.invalidate();   // fermeture de la session en cours
                request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
            }
            else if (action.equals("ajax_candidate")) {
                request.getRequestDispatcher("WEB-INF/ajax_candidate.jsp").forward(request, response);
            }
            else if (action.equals("ajax_lastImg")) {
                request.getRequestDispatcher("WEB-INF/ajax_lastImg.jsp").forward(request, response);
            }
            else { 
                session.invalidate();   // fermeture de la session en cours
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
    }
%>

