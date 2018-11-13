package dao;

import model.User;
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
    public void insertUser(User u) {
        em.persist(u);
    }

    @Transactional
    public ArrayList<User> getAllUsers() {
        Query query = em.createQuery("SELECT u FROM User u");
        return (ArrayList<User>) query.getResultList();
    }

    @Transactional
    public User findUserByEmail(String email) {
        User user = em.find(User.class,email);
        return user;
    }

    @Transactional
    public boolean userExists(String email) {
        User user = em.find(User.class, email);
        boolean flag;
        if (user != null) {
            flag = true;
        } else {
            flag = false;
        }
        return flag;
    }
}
