package dao;

import java.io.*;

import model.*;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Repository;

import javax.mail.Multipart;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.transaction.annotation.Transactional;
import java.util.ArrayList;
import java.util.List;
import model.ProfessionsEntity;
import model.RegisterEntity;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author tsamo
 */
@Repository
public class UserDAO implements UserDAOInterface {

    @PersistenceContext
    private EntityManager em;

    @Transactional
    public void insertUser(UserEntity u) {
        int length = 20;
        boolean useLetters = true;
        boolean useNumbers = true;
        String originalPassword = u.getPasswordHash();
        String passwordsalt = RandomStringUtils.random(length, useLetters, useNumbers);
        String preHashPassword = originalPassword + passwordsalt;
        String hashedPassword = DigestUtils.sha512Hex(preHashPassword);
        u.setPasswordSalt(passwordsalt);
        u.setPasswordHash(hashedPassword);
        em.persist(u);
    }

    @Transactional
    public void insertAddress(AddressEntity a, int userid) {
        a.setUserId(userid);
        em.persist(a);
    }

    @Transactional
    public void insertPhone(PhoneEntity p, int userid) {
        p.setUserId(userid);
        em.persist(p);
    }

    @Transactional
    public ArrayList<UserEntity> getAllUsers() {
        Query query = em.createQuery("SELECT u FROM UserEntity u");
        return (ArrayList<UserEntity>) query.getResultList();
    }

    @Transactional
    public UserEntity findUserByEmail(String email) {
        Query query = em.createQuery("SELECT u FROM UserEntity u WHERE u.email='" + email + "'");
        return (UserEntity) query.getSingleResult();
    }

    @Transactional
    public boolean userExists(String email) {
        boolean flag;
        Query query = em.createQuery("SELECT u FROM UserEntity u WHERE u.email='" + email + "'");
        ArrayList<UserEntity> users = (ArrayList<UserEntity>) query.getResultList();
        flag = users.size() != 0;
        return flag;
    }

    @Transactional
    public void enableUser(UserEntity u) {
        u.setEnabled(true);
        em.merge(u);
    }

    @Transactional
    public int getUserid(UserEntity user) {
        Query query = em.createQuery("SELECT u.id FROM UserEntity u WHERE u.email='" + user.getEmail() + "'");
        return (Integer) query.getSingleResult();
    }

    @Transactional
    public String getSalt(String email) {
        Query query = em.createQuery("SELECT u.passwordSalt FROM UserEntity u WHERE u.email='" + email + "'");
        return (String) query.getSingleResult();
    }

    @Transactional
    public boolean isUserActivated(String email) {
        Query query = em.createQuery("SELECT u.enabled FROM UserEntity u WHERE u.email='" + email + "'");
        return (boolean) query.getSingleResult();
    }

    @Transactional
    public void changePasswordOfUser(String email, String newPassword) {
        Query query = em.createQuery("SELECT u FROM UserEntity u WHERE u.email='" + email + "'");
        UserEntity u = (UserEntity) query.getSingleResult();
        int length = 20;
        boolean useLetters = true;
        boolean useNumbers = true;
        String passwordsalt = RandomStringUtils.random(length, useLetters, useNumbers);
        String preHashPassword = newPassword + passwordsalt;
        String hashedPassword = DigestUtils.sha512Hex(preHashPassword);
        u.setPasswordSalt(passwordsalt);
        u.setPasswordHash(hashedPassword);
        em.merge(u);
    }

    @Transactional
    public ArrayList<String> getAllEmails() {
        Query query = em.createQuery("SELECT u.email FROM UserEntity u");
        return (ArrayList<String>) query.getResultList();
    }

    @Transactional
    public RegisterEntity getUserByEmail(String email) {
        Query query = em.createQuery("SELECT u, p, a, ph FROM UserEntity u " +
                "LEFT JOIN ProfessionsEntity p ON u.professionId = p.id " +
                "LEFT JOIN AddressEntity a ON u.id = a.userId " +
                "LEFT JOIN PhoneEntity ph ON u.id = ph.userId " +
                "WHERE u.email='" + email + "'");
        return getUser(query);
    }

    @Transactional
    public ArrayList<ProfessionsEntity> getAllProfessions() {
        Query query = em.createQuery("SELECT p FROM ProfessionsEntity p");
        ArrayList<ProfessionsEntity> list = (ArrayList<ProfessionsEntity>) query.getResultList();
        list.remove(0);
        return list;
    }

    @Transactional
    public RegisterEntity editUser(RegisterEntity originalEntity, RegisterEntity updatedUser) {
        if (!(originalEntity.getUserEntity().getFirstName().equals(updatedUser.getUserEntity().getFirstName()))) {
            originalEntity.getUserEntity().setFirstName(updatedUser.getUserEntity().getFirstName());
        }
        if (!(originalEntity.getUserEntity().getLastName().equals(updatedUser.getUserEntity().getLastName()))) {
            originalEntity.getUserEntity().setLastName(updatedUser.getUserEntity().getLastName());
        }
        if (!(originalEntity.getUserEntity().getEmail().equals(updatedUser.getUserEntity().getEmail()))) {
            originalEntity.getUserEntity().setEmail(updatedUser.getUserEntity().getEmail());
        }
        if (!(originalEntity.getPhoneEntity().getMobile().equals(updatedUser.getPhoneEntity().getMobile()))) {
            originalEntity.getPhoneEntity().setMobile(updatedUser.getPhoneEntity().getMobile());
        }
        if (!(originalEntity.getPhoneEntity().getLandline().equals(updatedUser.getPhoneEntity().getLandline()))) {
            originalEntity.getPhoneEntity().setLandline(updatedUser.getPhoneEntity().getLandline());
        }
        em.merge(originalEntity.getUserEntity());
        em.merge(originalEntity.getAddressEntity());
        em.merge(originalEntity.getPhoneEntity());

        return originalEntity;
    }
//     @Transactional
//    public void changePassword(RegisterEntity originalEntity) {      
//            em.merge(originalEntity.getUserEntity().setPasswordHash());            
//            
//           
//    }

    //set profile Picture
    public String setProfilePicture(UserEntity userEntity) {
        int id = userEntity.getId();
        String pathJPG = RegisterEntity.IMAGE_PATH + id + ".jpg";
        String pathPNG = RegisterEntity.IMAGE_PATH + id + ".png";
        File filenameJPG = new File(pathJPG);
        File filenamePNG = new File(pathPNG);
        if ((filenameJPG.exists() && !filenameJPG.isDirectory())) {
            return id + ".jpg";
        } else if ((filenamePNG.exists() && !filenamePNG.isDirectory())) {
            return id + ".png";
        } else {
            return "dmng.png";
        }
    }

    @Transactional
    public boolean emailExists(String email) {
        Query query = em.createQuery("SELECT u.email FROM UserEntity u WHERE email = :email");
        query.setParameter("email", email);
        List<String> list = (List<String>) query.getResultList();
        return !list.isEmpty();
    }

    @Override
    public boolean uploadPhoto(MultipartFile file, RegisterEntity user) throws IOException {
        String extension = FilenameUtils.getExtension(file.getOriginalFilename());
//        RegisterEntity user = (RegisterEntity)session.getAttribute("user");
        int idForFilename = user.getUserEntity().getId();
        String newFilename = String.valueOf(idForFilename);
        File previousFileToDeleteJPG = new File(RegisterEntity.IMAGE_PATH + user.getUserEntity().getId() + ".jpg");
        File previousFileToDeletePNG = new File(RegisterEntity.IMAGE_PATH + user.getUserEntity().getId() + ".png");

        // Save file on system
        if (!file.getOriginalFilename().isEmpty()) {
            previousFileToDeleteJPG.delete();
            previousFileToDeletePNG.delete();
            BufferedOutputStream outputStream = new BufferedOutputStream(
                    new FileOutputStream(new File(RegisterEntity.IMAGE_PATH, newFilename.concat("." + extension))));
            user.getUserEntity().setProfilePicture(newFilename.concat("." + extension));
            outputStream.write(file.getBytes());
            outputStream.flush();
            outputStream.close();
            
            return true;
        } else return false;
    }

    @Override
    public RegisterEntity getUserById(int id) {
        Query query = em.createQuery("SELECT u, p, a, ph FROM UserEntity u " +
                "LEFT JOIN ProfessionsEntity p ON u.professionId = p.id " +
                "LEFT JOIN AddressEntity a ON u.id = a.userId " +
                "LEFT JOIN PhoneEntity ph ON u.id = ph.userId " +
                "WHERE u.id = :id");
        query.setParameter("id", id);
        return getUser(query);
    }

    private RegisterEntity getUser(Query query) {
        List<Object[]> objs = query.getResultList();
        if (objs.size() == 0) return null;
        Object[] result = objs.get(0);
        RegisterEntity user = new RegisterEntity();
        user.setUserEntity((UserEntity) result[0]);
        user.setProfessionsEntity((ProfessionsEntity) result[1]);
        user.setAddressEntity((AddressEntity) result[2]);
        user.setPhoneEntity((PhoneEntity) result[3]);
        user.getUserEntity().setProfilePicture(setProfilePicture(user.getUserEntity())); //call method for setting profile Picture
        return user;
    }
}