package controller;

import dao.UserDAOInterface;
import dao.VerificationTokenDAOInterface;
import model.User;
import model.UserEntity;
import model.VerificationTokenEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import java.util.Calendar;
import java.util.Locale;

/**
 * @author tsamo
 */
@Controller
public class RegistrationController {

    @Autowired
    private VerificationTokenDAOInterface verificationTokenDAOInterface;

    @Qualifier("webApplicationContext")
    @Autowired
    private MessageSource messages;

    @Autowired
    private UserDAOInterface userDAOInterface;

    @RequestMapping(value = "/regitrationConfirm", method = RequestMethod.GET)
    public String confirmRegistration
            (WebRequest request, Model model, @RequestParam("token") String token) {

        Locale locale = request.getLocale();

        VerificationTokenEntity verificationToken = verificationTokenDAOInterface.findByToken(token);
        if (verificationToken == null) {
            String message = messages.getMessage("auth.message.invalidToken", null, locale);
            model.addAttribute("message", message);
            return "redirect:/badUser.html?lang=" + locale.getLanguage();
        }

        UserEntity user = verificationToken.getUserByUserEmail();
        Calendar cal = Calendar.getInstance();
        if ((verificationToken.getExpiryDate().getTime() - cal.getTime().getTime()) <= 0) {
            String messageValue = messages.getMessage("auth.message.expired", null, locale);
            model.addAttribute("message", messageValue);
            return "redirect:/badUser.jsp?lang=" + locale.getLanguage();
        }

        user.setEnabled(true);
        userDAOInterface.insertUser(user);
        return "redirect:/loggedIn.jsp?lang=" + request.getLocale().getLanguage();
    }
}
