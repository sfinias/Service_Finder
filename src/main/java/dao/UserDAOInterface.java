package dao;

import model.AddressEntity;
import model.PhoneEntity;
import model.RegisterEntity;
import model.UserEntity;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import model.RegisterEntity;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.Multipart;

/**
 * @author tsamo
 */
public interface UserDAOInterface {
    ArrayList<String> getAllEmails();
    boolean emailExists(String email);
    void insertUser(UserEntity u);
    void insertAddress(AddressEntity a, int userid);
    void insertPhone(PhoneEntity p, int userid);
    ArrayList<UserEntity> getAllUsers();
    UserEntity findUserByEmail(String email);
    boolean userExists(String email);
    void enableUser(UserEntity u);
    int getUserid(UserEntity u);
    String getSalt(String email);
    boolean isUserActivated(String email);
    void changePasswordOfUser(String email, String newPassword);
    RegisterEntity getUserByEmail(String email);
    RegisterEntity editUser(RegisterEntity editUser , RegisterEntity user);
}