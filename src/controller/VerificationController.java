package controller;

import dao.UserDAOInterface;
import dao.VerificationTokenDAOInterface;
import model.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @RequestMapping(value = "/token/{token}")
    public String handleForm(ModelMap modelMap, @PathVariable String token) {
        if (v.checkIfTokenExists(token) && v.checkIfTimeLessThan24Hours(v.getTimestampOfTokenCreation(token))) {
            UserEntity user = v.getUserFromToken(v.getTokenEntityFromToken(token));
            u.enableUser(user);
            return "verificationSuccess";
        } else if (v.checkIfTokenExists(token) && !v.checkIfTimeLessThan24Hours(v.getTimestampOfTokenCreation(token))){
            return "tokenExpired";
        }else{
            return "tokenDoesNotExist";
        }
    }
}
