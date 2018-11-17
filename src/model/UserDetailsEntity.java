package model;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.sql.Date;
import java.util.Arrays;
import java.util.Objects;

/**
 * @author tsamo
 */
@Entity
@Table(name = "user_details", schema = "dnmgdb")
public class UserDetailsEntity {
    private int userId;
    private Date dateOfBirth;
    private byte[] photo;
    private boolean gender;
    @Transient
    private MultipartFile file;

    @Id
    @Column(name = "user_id", nullable = false)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "date_of_birth", nullable = true)
    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    @Basic
    @Column(name = "photo", nullable = true)
    @Lob(type = LobType.BLOB)
    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    @Basic
    @Column(name = "gender", nullable = true, columnDefinition = "BIT", length = 1)
    public boolean getGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    @Transient
    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserDetailsEntity that = (UserDetailsEntity) o;
        return userId == that.userId &&
                Objects.equals(dateOfBirth, that.dateOfBirth) &&
                Arrays.equals(photo, that.photo) &&
                Objects.equals(gender, that.gender);
    }

    @Override
    public int hashCode() {
        int result = Objects.hash(userId, dateOfBirth, gender);
        result = 31 * result + Arrays.hashCode(photo);
        return result;
    }
}
