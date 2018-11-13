package dao;

import model.User;
import model.VerificationTokenEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author tsamo
 */
@Repository
public interface VerificationTokenRepository extends JpaRepository<VerificationTokenEntity, Long> {
    VerificationTokenEntity findByToken(String token);
    VerificationTokenEntity findByUser(User user);
}