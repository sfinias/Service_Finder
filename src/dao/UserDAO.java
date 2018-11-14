package dao;

import model.User;
import model.VerificationTokenEntity;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private VerificationTokenDAOInterface verificationTokenDAOInterface;

    @Autowired
    private UserDAOInterface userDAOInterface;

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

    @Override
    public void createVerificationToken(User user, String token) {
        VerificationTokenEntity myToken = new VerificationTokenEntity(token, user);
        verificationTokenDAOInterface.save(myToken);
    }

    @Override
    public User getUser(String verificationToken) {
        User user = verificationTokenDAOInterface.findByToken(verificationToken).getUserByUserEmail();
        return user;
    }

    @Override
    public void saveRegisteredUser(User user) {
        userDAOInterface.insertUser(user);
    }

    @Override
    public VerificationTokenEntity getVerificationToken(String VerificationToken) {
        return verificationTokenDAOInterface.findByToken(VerificationToken);
    }
}
