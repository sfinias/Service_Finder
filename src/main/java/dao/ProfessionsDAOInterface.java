package dao;


import java.math.BigDecimal;
import java.util.List;
import model.ProfessionsEntity;
import model.RegisterEntity;
import model.UserEntity;

/**
 *
 * @author Nah
 */


public interface ProfessionsDAOInterface {
    List<ProfessionsEntity> getAllProfessions();
    List<UserEntity> getProfessionals(int id);
    List<RegisterEntity> getProfs(int id);
    List<RegisterEntity> getProfsByLocation(int id, BigDecimal lng, BigDecimal lat, double distance);
    ProfessionsEntity getProfession(int id);

}
