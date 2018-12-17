package controller;

import dao.ProfessionsDAOInterface;
import dao.UserDAOInterface;
import dao.VerificationTokenDAOInterface;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import model.RegisterEntity;
import model.UserEntity;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.FilenameUtils;
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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import validation.EditFormValids;
import validation.PasswordFormValids;

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

    @Autowired
    private EditFormValids editFormValids;

    @Autowired
    private PasswordFormValids passwordFormValids;

    private MailService mailService = new MailService();

    @RequestMapping(value = "/account.htm")
    public String account(ModelMap model, HttpSession session) {
        RegisterEntity userInSession = new RegisterEntity((RegisterEntity) session.getAttribute("user"));
        model.addAttribute("userInSession", userInSession);
        model.addAttribute("userInFormPassword", new UserEntity());
        return "profile";
    }

    @RequestMapping(value = "/edited.htm", method = RequestMethod.POST, consumes = {MediaType.ALL_VALUE})
    public String profileUpdate(ModelMap model, @ModelAttribute("userInSession") @Valid RegisterEntity updatedUser, BindingResult bindingResult,
            HttpSession session) {
        editFormValids.validate(updatedUser, bindingResult);
        if (bindingResult.hasErrors()) {
            model.addAttribute("userInSession", updatedUser);
            model.addAttribute("message", "Update was not successful");
        } else {
            RegisterEntity sessionEntity = (RegisterEntity) session.getAttribute("user");
            RegisterEntity originalEntity = u.getUserByEmail(sessionEntity.getUserEntity().getEmail());
            RegisterEntity updatedEntity = u.editUser(originalEntity, updatedUser);
            session.setAttribute("user", updatedEntity);
            model.addAttribute("userInSession", updatedEntity);
            model.addAttribute("message", "Profile updated successfully");
        }
        return "profile";
    }

    @RequestMapping(value = "/pass.htm", method = RequestMethod.POST, consumes = {MediaType.ALL_VALUE})
    public String passwordUpdate(ModelMap model, @ModelAttribute("userInForm") @Valid UserEntity userInFormPassword, BindingResult bindingResult,
            HttpSession session) {
        passwordFormValids.validate(userInFormPassword, bindingResult);
        RegisterEntity userInSession =(RegisterEntity) session.getAttribute("user");
        if (bindingResult.hasErrors()) {
            model.addAttribute("userInSession", userInFormPassword);
            model.addAttribute("message", "Could not update password");
            return "profile";
        } else {                   
            u.changePasswordOfUser(userInSession.getUserEntity().getEmail() , userInFormPassword.getPasswordHash());
            model.addAttribute("userInSession", userInSession);
            model.addAttribute("message", "Password updated successfully");
        }
        return "profile";
    }

    @RequestMapping(value = "/search.htm")
    public String Search() {
        return "testSearch";
    }

    @RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
    public ResponseEntity<String> fileUpload(@RequestParam("uploaded") MultipartFile file, HttpSession session)
            throws IOException {
        RegisterEntity user = (RegisterEntity)session.getAttribute("user");
        if (u.uploadPhoto(file, user)){
            session.setAttribute("user", user);
            return new ResponseEntity<>("File Uploaded Successfully.", HttpStatus.OK);
        }else return new ResponseEntity<>("Invalid file.", HttpStatus.BAD_REQUEST);
//        String extension = FilenameUtils.getExtension(file.getOriginalFilename());
//        int idForFilename = user.getUserEntity().getId();
//        String newFilename = String.valueOf(idForFilename);
//        File previousFileToDeleteJPG = new File("/Users/matina/apache-tomcat-8.0.53/webapps/images/"+user.getUserEntity().getId()+".jpg");
//        File previousFileToDeletePNG = new File("/Users/matina/apache-tomcat-8.0.53/webapps/images/"+user.getUserEntity().getId()+".png");
//
//        // Save file on system
//        if (!file.getOriginalFilename().isEmpty()) {
//            BufferedOutputStream outputStream = new BufferedOutputStream(
//                    new FileOutputStream( new File("/Users/Nah/apache-tomcat-8.0.53/webapps/images", newFilename.concat("."+extension))));
//            user.getUserEntity().setProfilePicture(newFilename.concat("."+extension));
//            session.setAttribute("user", user);
//            outputStream.write(file.getBytes());
//            outputStream.flush();
//            outputStream.close();
//            previousFileToDeleteJPG.delete();
//            previousFileToDeletePNG.delete();
//            return new ResponseEntity<>("File Uploaded Successfully.", HttpStatus.OK);
//        } else {
//            return new ResponseEntity<>("Invalid file.", HttpStatus.BAD_REQUEST);
//        }
    }

    @RequestMapping("/logout.htm")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/home/initialForm.htm";
    }

    @RequestMapping(value="/viewselectedprof.htm",method=RequestMethod.GET)
    public String selected(ModelMap model, HttpSession session, @RequestParam(value = "email") String email) {
        RegisterEntity user = u.getUserByEmail(email);
        if (user.getUserEntity().getProfessionId() == 1)
            return "testSearch";
        else {
            model.addAttribute("selectedUser", user);
            return "viewSelectedUserInfo";
        }
    }

    @RequestMapping("/page.htm")
    public String selected(ModelMap model, HttpSession session){
        RegisterEntity selectedUser = new RegisterEntity((RegisterEntity)session.getAttribute("user"));
        model.addAttribute("selectedUser", selectedUser);
        return "viewSelectedUserInfo";
    }
    
    @RequestMapping(value="/viewselectedcategoryofprof.htm",method=RequestMethod.GET)
    public String viewselectedcategoryofprof(ModelMap model, @RequestParam(value = "categoryidofprof") int categoryidofprof){
        List<RegisterEntity> profs = p.getProfs(categoryidofprof);
        ProfessionsEntity thiscategory = p.getProfession(categoryidofprof);
        model.addAttribute("allprofswithsamecategoryid", profs);
        model.addAttribute("thiscategory", thiscategory);
        return "selectedcategoryofprof";
    }
    
}