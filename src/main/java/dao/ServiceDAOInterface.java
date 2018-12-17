package dao;

import model.ServiceEntity;

/**
 * @author tsamo
 */

public interface ServiceDAOInterface {
    boolean checkIfServiceExists(int userID, int ProfessionalID);
    int returnIfServiceExists(int customerID, int professionalID);
    ServiceEntity insertService(ServiceEntity serviceEntity);
}
