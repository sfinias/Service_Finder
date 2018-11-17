package dao;

import model.UserEntity;

import java.util.ArrayList;

/**
 * @author tsamo
 */
public interface UserDAOInterface {
    void insertUser(UserEntity u);
    ArrayList<UserEntity> getAllUsers();
    UserEntity findUserByEmail(String email);
    boolean userExists(String email);
    void enableUser(UserEntity u);
    int getUserid(UserEntity u);
}