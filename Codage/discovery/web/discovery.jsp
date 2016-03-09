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
        // user connecté
        else if(maSession.isModeExpert()){
            com.persistence.User user = maSession.getUser();
            request.getRequestDispatcher("a_compte.jsp").forward(request, response);
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
                    request.getRequestDispatcher("a_compte.jsp").forward(request, response);
                }
                else {request.getRequestDispatcher("compte.jsp").forward(request, response);}
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
            else { 
                session.invalidate();   // fermeture de la session en cours
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
    }
%>

