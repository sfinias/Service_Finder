package dao;

import java.util.List;
import model.RegisterEntity;
import model.ServiceEntity;


public interface ServiceDAOInterface {
    
    long getRating(RegisterEntity user);
    void setRating(RegisterEntity user, String profID,String rate);
    List<ServiceEntity> getServicesForProf(RegisterEntity user);
}
