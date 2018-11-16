package dao;

import model.UserEntity;
import model.VerificationTokenEntity;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author tsamo
 */

public interface VerificationTokenDAOInterface extends JpaRepository<VerificationTokenEntity, Long> {
    VerificationTokenEntity findByToken(String token);
    VerificationTokenEntity findByUser(UserEntity user);
    void save(VerificationTokenEntity verificationTokenEntity);
}