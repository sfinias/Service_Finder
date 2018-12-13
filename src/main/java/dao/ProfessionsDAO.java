package dao;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import model.*;
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

    @Transactional
    public List<RegisterEntity> getProfs(int id) {
        List<RegisterEntity> profs = new ArrayList<>();
        Query query = em.createQuery("SELECT u, p, a, ph FROM UserEntity u " +
                "LEFT JOIN ProfessionsEntity p ON u.professionId = p.id " +
                "LEFT JOIN AddressEntity a ON u.id = a.userId " +
                "LEFT JOIN PhoneEntity ph ON u.id = ph.userId " +
                "WHERE p.id=" + id);
        List<Object[]> objs = query.getResultList();
        if (objs.size()==0) return null;
        for (Object[] result: objs){
            RegisterEntity prof = new RegisterEntity();
            prof.setUserEntity((UserEntity)result[0]);
            prof.setProfessionsEntity((ProfessionsEntity)result[1]);
            prof.setAddressEntity((AddressEntity)result[2]);
            prof.setPhoneEntity((PhoneEntity)result[3]);
            profs.add(prof);
        }
        return profs;
    }
}
