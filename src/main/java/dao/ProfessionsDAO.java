package dao;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import model.ProfessionsEntity;
import model.UserEntity;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nah
 */

@Repository
public class ProfessionsDAO implements ProfessionsDAOInterface {
    @PersistenceContext
    private EntityManager em;

    @Transactional
    public List<ProfessionsEntity> getAllProfessions() {
        Query query = em.createQuery("SELECT p FROM ProfessionsEntity p WHERE p.id<>1");
        return (List<ProfessionsEntity>) query.getResultList();
    }

    @Transactional
    public List<UserEntity> getProfessionals(int id){
        Query query = em.createQuery("SELECT u FROM UserEntity u RIGHT JOIN ProfessionsEntity p ON u.professionId = " +
                "p.id WHERE p.id=" + id);
        return (List<UserEntity>) query.getResultList();
    }
}
