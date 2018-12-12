package dao;

import model.AddressEntity;
import model.PhoneEntity;
import model.UserEntity;

import java.util.ArrayList;
import model.RegisterEntity;

/**
 * @author tsamo
 */
public interface UserDAOInterface {
    ArrayList<String> getAllEmails();
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
    public RegisterEntity getUserByEmail(String email);
}