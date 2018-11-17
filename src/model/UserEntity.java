package model;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author tsamo
 */
@Entity
@Table(name = "user", schema = "dnmgdb", catalog = "")
public class UserEntity {
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String passwordSalt;
    private String passwordHash;
    private boolean enabled;
    @Transient
    private String emailConfirm;
    @Transient
    private String passwordConfirm;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "first_name", nullable = false, length = 20)
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Basic
    @Column(name = "last_name", nullable = false, length = 20)
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Basic
    @Column(name = "email", nullable = false, length = 50)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "password_salt", nullable = false, length = 50)
    public String getPasswordSalt() {
        return passwordSalt;
    }

    public void setPasswordSalt(String passwordSalt) {
        this.passwordSalt = passwordSalt;
    }

    @Basic
    @Column(name = "password_hash", nullable = false, length = 50)
    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    @Basic
    @Column(name = "enabled", nullable = false, columnDefinition = "BIT", length = 1)
    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getEmailConfirm() {
        return emailConfirm;
    }

    @Transient
    public void setEmailConfirm(String emailConfirm) {
        this.emailConfirm = emailConfirm;
    }

    @Transient
    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserEntity that = (UserEntity) o;
        return id == that.id &&
                enabled == that.enabled &&
                Objects.equals(firstName, that.firstName) &&
                Objects.equals(lastName, that.lastName) &&
                Objects.equals(email, that.email) &&
                Objects.equals(passwordSalt, that.passwordSalt) &&
                Objects.equals(passwordHash, that.passwordHash);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, firstName, lastName, email, passwordSalt, passwordHash, enabled);
    }
}
