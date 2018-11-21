package dao;

import model.AddressEntity;
import model.PhoneEntity;
import model.UserEntity;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import java.util.ArrayList;

/**
 * @author tsamo
 */
@Repository
public class UserDAO implements UserDAOInterface {

    @PersistenceContext
    private EntityManager em;

    @Transactional
    public void insertUser(UserEntity u) {
        int length = 20;
        boolean useLetters = true;
        boolean useNumbers = true;
        String originalPassword = u.getPasswordHash();
        String passwordsalt = RandomStringUtils.random(length, useLetters, useNumbers);
        String preHashPassword = originalPassword + passwordsalt;
        String hashedPassword = DigestUtils.sha512Hex(preHashPassword);
        u.setPasswordSalt(passwordsalt);
        u.setPasswordHash(hashedPassword);
        em.persist(u);
    }

    @Transactional
    public void insertAddress(AddressEntity a, int userid) {
        a.setUserId(userid);
        em.persist(a);
    }

    @Transactional
    public void insertPhone(PhoneEntity p, int userid) {
        p.setUserId(userid);
        em.persist(p);
    }

    @Transactional
    public ArrayList<UserEntity> getAllUsers() {
        Query query = em.createQuery("SELECT u FROM UserEntity u");
        return (ArrayList<UserEntity>) query.getResultList();
    }

    @Transactional
    public UserEntity findUserByEmail(String email) {
        Query query = em.createQuery("SELECT u FROM UserEntity u WHERE u.email='" + email + "'");
        return (UserEntity) query.getSingleResult();
    }

    @Transactional
    public boolean userExists(String email) {
        boolean flag;
        Query query = em.createQuery("SELECT u FROM UserEntity u WHERE u.email='" + email + "'");
        ArrayList<UserEntity> users = (ArrayList<UserEntity>) query.getResultList();
        if (users.size() == 0) {
            flag = false;
        } else {
            flag = true;
        }
        return flag;
    }

    @Transactional
    public void enableUser(UserEntity u) {
        u.setEnabled(true);
        em.merge(u);
    }

    @Transactional
    public int getUserid(UserEntity user) {
        Query query = em.createQuery("SELECT u.id FROM UserEntity u WHERE u.email='" + user.getEmail() + "'");
        return (Integer) query.getSingleResult();
    }

    @Transactional
    public String getSalt(String email) {
        Query query = em.createQuery("SELECT u.passwordSalt FROM UserEntity u WHERE u.email='" + email + "'");
        return (String) query.getSingleResult();
    }

    @Transactional
    public ArrayList<String> getAllEmails() {
        Query query = em.createQuery("SELECT u.email FROM UserEntity u");
        return (ArrayList<String>) query.getResultList();
    }

}