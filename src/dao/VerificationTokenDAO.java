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
        return em.find(UserEntity.class, v.getUserId());
    }

    @Transactional
    @Override
    public boolean checkIfTokenExists(String token) {
        Query query = em.createQuery("SELECT v FROM VerificationTokenEntity v WHERE v.token='" + token+"'");
        ArrayList<VerificationTokenEntity> tokenEntities = (ArrayList<VerificationTokenEntity>) query.getResultList();
        boolean flag;
        if (tokenEntities.size()==0) {
            flag = false;
        } else {
            flag = true;
        }
        return flag;
    }

    @Transactional
    @Override
    public VerificationTokenEntity getTokenEntityFromToken(String token) {
        Query query = em.createQuery("SELECT v FROM VerificationTokenEntity v WHERE v.token='" + token+"'");
        ArrayList<VerificationTokenEntity> tokenEntities = (ArrayList<VerificationTokenEntity>) query.getResultList();
        return tokenEntities.get(0);
    }

    @Transactional
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

    @Transactional
    @Override
    public Timestamp getTimestampOfTokenCreation(String token) {
        Query query = em.createQuery("SELECT v FROM VerificationTokenEntity v WHERE v.token='" + token+"'");
        ArrayList<VerificationTokenEntity> tokenEntities = (ArrayList<VerificationTokenEntity>) query.getResultList();
        return tokenEntities.get(0).getGeneratedTokenDateTime();
    }

    @Transactional
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

    @Transactional
    @Override
    public String getTokenOfUser(int userId) {
        Query query = em.createQuery("SELECT v.token FROM VerificationTokenEntity v WHERE v.userId=" + userId);
        ArrayList<String> tokenEntities = (ArrayList<String>) query.getResultList();
        return tokenEntities.get(0);
    }
}
