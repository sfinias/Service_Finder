package dao;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.ProfessionsEntity;
import org.springframework.stereotype.Repository;
import java.util.List;

/**
 *
 * @author Nah
 */

@Repository
public class ProfessionsDAO implements ProfessionsDAOInterface {
    @PersistenceContext
    private EntityManager em;

    @Override
    public List<ProfessionsEntity> getAllProfessions() {
        List<ProfessionsEntity> professionsList = em.createQuery("SELECT p FROM ProfessionsEntity p ").getResultList();
        return professionsList;
        
    }

}
