package dao;

import dto.UserDTO;
import model.UserEntity;

import java.io.IOException;
import java.util.ArrayList;

/**
 * @author tsamo
 */
public interface UserDAOInterface {
    void insertUser(UserEntity u);
    ArrayList<UserEntity> getAllUsers();
    UserEntity findUserByEmail(String email);
    boolean userExists(String email);
    UserEntity registerNewUserAccount(UserDTO userDTO) throws IOException;
}