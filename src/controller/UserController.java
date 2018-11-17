package controller;

import dao.UserDAOInterface;

import dao.VerificationTokenDAOInterface;
import model.RegisterEntity;
import model.UserEntity;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import utils.MailService;


import java.io.IOException;


/**
 * @author tsamo
 */

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserDAOInterface userDAOInterface;

    @Autowired
    private VerificationTokenDAOInterface v;

    private MailService mailService=new MailService();

    @RequestMapping(value = "/initialForm.htm")
    public String handleForm2(ModelMap modelMap) {
        modelMap.addAttribute("user", new UserEntity());
        modelMap.addAttribute("user2", new RegisterEntity());
        return "initialForm";
    }

    @RequestMapping(value = "/checkLogin.htm")
    public String handleForm3(ModelMap model, UserEntity user) {
        String emailSubmitted = user.getEmail();
        String password = user.getPasswordConfirm();
        if (!userDAOInterface.userExists(emailSubmitted)) {
            model.addAttribute("userEmail", emailSubmitted);
            return "userDoesNotExist";
        } else if (userDAOInterface.userExists(emailSubmitted) && !userDAOInterface.findUserByEmail(emailSubmitted).getPasswordHash().equals(DigestUtils.sha512Hex(password+userDAOInterface.getSalt(emailSubmitted)))) {
            model.addAttribute("userEmail", emailSubmitted);
            return "wrongPassword";
        } else {
            model.addAttribute("userEmail", emailSubmitted);
            return "loggedIn";
        }
    }

    @RequestMapping(value = "/checkRegister.htm", method = RequestMethod.POST, consumes = {MediaType.ALL_VALUE})
    public String handleForm4(ModelMap model, @ModelAttribute @Validated RegisterEntity user2) throws IOException {
        if (userDAOInterface.userExists(user2.getUserEntity().getEmail())) {
            model.addAttribute("alreadyUser", user2.getUserEntity().getEmail());
            return "userAlreadyExists";
        } else {
            userDAOInterface.insertUser(user2.getUserEntity());
            int uid=userDAOInterface.getUserid(user2.getUserEntity());
            userDAOInterface.insertAddress(user2.getAddressEntity(),uid);
            userDAOInterface.insertPhone(user2.getPhoneEntity(),uid);
            v.createTokenForUser(uid);
            String token=v.getTokenOfUser(uid);
            model.addAttribute("registeredEmail", user2.getUserEntity().getEmail());
            mailService.sendMail(user2.getUserEntity().getEmail(),"Activation","http://localhost:8080/verification/token/"+token+".htm");
            return "registrationSuccess";
        }
    }
}