package dao;

import model.RegisterEntity;


public interface ServiceDAOInterface {
    
    long getRating(RegisterEntity user);
    void setRating(RegisterEntity user, String profID,String rate);
    
}
