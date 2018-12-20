package controller;

import dao.ServiceDAOInterface;
import dao.UserDAOInterface;
import model.RegisterEntity;
import model.ServiceEntity;
import model.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import validation.EditFormValids;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/prof")
public class ProfessionalController {

    @Autowired
    ServiceDAOInterface serviceDAO;

    @Autowired
    UserDAOInterface userDAO;

    @Autowired
    private EditFormValids editFormValids;

    @RequestMapping("/services.htm")
    public String services(ModelMap map, HttpSession session){
        RegisterEntity user = (RegisterEntity) session.getAttribute("user");
        List<ServiceEntity> services = serviceDAO.getServicesForProf(user);
        for (ServiceEntity service: services) service.setOtherUser(userDAO.getUserById(service.getCustomerId()));
        map.addAttribute("services", services);
        map.addAttribute("message", "My Services");
        return "sessions";
    }

    @RequestMapping("/closedServices.htm")
    public String activeServices(ModelMap map, HttpSession session){
        RegisterEntity user = (RegisterEntity) session.getAttribute("user");
        List<ServiceEntity> services = serviceDAO.getSubServicesForProf(user, true);
        for (ServiceEntity service: services) service.setOtherUser(userDAO.getUserById(service.getCustomerId()));
        map.addAttribute("services", services);
        map.addAttribute("message", "Active Services");
        return "sessions";
    }

    @RequestMapping("/activeServices.htm")
    public String closedServices(ModelMap map, HttpSession session){
        RegisterEntity user = (RegisterEntity) session.getAttribute("user");
        List<ServiceEntity> services = serviceDAO.getSubServicesForProf(user, false);
        for (ServiceEntity service: services) service.setOtherUser(userDAO.getUserById(service.getCustomerId()));
        map.addAttribute("services", services);
        map.addAttribute("message", "Closed Services");
        return "sessions";
    }

    @RequestMapping("/logout.htm")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/home/initialForm.htm";
    }

    @RequestMapping(value = "/account.htm")
    public String account(ModelMap model, HttpSession session) {
        RegisterEntity userInSession = new RegisterEntity((RegisterEntity) session.getAttribute("user"));

        if (userInSession.getUserEntity().getProfessionId() == 1)
            return "redirect:/home/initialForm.htm";
        else{
            model.addAttribute("userInSession", userInSession);
            model.addAttribute("userInFormPassword", new UserEntity());
            long rating = serviceDAO.getRating(userInSession);
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
            RegisterEntity originalEntity = userDAO.getUserByEmail(sessionEntity.getUserEntity().getEmail());
            RegisterEntity updatedEntity = userDAO.editUser(originalEntity, updatedUser);
            session.setAttribute("user", updatedEntity);
            model.addAttribute("userInSession", updatedEntity);
            model.addAttribute("message", "Profile updated successfully");
        }
        return "profileProfessional";
    }

    @RequestMapping(value = "/servicesession.htm")
    public String serviceSession(@RequestParam("sessionId") int sessionId, ModelMap map ) {
        ServiceEntity service = serviceDAO.getServiceById(sessionId);
        service.setOtherUser(userDAO.getUserById(service.getCustomerId()));
        map.addAttribute("service", service);
        return "serviceSession";
    }

}
