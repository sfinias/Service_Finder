package dao;

import model.UserEntity;
import model.VerificationTokenEntity;

/**
 * @author tsamo
 */
public interface VerificationTokenDAOInterface {
    void insertToken(VerificationTokenEntity v);
    UserEntity getUserFromToken(VerificationTokenEntity v);
}
