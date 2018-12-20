package dao;

import model.MessageEntity;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;

/**
 * @author tsamo
 */

@Repository
public class MessageDAO implements MessageDAOInterface {

    @PersistenceContext
    private EntityManager em;


    @Override
    public ArrayList<MessageEntity> getServicesMessages(int serviceID) {
            Query query = em.createQuery("SELECT m FROM MessageEntity m WHERE m.serviceId="+serviceID+" ORDER BY m.timeSent ASC");
            return (ArrayList<MessageEntity>) query.getResultList();
    }
}
