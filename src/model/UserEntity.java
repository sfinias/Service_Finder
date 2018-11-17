/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import javax.persistence.*;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author User
 */
@Entity
@Table(name = "user")
@XmlRootElement
@NamedQueries({
        @NamedQuery(name = "User.findAll", query = "SELECT u FROM UserEntity u")
        , @NamedQuery(name = "User.findByEmail", query = "SELECT u FROM UserEntity u WHERE u.email = :email")
        , @NamedQuery(name = "User.findByPass", query = "SELECT u FROM UserEntity u WHERE u.pass = :pass")
        , @NamedQuery(name = "User.findByFirstName", query = "SELECT u FROM UserEntity u WHERE u.firstName = :firstName")
        , @NamedQuery(name = "User.findByLastName", query = "SELECT u FROM UserEntity u WHERE u.lastName = :lastName")
        , @NamedQuery(name = "User.findByAddress", query = "SELECT u FROM UserEntity u WHERE u.address = :address")
        , @NamedQuery(name = "User.findByPhone", query = "SELECT u FROM UserEntity u WHERE u.phone = :phone")})
public class UserEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id")
    private int id;
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @Column(name = "pass")
    private String pass;
    @Basic(optional = false)
    @Column(name = "first_name")
    private String firstName;
    @Basic(optional = false)
    @Column(name = "last_name")
    private String lastName;
    @Basic(optional = false)
    @Column(name = "address")
    private String address;
    @Column(name = "phone")
    private String phone;
    @Basic(optional = false)
    @Column(name = "enabled", nullable = false, columnDefinition = "BIT", length = 1)
    private boolean enabled;
    @Lob
    @Column(name = "photo")
    private byte[] photo;
    @Transient
    private MultipartFile file;
    @Transient
    private String emailConfirm;
    @Transient
    private String passwordConfirm;


    public UserEntity() {
    }

    public UserEntity(String email) {
        this.email = email;
    }

    public UserEntity(String email, String pass, String firstName, String lastName, String address) {
        this.email = email;
        this.pass = pass;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
    }

    public String getEmailConfirm() {
        return emailConfirm;
    }

    public void setEmailConfirm(String emailConfirm) {
        this.emailConfirm = emailConfirm;
    }

    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (email != null ? email.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof UserEntity)) {
            return false;
        }
        UserEntity other = (UserEntity) object;
        if ((this.email == null && other.email != null) || (this.email != null && !this.email.equals(other.email))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.User[ email=" + email + " ]";
    }
}