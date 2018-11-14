package dao;

import model.User;
import model.VerificationTokenEntity;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * @author tsamo
 */
@Repository
public abstract class VerificationTokenDAO implements VerificationTokenDAOInterface{

    @PersistenceContext
    private EntityManager em;

    @Transactional
    public VerificationTokenEntity findByToken(String token) {
        VerificationTokenEntity vte = em.find(VerificationTokenEntity.class,token);
        return vte;
    }

    @Transactional
    public VerificationTokenEntity findByUser(User user) {
        VerificationTokenEntity vte = em.find(VerificationTokenEntity.class,user);
        return vte;
    }

    @Transactional
    public void save(VerificationTokenEntity vte) {
        em.persist(vte);
    }
}
