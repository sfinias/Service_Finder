package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import dao.UserDAOInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

/**
 * @author tsamo
 */
@RestController
public class SpringRest {

    @Autowired
    UserDAOInterface userDAOInterface;

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
}