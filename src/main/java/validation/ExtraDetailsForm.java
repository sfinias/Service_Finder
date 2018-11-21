/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validation;

import model.UserDetailsEntity;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author matina
 */
public class ExtraDetailsForm  implements Validator{

    @Override
    public boolean supports(Class<?> type) {
        return UserDetailsEntity.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        UserDetailsEntity u = (UserDetailsEntity) o;
        String patternDOB = "^[0-9]{4}([- /.])(((0[13578]|(10|12))\\1(0[1-9]|[1-2][0-9]|3[0-1]))|(02\\1(0[1-9]|[1-2][0-9]))|((0[469]|11)\\1(0[1-9]|[1-2][0-9]|30)))$";
        String patternPhoto = "([^\\s]+(\\.(?i)(jpg|png|gif|bmp))$)";
     //   String patternGender = "";
        if(!u.getDateOfBirth().toString().matches(patternDOB)){
            errors.rejectValue("date_of_birth", "date_of_birth.notvalid");
        }
        if(!u.getFile().getName().matches(patternPhoto)){
            errors.rejectValue("photo", "photo.notvalidfileextension");
        }
//        if(!u.getGender().matches(patternGender)){
//            errors.rejectValue("gender", "gender.notvalid");
//        }
    }
    
}
