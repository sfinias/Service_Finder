package dao;


import java.util.List;
import model.ProfessionsEntity;
import model.UserEntity;

/**
 *
 * @author Nah
 */


public interface ProfessionsDAOInterface {
    List<ProfessionsEntity> getAllProfessions();
    List<UserEntity> getProfessionals(int id);
}
