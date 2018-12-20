package dao;

import model.AddressEntity;
import model.PhoneEntity;
import model.RegisterEntity;
import model.UserEntity;

import java.io.IOException;
import java.util.ArrayList;
import org.springframework.web.multipart.MultipartFile;


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
    boolean userExistsId(int userID);
    void enableUser(UserEntity u);
    int getUserid(UserEntity u);
    String getSalt(String email);
    boolean isUserActivated(String email);
    void changePasswordOfUser(String email, String newPassword);
    RegisterEntity getUserByID (int userID);
    RegisterEntity getUserByEmail(String email);
    RegisterEntity editUser(RegisterEntity editUser , RegisterEntity user);
    boolean uploadPhoto(MultipartFile file, RegisterEntity user) throws IOException;
    RegisterEntity getUserById(int id);
}