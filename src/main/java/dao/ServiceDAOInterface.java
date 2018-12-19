package dao;

import java.util.List;
import model.RegisterEntity;
import model.ServiceEntity;


import java.util.List;


public interface ServiceDAOInterface {
    
    long getRating(RegisterEntity user);
    void setRating(RegisterEntity user, String profID,String rate);
    List<ServiceEntity> getServicesForProf(RegisterEntity user);
    List<ServiceEntity> getSubServicesForProf(RegisterEntity user, boolean fulfilled);

}
