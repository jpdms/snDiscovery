/*
    Document    : SmtpSend
    Description : envoi d'un mail par gmail, par le protocole IMAP
    Created on  : 7 Juin 2014, 13:49:42
    Author      : TS IRIS Colomiers
*/

package com.metier;

import java.util.Properties;
import java.util.Date;
import javax.mail.*;
import javax.mail.internet.*;
import com.sun.mail.smtp.*;

public class SmtpSend {
    // Test de la méthode sendMessage()
    public static void main(String[] argv) {
        SmtpSend.sendMessage("test", "Envoi d'un contenu", "discovery.ccf1@gmail.com");
    }
    
    public static boolean sendMessage(String subject, String text, String to) { 
	boolean debug = false;
	String cc = null, bcc = null;
	/*
        String mailhost = "smtp.irap.omp.eu";
        String prot = "smtp";
        boolean auth  = true;
        */
        String mailhost = "smtp.gmail.com";
	String prot = "smtps";
	boolean auth  = true;             // gmail demande une identification
        // près l'ouverture d'un compte chez gmail.com il faut débloquer dans
        // les paramètres le protocole IMAP.
	String mailer = "smtpsend";
        String user = "sndiscovery";
        String password = "sndiscovery1234";

	try {
	    // Initialise la Session JavaMail .
	    Properties props = System.getProperties();
	    props.put("mail.smtps.host", mailhost);
	    if (auth)                      // Nécessaire avec gmail
		props.put("mail.smtps.auth", "true");
	    // Obtient un objet session
	    Session session = Session.getInstance(props, null);
	    if (debug)
		session.setDebug(true);
	    // Construit le message et l'envoi
	    Message msg = new MimeMessage(session);
	    msg.setFrom(new InternetAddress("sndiscovery@irap.omp.eu"));
	    msg.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(to, false));
	    if (cc != null)
		msg.setRecipients(Message.RecipientType.CC,
					InternetAddress.parse(cc, false));
	    if (bcc != null)
		msg.setRecipients(Message.RecipientType.BCC,
					InternetAddress.parse(bcc, false));
	    msg.setSubject(subject);
            // Si le charset est connu, utiliser setText(text, charset)
            msg.setText(text);
	    msg.setHeader("X-Mailer", mailer);
	    msg.setSentDate(new Date());

	    /* La méthode simple pour envoyer est : Transport.send(msg);
             * Mais on va utiliser des éléments spécifiques au SMTP, nous
             * devons donc gérer l'objet transport explicitement.
	     */
	    SMTPTransport t = (SMTPTransport)session.getTransport(prot);
	    try {
		if (auth)           // identification nécessaire pour gmail
		    t.connect(mailhost, user, password);
		else
		    t.connect();
		t.sendMessage(msg, msg.getAllRecipients());
	    } finally {
		t.close();
	    }
	    // System.out.println("\nMail transmit correctement.");
	} catch (Exception e) {
	    System.out.println("Erreur de transmission : " + e);
            return false;
	}
        return true;
    }
}
