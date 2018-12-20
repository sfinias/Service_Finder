package dao;

import java.util.List;
import model.RegisterEntity;
import model.ServiceEntity;

import java.util.ArrayList;

import java.util.List;


public interface ServiceDAOInterface {
    boolean checkIfServiceExists(int userID, int ProfessionalID);
    int returnIfServiceExists(int customerID, int professionalID);
    ServiceEntity insertService(ServiceEntity serviceEntity);
    ServiceEntity getServiceByID(int serviceID);
    ArrayList<ServiceEntity> getAllServiceOfUser(int userID);
    ArrayList<ServiceEntity> getAllServiceOfProfessional(int profID);
    long getRating(RegisterEntity user);
    void setRating(RegisterEntity user, String profID,String rate);
    List<ServiceEntity> getServicesForProf(RegisterEntity user);
    List<ServiceEntity> getSubServicesForProf(RegisterEntity user, boolean fulfilled);
    public ServiceEntity getServiceById(int id);
    List<ServiceEntity> getServicesForUser(RegisterEntity user);
    List<ServiceEntity> getSubServicesForUser(RegisterEntity user, boolean fulfilled);
    void setRating(RegisterEntity user, String profID, String rate);
}
