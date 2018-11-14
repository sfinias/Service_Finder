package utils;

import dao.UserDAOInterface;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.Collections;

/**
 * @author tsamo
 */
public class MyUserDetailsService {

    @Autowired
    UserDAOInterface userDAOInterface;

    public UserDetails loadUserByUsername(String email)
            throws UsernameNotFoundException {

        boolean enabled = true;
        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;
        try {
            User user = userDAOInterface.findUserByEmail(email);
            if (user == null) {
                throw new UsernameNotFoundException(
                        "No user found with username: " + email);
            }

            return new org.springframework.security.core.userdetails.User(
                    user.getEmail(),
                    user.getPass().toLowerCase(),
                    user.getEnabled(),
                    accountNonExpired,
                    credentialsNonExpired,
                    accountNonLocked,
                    Collections.singleton(new SimpleGrantedAuthority("ROLE_ADMIN")));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
