package dao;

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
        UserEntity user = em.find(UserEntity.class, email);
        boolean flag;
        if (user != null) {
            flag = true;
        } else {
            flag = false;
        }
        return flag;
    }

    @Override
    public void enableUser(UserEntity u) {
        u.setEnabled(true);
        em.merge(u);
    }

    @Override
    public int getUserid(UserEntity user) {
        Query query = em.createQuery("SELECT u.id FROM UserEntity u WHERE u.email='" + user.getEmail() + "'");
        ArrayList<UserEntity> users = (ArrayList<UserEntity>) query.getResultList();
        return users.get(0).getId();
    }

}