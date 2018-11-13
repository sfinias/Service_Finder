package controller;

import dao.UserDAOInterface;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.io.InputStream;


/**
 * @author tsamo
 */

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserDAOInterface userDAOInterface;

//    @Autowired
//    ServletContext context;

    @RequestMapping(value = "/initialForm.htm")
    public String handleForm2(ModelMap modelMap) {
        modelMap.addAttribute("user", new User());
        modelMap.addAttribute("user2", new User());
        return "initialForm";
    }

    @RequestMapping(value = "/checkLogin.htm")
    public String handleForm3(ModelMap model, User user) {
        String emailSubmitted = user.getEmail();
        String passwordSubmitted = user.getPass();
        if (!userDAOInterface.userExists(emailSubmitted)) {
            model.addAttribute("userEmail", emailSubmitted);
            return "userDoesNotExist";
        } else if (userDAOInterface.userExists(emailSubmitted) && !userDAOInterface.findUserByEmail(emailSubmitted).getPass().equals(passwordSubmitted)) {
            model.addAttribute("userEmail", emailSubmitted);
            return "wrongPassword";
        } else {
            model.addAttribute("userEmail", emailSubmitted);
            return "loggedIn";
        }
    }

    @RequestMapping(value = "/checkRegister.htm", method = RequestMethod.POST, consumes = {MediaType.ALL_VALUE})
    public String handleForm4(ModelMap model, @ModelAttribute @Validated User user2) throws IOException {
        if (userDAOInterface.userExists(user2.getEmail())) {
            model.addAttribute("alreadyUser", user2.getEmail());
            return "userAlreadyExists";
        } else {
            byte[] photo = user2.getFile().getBytes();
            user2.setPhoto(photo);
            userDAOInterface.insertUser(user2);
            model.addAttribute("registeredEmail", user2.getEmail());
            return "registrationSuccess";
        }
    }
}