package controller;

import dao.UserDAOInterface;
import dao.VerificationTokenDAOInterface;
import model.UserEntity;
import org.apache.commons.mail.EmailException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import utils.MailService;

/**
 * @author tsamo
 */

@Controller
@RequestMapping(value = "/verification")
public class VerificationController {

    @Autowired
    private VerificationTokenDAOInterface v;

    @Autowired
    private UserDAOInterface u;

    private MailService mailService = new MailService();

    @RequestMapping(value = "/token/{token}")
    public String handleForm(@PathVariable String token) {
        if (v.checkIfTokenExists(token) && v.checkIfTimeLessThan24Hours(v.getTimestampOfTokenCreation(token))) {
            UserEntity user = v.getUserFromToken(v.getTokenEntityFromToken(token));
            u.enableUser(user);
            v.removeTokenByUserId(user.getId());
            return "verificationSuccess";
        } else if (v.checkIfTokenExists(token) && !v.checkIfTimeLessThan24Hours(v.getTimestampOfTokenCreation(token))) {
            return "tokenExpired";
        } else {
            return "tokenDoesNotExist";
        }
    }

    @RequestMapping(value = "/newActivationLink.htm")
    public String handleForm2(ModelMap modelMap) {
        modelMap.addAttribute("user", new UserEntity());
        return "newActivationLink";
    }

    @RequestMapping(value = "/sendNewLink.htm")
    public String handleForm3(ModelMap model, UserEntity user) throws EmailException {
        String emailSubmitted = user.getEmail();
        if (u.userExists(emailSubmitted) && !u.isUserActivated(emailSubmitted)) {
            int uid = u.findUserByEmail(emailSubmitted).getId();
            v.createTokenForUser(uid);
            String token = v.getTokenOfUser(uid);
            model.addAttribute("userEmail", emailSubmitted);
            mailService.sendMail(emailSubmitted, "Activation", "http://localhost:8080/verification/token/" + token + ".htm");
            return "newActivationLinkSent";
        } else if (u.userExists(emailSubmitted)&& u.isUserActivated(emailSubmitted)) {
            model.addAttribute("registeredEmail", emailSubmitted);
            return "userAlreadyActivated";
        } else {
            model.addAttribute("userEmail", emailSubmitted);
            return "userDoesNotExist";
        }
    }
}
