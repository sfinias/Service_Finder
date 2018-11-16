package dao;

import model.User;
import model.VerificationTokenEntity;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author tsamo
 */

public interface VerificationTokenDAOInterface extends JpaRepository<VerificationTokenEntity, Long> {
    VerificationTokenEntity findByToken(String token);
    VerificationTokenEntity findByUser(User user);
    void save(VerificationTokenEntity verificationTokenEntity);
}