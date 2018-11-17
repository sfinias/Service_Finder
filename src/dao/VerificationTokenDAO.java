package dao;

import model.UserEntity;
import model.VerificationTokenEntity;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * @author tsamo
 */
@Repository
public class VerificationTokenDAO implements VerificationTokenDAOInterface {

    @PersistenceContext
    private EntityManager em;


    @Transactional
    @Override
    public void insertToken(VerificationTokenEntity v) {
        em.persist(v);
    }

    @Transactional
    @Override
    public UserEntity getUserFromToken(VerificationTokenEntity v) {
        return em.find(UserEntity.class, v.getId());
    }
}
