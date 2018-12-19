package controller;

import dao.ServiceDAOInterface;
import dao.UserDAOInterface;
import java.util.ArrayList;
import model.RegisterEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import model.ServiceEntity;
import model.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
import validation.EditFormValids;

@Controller
@RequestMapping("/prof")
public class ProfessionalController {
    
    @Autowired
    private UserDAOInterface userDAOInterface;

    @Autowired
    private EditFormValids editFormValids;
    
    @Autowired
    ServiceDAOInterface serviceDAOInterface;

    @RequestMapping("/services.htm")
    public String services(ModelMap model, HttpSession session){
        RegisterEntity user = (RegisterEntity) session.getAttribute("user");
        ArrayList<ServiceEntity> sessionServices = (ArrayList<ServiceEntity>) serviceDAOInterface.getServicesForProf(user);
        model.addAttribute("user", user);
        model.addAttribute("sessionServices", sessionServices);
        return "profHome";
    }
    
    @RequestMapping(value = "/account.htm")
    public String account(ModelMap model, HttpSession session) {
        RegisterEntity userInSession = new RegisterEntity((RegisterEntity) session.getAttribute("user"));
        
        if (userInSession.getUserEntity().getProfessionId() == 1)
            return "redirect:/home/initialForm.htm";
        else{
            model.addAttribute("userInSession", userInSession);
            model.addAttribute("userInFormPassword", new UserEntity());
            long rating = serviceDAOInterface.getRating(userInSession);
            model.addAttribute("rating", rating);
            return "profileProfessional";
        }
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
            RegisterEntity originalEntity = userDAOInterface.getUserByEmail(sessionEntity.getUserEntity().getEmail());
            RegisterEntity updatedEntity = userDAOInterface.editUser(originalEntity, updatedUser);
            session.setAttribute("user", updatedEntity);
            model.addAttribute("userInSession", updatedEntity);
            model.addAttribute("message", "Profile updated successfully");
        }
        return "profileProfessional";
    }

    
    @RequestMapping(value = "/servicesession.htm")
    public String serviceSession() {
        return "serviceSession";
    }

    
}