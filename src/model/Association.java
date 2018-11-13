/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Nah
 */
@Entity
@Table(name = "association")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Association.findAll", query = "SELECT a FROM Association a")
    , @NamedQuery(name = "Association.findByDateTime", query = "SELECT a FROM Association a WHERE a.associationPK.dateTime = :dateTime")
    , @NamedQuery(name = "Association.findByUserCustomer", query = "SELECT a FROM Association a WHERE a.associationPK.userCustomer = :userCustomer")
    , @NamedQuery(name = "Association.findByUserServicer", query = "SELECT a FROM Association a WHERE a.associationPK.userServicer = :userServicer")})
public class Association implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected AssociationPK associationPK;
    @JoinColumn(name = "user_customer", referencedColumnName = "email", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;
    @JoinColumn(name = "user_servicer", referencedColumnName = "email", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user1;

    public Association() {
    }

    public Association(AssociationPK associationPK) {
        this.associationPK = associationPK;
    }

    public Association(Date dateTime, String userCustomer, String userServicer) {
        this.associationPK = new AssociationPK(dateTime, userCustomer, userServicer);
    }

    public AssociationPK getAssociationPK() {
        return associationPK;
    }

    public void setAssociationPK(AssociationPK associationPK) {
        this.associationPK = associationPK;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getUser1() {
        return user1;
    }

    public void setUser1(User user1) {
        this.user1 = user1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (associationPK != null ? associationPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Association)) {
            return false;
        }
        Association other = (Association) object;
        if ((this.associationPK == null && other.associationPK != null) || (this.associationPK != null && !this.associationPK.equals(other.associationPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Association[ associationPK=" + associationPK + " ]";
    }
    
}
