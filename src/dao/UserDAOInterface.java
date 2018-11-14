package dao;

import model.User;
import model.VerificationTokenEntity;

import java.util.ArrayList;

/**
 * @author tsamo
 */
public interface UserDAOInterface {
    void insertUser(User u);
    ArrayList<User> getAllUsers();
    User findUserByEmail(String email);
    boolean userExists(String email);
    void createVerificationToken(User user, String token);
    User getUser(String verificationToken);
    void saveRegisteredUser(User user);
    VerificationTokenEntity getVerificationToken(String VerificationToken);
}