package dao;

import model.ServiceEntity;
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
public class ServiceDAO implements ServiceDAOInterface{

    @PersistenceContext
    private EntityManager em;

    @Override
    public boolean checkIfServiceExists(int customerID, int professionalID) {
        boolean flag;
        Query query = em.createQuery("SELECT s FROM ServiceEntity s WHERE s.customerId=" + customerID + " AND s.professionalId="+professionalID+"");
        ArrayList<UserEntity> users = (ArrayList<UserEntity>) query.getResultList();
        if (users.size() == 0) {
            flag = false;
        } else {
            flag = true;
        }
        return flag;
    }

    @Override
    public int returnIfServiceExists(int customerID, int professionalID) {
        int flag;
        Query query = em.createQuery("SELECT s FROM ServiceEntity s WHERE (s.customerId=" + customerID + " AND s.professionalId="+professionalID+" AND s.fulfilled=false) OR (s.customerId=" + professionalID + " AND s.professionalId="+customerID+" AND s.fulfilled=false) ");
        ArrayList<ServiceEntity> services = (ArrayList<ServiceEntity>) query.getResultList();
        if (services.size() == 0) {
            flag = 0;
        } else {
            flag=services.get(0).getId();
        }
        return flag;
    }

    @Transactional
    public ServiceEntity insertService(ServiceEntity serviceEntity) {
        em.persist(serviceEntity);
        return serviceEntity;
    }
}
