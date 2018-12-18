package utils;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.simplejavamail.email.Email;
import org.simplejavamail.email.EmailBuilder;
import org.simplejavamail.mailer.MailerBuilder;

/**
 * @author tsamo
 */
public class MailService {
    public void sendMail(String receiverMail, String subject, String text) {
        Email email = EmailBuilder.startingBlank()
                .from("Awesome Inc.", "throwawayTsamo@hotmail.com")
                .to(receiverMail)
                .withSubject(subject)
                .withPlainText(text)
                .buildEmail();

        MailerBuilder
                .withSMTPServer("smtp-mail.outlook.com", 587, "throwawayTsamo@hotmail.com", "1234567890!@#$%^&*()")
                .buildMailer()
                .sendMail(email);
    }

//    public void sendMail(String receiverMail, String subject, String text) throws EmailException {
//        SimpleEmail email = new SimpleEmail();
//        email.setHostName("smtp-mail.outlook.com");
//        email.setSmtpPort(587);
//        email.setAuthenticator(new DefaultAuthenticator("throwawayTsamo@hotmail.com", "1234567890!@#$%^&*()"));
////        email.setSSLOnConnect(true);
//        email.setFrom("throwawayTsamo@hotmail.com");
//        email.setSubject(subject);
//        email.setMsg("text");
//        email.addTo(receiverMail);
//        email.send();
//    }
}
