package dao;

import model.AddressEntity;
import model.PhoneEntity;
import model.UserEntity;
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
    @Override
    public void insertUser(UserEntity u) {
        em.persist(u);
    }

    @Transactional
    @Override
    public void insertAddress(AddressEntity a) {
        em.persist(a);
    }

    @Transactional
    @Override
    public void insertPhone(PhoneEntity p) {
        em.persist(p);
    }

    @Transactional
    @Override
    public ArrayList<UserEntity> getAllUsers() {
        Query query = em.createQuery("SELECT u FROM UserEntity u");
        return (ArrayList<UserEntity>) query.getResultList();
    }

    @Transactional
    @Override
    public UserEntity findUserByEmail(String email) {
        UserEntity user = em.find(UserEntity.class, email);
        return user;
    }

    @Transactional
    @Override
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
    @Override
    public void enableUser(UserEntity u) {
        u.setEnabled(true);
        em.merge(u);
    }

    @Transactional
    @Override
    public int getUserid(UserEntity user) {
        Query query = em.createQuery("SELECT u.id FROM UserEntity u WHERE u.email='" + user.getEmail() + "'");
        ArrayList<Integer> ids = (ArrayList<Integer>) query.getResultList();
        int uid=ids.get(0);
        return uid;
    }

}