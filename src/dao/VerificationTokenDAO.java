package dao;

import model.UserEntity;
import model.VerificationTokenEntity;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

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

    @Transactional
    @Override
    public boolean checkIfTokenExists(String token) {
        VerificationTokenEntity v = em.find(VerificationTokenEntity.class, token);
        boolean flag;
        if (v != null) {
            flag = true;
        } else {
            flag = false;
        }
        return flag;
    }

    @Override
    public VerificationTokenEntity getTokenEntityFromToken(String token) {
        return em.find(VerificationTokenEntity.class, token);
    }

    @Override
    public boolean checkIfTimeLessThan24Hours(Timestamp timestamp) {
        boolean flag;
        Timestamp timestamp2 = new Timestamp(new Date().getTime());
        long now = timestamp2.getTime();
        long then = timestamp.getTime();
        if (now - then <= 86400000) {
            flag = true;
        } else {
            flag = false;
        }
        return flag;
    }

    @Override
    public Timestamp getTimestampOfTokenCreation(String token) {
        VerificationTokenEntity v = em.find(VerificationTokenEntity.class, token);
        return v.getGeneratedTokenDateTime();
    }

    @Override
    public void createTokenForUser(int userId) {
        VerificationTokenEntity v = new VerificationTokenEntity();
        v.setUserId(userId);
        v.setGeneratedTokenDateTime(new Timestamp(new Date().getTime()));
        int length = 20;
        boolean useLetters = true;
        boolean useNumbers = true;
        String token = RandomStringUtils.random(length, useLetters, useNumbers);
        v.setToken(token);
        em.persist(v);
    }

    @Override
    public String getTokenOfUser(int userId) {
        Query query = em.createQuery("SELECT v.token FROM VerificationTokenEntity v WHERE v.userId=" + userId);
        ArrayList<VerificationTokenEntity> tokenEntities = (ArrayList<VerificationTokenEntity>) query.getResultList();
        return tokenEntities.get(0).getToken();
    }
}
