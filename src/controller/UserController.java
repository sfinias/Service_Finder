package controller;

import dao.UserDAOInterface;
import dto.UserDTO;
import model.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.validation.Valid;
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

//    @RequestMapping(value = "/initialForm.htm")
//    public String handleForm2(ModelMap modelMap) {
//        modelMap.addAttribute("user", new UserEntity());
//        modelMap.addAttribute("user2", new UserEntity());
//        return "initialForm";
//    }

//    @RequestMapping(value = "/checkLogin.htm")
//    public String handleForm3(ModelMap model, UserEntity user) {
//        String emailSubmitted = user.getEmail();
//        String passwordSubmitted = user.getPass();
//        if (!userDAOInterface.userExists(emailSubmitted)) {
//            model.addAttribute("userEmail", emailSubmitted);
//            return "userDoesNotExist";
//        } else if (userDAOInterface.userExists(emailSubmitted) && !userDAOInterface.findUserByEmail(emailSubmitted).getPass().equals(passwordSubmitted)) {
//            model.addAttribute("userEmail", emailSubmitted);
//            return "wrongPassword";
//        } else {
//            model.addAttribute("userEmail", emailSubmitted);
//            return "loggedIn";
//        }
//    }

//    @RequestMapping(value = "/checkRegister.htm", method = RequestMethod.POST, consumes = {MediaType.ALL_VALUE})
//    public String handleForm4(ModelMap model, @ModelAttribute @Validated UserEntity user2) throws IOException {
//        if (userDAOInterface.userExists(user2.getEmail())) {
//            model.addAttribute("alreadyUser", user2.getEmail());
//            return "userAlreadyExists";
//        } else {
//            byte[] photo = user2.getFile().getBytes();
//            user2.setPhoto(photo);
//            userDAOInterface.insertUser(user2);
//            model.addAttribute("registeredEmail", user2.getEmail());
//            return "registrationSuccess";
//        }
//    }

    @RequestMapping(value = "/initialForm.htm")
    public String handleForm2(WebRequest request, ModelMap modelMap) {
        modelMap.addAttribute("user", new UserDTO());
        modelMap.addAttribute("user2", new UserDTO());
        return "initialForm";
    }

    @RequestMapping(value = "/checkLogin.htm")
    public String handleForm3(ModelMap model, @Valid UserDTO user, WebRequest request) {
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
    public String handleForm4(ModelMap model, @Valid UserDTO user2) throws IOException {
        if (userDAOInterface.userExists(user2.getEmail())) {
            model.addAttribute("alreadyUser", user2.getEmail());
            return "userAlreadyExists";
        } else {
            UserEntity registered = createUserAccount(user2);
            model.addAttribute("registeredEmail", user2.getEmail());
            return "registrationSuccess";
        }
    }

    private UserEntity createUserAccount(UserDTO accountDto) throws IOException {
        UserEntity registered = null;
        registered = userDAOInterface.registerNewUserAccount(accountDto);

        return registered;
    }
}