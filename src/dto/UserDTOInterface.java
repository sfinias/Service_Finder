package dto;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author tsamo
 */
public interface UserDTOInterface {
    String getFirstName();
    String getLastName();
    String getEmail();
    String getPhone();
    String getAddress();
    String getPass();
    MultipartFile getFile();
    void setLastName(String lastName);
    void setFirstName(String firstName);
    void setEmail(String email);
    void setPhone(String phone);
    void setAddress(String address);
    void setPass(String pass);
    void setFile(MultipartFile file);
}
