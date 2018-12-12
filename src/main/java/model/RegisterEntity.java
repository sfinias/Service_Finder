package model;

import javax.validation.Valid;

/**
 * @author tsamo
 */
public class RegisterEntity {
    @Valid
    private UserEntity userEntity;

    @Valid
    private PhoneEntity phoneEntity;

    @Valid
    private AddressEntity addressEntity;

    @Valid
    private ProfessionsEntity professionEntity;

    @Valid
    public UserEntity getUserEntity() {
        return userEntity;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }

    @Valid
    public PhoneEntity getPhoneEntity() {
        return phoneEntity;
    }

    public void setPhoneEntity(PhoneEntity phoneEntity) {
        this.phoneEntity = phoneEntity;
    }

    @Valid
    public AddressEntity getAddressEntity() {
        return addressEntity;
    }

    public void setAddressEntity(AddressEntity addressEntity) {
        this.addressEntity = addressEntity;
    }

    @Valid
    public ProfessionsEntity getProfessionEntity() {
        return professionEntity;
    }

    public void setProfessionEntity(ProfessionsEntity professionEntity) {
        this.professionEntity = professionEntity;
    }
}
