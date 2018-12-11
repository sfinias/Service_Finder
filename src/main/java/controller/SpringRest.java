package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import dao.ProfessionsDAOInterface;
import dao.UserDAOInterface;
import model.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * @author tsamo
 */
@RestController
public class SpringRest {

    @Autowired
    UserDAOInterface userDAOInterface;

    @Autowired
    ProfessionsDAOInterface professionsDAOInterface;

    @RequestMapping(value = "/usersREST.htm", method = RequestMethod.GET, headers = "Accept=*/*", produces = "applcation/json")
    public @ResponseBody
    String getAllUsersByRest() {
        ArrayList<String> emails = userDAOInterface.getAllEmails();
        ObjectMapper mapper = new ObjectMapper();
        String emailsJSON = null;
        try {
            emailsJSON = mapper.writeValueAsString(emails);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return emailsJSON;
    }

    @RequestMapping(value = "/profsREST.htm", method = RequestMethod.GET, headers = "Accept=*/*", produces = "application/json")
    public @ResponseBody String getProfsByRest(int id) {
        List<UserEntity> profs = professionsDAOInterface.getProfessionals(id);
        ObjectMapper mapper = new ObjectMapper();
        String profsJSON = null;
        try {
            profsJSON = mapper.writeValueAsString(profs);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return profsJSON;
    }
}