package controller;

import dao.ProfessionsDAOInterface;
import dao.UserDAOInterface;
import dao.VerificationTokenDAOInterface;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.RegisterEntity;
import model.UserEntity;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import utils.MailService;
import validation.FormValids;

import javax.validation.Valid;
import model.ProfessionsEntity;

/**
 * @author tsamo
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private ProfessionsDAOInterface p;

    @Autowired
    ServletContext servletContext;

    @Autowired
    private UserDAOInterface u;

    @Autowired
    private VerificationTokenDAOInterface v;

    @Autowired
    private FormValids formValids;

    private MailService mailService = new MailService();

    @RequestMapping(value = "/initialForm.htm")
    public String fillInitialForm(ModelMap modelMap) {
        modelMap.addAttribute("user", new UserEntity());
        modelMap.addAttribute("user2", new RegisterEntity());
        return "initialForm";
    }

    @RequestMapping(value = "/checkLogin.htm")
    public String checksBeforeLoign(ModelMap model, UserEntity user, HttpSession session) {
        String emailSubmitted = user.getEmail();
        String password = user.getPasswordConfirm();
        if (!u.userExists(emailSubmitted)) {
            model.addAttribute("userEmail", emailSubmitted);
            return "userDoesNotExist";
        } else {
            if (!u.findUserByEmail(emailSubmitted).getPasswordHash().equals(DigestUtils.sha512Hex(password + u.getSalt(emailSubmitted)))) {
                model.addAttribute("userEmail", emailSubmitted);
                return "wrongPassword";
            } else {
                if (!u.isUserActivated(emailSubmitted)) {
                    model.addAttribute("userEmail", emailSubmitted);
                    return "notActivated";
                } else {
//            boolean test= u.isUserActivated(emailSubmitted);
//            model.addAttribute("userEmail", emailSubmitted);
                    UserEntity userEntity = u.findUserByEmail(emailSubmitted);
                    session.setAttribute("user", userEntity);
                    if(userEntity.getProfessionId()==1) {
                        servletContext.setAttribute("allProfessions", p.getAllProfessions());
                        return "index";
                    }else{
                        return "homeProf";
                    }
                }
            }
        }
    }

    @RequestMapping(value = "/checkRegister.htm", method = RequestMethod.POST, consumes = {MediaType.ALL_VALUE})
    public String checksBeforeResgistration(ModelMap model, @ModelAttribute("user2") @Valid RegisterEntity user2, BindingResult bindingResult) {
        formValids.validate(user2, bindingResult);
        if (bindingResult.hasErrors()) {
            model.addAttribute("user", new UserEntity());
            model.addAttribute("user2", user2);
            return "initialForm";
        }
        if (u.userExists(user2.getUserEntity().getEmail())) {
            model.addAttribute("alreadyUser", user2.getUserEntity().getEmail());
            return "userAlreadyExists";
        } else {
            u.insertUser(user2.getUserEntity());
            int uid = u.getUserid(user2.getUserEntity());
            u.insertAddress(user2.getAddressEntity(), uid);
            u.insertPhone(user2.getPhoneEntity(), uid);
            v.createTokenForUser(uid);
            String token = v.getTokenOfUser(uid);
            model.addAttribute("registeredEmail", user2.getUserEntity().getEmail());
            mailService.sendMail(user2.getUserEntity().getEmail(), "Activation", "http://localhost:8080/verification/token/" + token + ".htm");
            return "registrationSuccess";
        }
    }

    @RequestMapping(value = "/forgotPassword.htm", method = RequestMethod.GET)
    public String forgotPassword(ModelMap modelMap) {
        UserEntity user = new UserEntity();
        modelMap.addAttribute("user", user);
        return "forgotPassword";
    }

    @RequestMapping(value = "/resetPassword.htm")
    public String handleForm10(ModelMap modelMap, UserEntity user) {
        String emailSubmitted = user.getEmail();
        if (!u.userExists(emailSubmitted)) {
            modelMap.addAttribute("userEmail", emailSubmitted);
            return "userDoesNotExist";
        } else {
            int uid = u.findUserByEmail(emailSubmitted).getId();
            v.createTokenForUser(uid);
            String token = v.getTokenOfUser(uid);
            String subject = "Reset Password";
            //Το όνομα του site πρέπει να μπει χειροκίνητα. Δεν υπάρχεις τρόπος να το βάλουμε να το παίρνει δυναμικά.
            String text = "You have have asked for a password reset for the e-mail:" + emailSubmitted + ". \n"
                    + "To reset your password, please follow the following link. http://localhost:8080/user/resetPasssword/" + token + ".htm \n\n"
                    + "With regards, \n"
                    + "The Awesome Inc. Team";
            mailService.sendMail(emailSubmitted, subject, text);
            modelMap.addAttribute("userEmail", emailSubmitted);
            return "resetEmailSent";
        }
    }

    @RequestMapping(value = "/resetPasssword/{token}")
    public String handleForm(@PathVariable String token, ModelMap modelMap) {
        if (v.checkIfTokenExists(token) && v.checkIfTimeLessThan24Hours(v.getTimestampOfTokenCreation(token))) {
            UserEntity user = v.getUserFromToken(v.getTokenEntityFromToken(token));
            modelMap.addAttribute("user", user);
            v.removeTokenByUserId(user.getId());
            return "resetPasswordForm";
        } else if (v.checkIfTokenExists(token) && !v.checkIfTimeLessThan24Hours(v.getTimestampOfTokenCreation(token))) {
            return "tokenExpired";
        } else {
            return "tokenDoesNotExist";
        }
    }

    @RequestMapping(value = "/changePassword.htm")
    public String handleForm2(ModelMap model, UserEntity user) {
        String emailSubmitted = user.getEmail();
        String newPassword = user.getPasswordConfirm();
        if (!u.userExists(emailSubmitted)) {
            model.addAttribute("userEmail", emailSubmitted);
            return "userDoesNotExist";
        } else if (u.userExists(emailSubmitted) && !u.isUserActivated(emailSubmitted)) {
            model.addAttribute("userEmail", emailSubmitted);
            return "notActivated";
        } else {
            u.changePasswordOfUser(emailSubmitted, newPassword);
            model.addAttribute("userEmail", emailSubmitted);
            return "resetSuccess";
        }

    }

    @RequestMapping(value = "/account.htm")
    public String account(ModelMap model, UserEntity user) {
        model.addAttribute("user", user);
        return "profile";
    }
    
    @RequestMapping(value = "/search.htm")
    public String Search(ModelMap model, UserEntity user) {
        model.addAttribute("user", user);
        return "loggedin";
    }
}
