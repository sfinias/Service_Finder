package model;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Objects;

/**
 * @author tsamo
 */
@Entity
@Table(name = "verificationToken", schema = "dnmgdb", catalog = "")
public class VerificationTokenEntity {
    private int id;
    private String token;
    private Date expiryDate;
    private UserEntity userByUserEmail;

    public VerificationTokenEntity(String token, UserEntity userByUserEmail) {
        this.token = token;
        this.userByUserEmail = userByUserEmail;
    }

    public VerificationTokenEntity() {
    }

    private Date calculateExpiryDate(int expiryTimeInMinutes) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Timestamp(cal.getTime().getTime()));
        cal.add(Calendar.MINUTE, expiryTimeInMinutes);
        return new Date(cal.getTime().getTime());
    }

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "token", nullable = false, length = 100)
    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    @Basic
    @Column(name = "expiryDate", nullable = true)
    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        VerificationTokenEntity that = (VerificationTokenEntity) o;
        return id == that.id &&
                Objects.equals(token, that.token) &&
                Objects.equals(expiryDate, that.expiryDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, token, expiryDate);
    }

    @OneToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "user_email", referencedColumnName = "email", nullable = false)
    public UserEntity getUserByUserEmail() {
        return userByUserEmail;
    }

    public void setUserByUserEmail(UserEntity userByUserEmail) {
        this.userByUserEmail = userByUserEmail;
    }
}
