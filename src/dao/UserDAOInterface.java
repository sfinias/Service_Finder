package dao;

import model.AddressEntity;
import model.PhoneEntity;
import model.UserEntity;

import java.util.ArrayList;

/**
 * @author tsamo
 */
public interface UserDAOInterface {
    void insertUser(UserEntity u);
    void insertAddress(AddressEntity a);
    void insertPhone(PhoneEntity p);
    ArrayList<UserEntity> getAllUsers();
    UserEntity findUserByEmail(String email);
    boolean userExists(String email);
    void enableUser(UserEntity u);
    int getUserid(UserEntity u);
}