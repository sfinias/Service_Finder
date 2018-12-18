/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import model.RegisterEntity;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author matina
 */
@Repository
public class ServiceDAO implements ServiceDAOInterface{

    @PersistenceContext
    private EntityManager em;
    
    @Override
    @Transactional
    public long getRating(RegisterEntity user) {
        int id = user.getUserEntity().getId();
        Query query = em.createQuery("SELECT SUM(s.rating)/count(s.customerId) FROM ServiceEntity s WHERE s.professionalId = " + id + " AND rating is not null" );
        List<Long> list = (List<Long>)query.getResultList();
        if(list.isEmpty()) return 0;
        return list.get(0);
    }

    @Override
    @Transactional
    public void setRating(RegisterEntity user, String profID, String rate) {
        int idProf = Integer.parseInt(profID);
        int rating = Integer.parseInt(rate);
        Query query = em.createQuery("");
    }
    
}
