/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Nah
 */
@Embeddable
public class AssociationPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "date_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateTime;
    @Basic(optional = false)
    @Column(name = "user_customer")
    private String userCustomer;
    @Basic(optional = false)
    @Column(name = "user_servicer")
    private String userServicer;

    public AssociationPK() {
    }

    public AssociationPK(Date dateTime, String userCustomer, String userServicer) {
        this.dateTime = dateTime;
        this.userCustomer = userCustomer;
        this.userServicer = userServicer;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public String getUserCustomer() {
        return userCustomer;
    }

    public void setUserCustomer(String userCustomer) {
        this.userCustomer = userCustomer;
    }

    public String getUserServicer() {
        return userServicer;
    }

    public void setUserServicer(String userServicer) {
        this.userServicer = userServicer;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (dateTime != null ? dateTime.hashCode() : 0);
        hash += (userCustomer != null ? userCustomer.hashCode() : 0);
        hash += (userServicer != null ? userServicer.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AssociationPK)) {
            return false;
        }
        AssociationPK other = (AssociationPK) object;
        if ((this.dateTime == null && other.dateTime != null) || (this.dateTime != null && !this.dateTime.equals(other.dateTime))) {
            return false;
        }
        if ((this.userCustomer == null && other.userCustomer != null) || (this.userCustomer != null && !this.userCustomer.equals(other.userCustomer))) {
            return false;
        }
        if ((this.userServicer == null && other.userServicer != null) || (this.userServicer != null && !this.userServicer.equals(other.userServicer))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.AssociationPK[ dateTime=" + dateTime + ", userCustomer=" + userCustomer + ", userServicer=" + userServicer + " ]";
    }
    
}
