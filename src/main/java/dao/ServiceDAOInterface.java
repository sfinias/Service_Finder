package dao;

import model.RegisterEntity;
import model.ServiceEntity;

import java.util.ArrayList;

/**
 * @author tsamo
 */

public interface ServiceDAOInterface {
    boolean checkIfServiceExists(int userID, int ProfessionalID);
    int returnIfServiceExists(int customerID, int professionalID);
    ServiceEntity insertService(ServiceEntity serviceEntity);
    ServiceEntity getServiceByID(int serviceID);
    ArrayList<ServiceEntity> getAllServiceOfUser(int userID);
    ArrayList<ServiceEntity> getAllServiceOfProfessional(int profID);
    long getRating(RegisterEntity user);
    void setRating(RegisterEntity user, String profID, String rate);
}
