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

    public UserEntity getUserEntity() {
        return userEntity;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }

    public PhoneEntity getPhoneEntity() {
        return phoneEntity;
    }

    public void setPhoneEntity(PhoneEntity phoneEntity) {
        this.phoneEntity = phoneEntity;
    }

    public AddressEntity getAddressEntity() {
        return addressEntity;
    }

    public void setAddressEntity(AddressEntity addressEntity) {
        this.addressEntity = addressEntity;
    }
}
