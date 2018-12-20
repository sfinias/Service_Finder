package dao;

import model.RegisterEntity;
import model.ServiceEntity;
import model.UserEntity;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

/**
 * @author tsamo
 */

@Repository
public class ServiceDAO implements ServiceDAOInterface {

    @PersistenceContext
    private EntityManager em;

    @Override
    public boolean checkIfServiceExists(int customerID, int professionalID) {
        boolean flag;
        Query query = em.createQuery("SELECT s FROM ServiceEntity s WHERE s.customerId=" + customerID + " AND s.professionalId=" + professionalID + "");
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
        Query query = em.createQuery("SELECT s FROM ServiceEntity s WHERE (s.customerId=" + customerID + " AND s.professionalId=" + professionalID + " AND s.fulfilled=false) OR (s.customerId=" + professionalID + " AND s.professionalId=" + customerID + " AND s.fulfilled=false) ");
        ArrayList<ServiceEntity> services = (ArrayList<ServiceEntity>) query.getResultList();
        if (services.size() == 0) {
            flag = 0;
        } else {
            flag = services.get(0).getId();
        }
        return flag;
    }

    @Transactional
    public ServiceEntity insertService(ServiceEntity serviceEntity) {
        em.persist(serviceEntity);
        return serviceEntity;
    }

    @Override
    public ServiceEntity getServiceByID(int serviceID) {
        return em.getReference(ServiceEntity.class, serviceID);
    }

    @Override
    public ArrayList<ServiceEntity> getAllServiceOfUser(int userID) {
        Query query = em.createQuery("SELECT s FROM ServiceEntity s WHERE s.customerId="+userID);
        return (ArrayList<ServiceEntity>) query.getResultList();
    }

    @Override
    public ArrayList<ServiceEntity> getAllServiceOfProfessional(int profID) {
        Query query = em.createQuery("SELECT s FROM ServiceEntity s WHERE s.professionalId="+profID);
        return (ArrayList<ServiceEntity>) query.getResultList();
    }

    @Override
    @Transactional
    public long getRating(RegisterEntity user) {
        int id = user.getUserEntity().getId();
        try{
        Query query = em.createQuery("SELECT SUM(s.rating)/count(s.customerId) FROM ServiceEntity s WHERE s.professionalId = " + id + " AND rating is not null" );
        List<Long> list = (List<Long>)query.getResultList();
        if(list.isEmpty()) return 0;
        return list.get(0);
        }catch(Exception e){
             e.printStackTrace();
             return 0;
        }
    }

    @Override
    @Transactional
    public void setRating(ServiceEntity serviceEntity, int rating) {
        serviceEntity.setRating(rating);
        em.merge(serviceEntity);
    }

    @Override
    @Transactional
    public List<ServiceEntity> getServicesForProf(RegisterEntity user) {
        Query query = em.createQuery("SELECT s FROM ServiceEntity s WHERE s.professionalId = :id");
        query.setParameter("id", user.getUserEntity().getId());
        return (List<ServiceEntity>)query.getResultList();
    }

    @Override
    @Transactional
    public List<ServiceEntity> getSubServicesForProf(RegisterEntity user, boolean fulfilled) {
        Query query = em.createQuery("SELECT s FROM ServiceEntity s WHERE s.professionalId = :id " +
                "AND s.fulfilled = :active");
        query.setParameter("id", user.getUserEntity().getId());
        query.setParameter("active", fulfilled);
        return (List<ServiceEntity>)query.getResultList();
    }

    @Override
    @Transactional
    public List<ServiceEntity> getServicesForUser(RegisterEntity user) {
        Query query = em.createQuery("SELECT s FROM ServiceEntity s WHERE s.customerId = :id");
        query.setParameter("id", user.getUserEntity().getId());
        return (List<ServiceEntity>)query.getResultList();
    }

    @Override
    @Transactional
    public List<ServiceEntity> getSubServicesForUser(RegisterEntity user, boolean fulfilled) {
        Query query = em.createQuery("SELECT s FROM ServiceEntity s WHERE s.customerId = :id " +
                "AND s.fulfilled = :active");
        query.setParameter("id", user.getUserEntity().getId());
        query.setParameter("active", fulfilled);
        return (List<ServiceEntity>)query.getResultList();
    }

    @Override
    @Transactional
    public ServiceEntity getServiceById(int id){
        return em.find(ServiceEntity.class, id);
    }

    @Override
    @Transactional
    public void updateService(ServiceEntity s) {
        em.merge(s);
    }
}