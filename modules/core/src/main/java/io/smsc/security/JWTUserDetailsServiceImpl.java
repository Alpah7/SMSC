package io.smsc.security;

import io.smsc.model.User;
import io.smsc.repository.user.UserRepository;
import io.smsc.security.JWTUserFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class JWTUserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public JWTUser loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.getOneByUserNameWithDecryptedPassword(username);
        if (user == null) {
            throw new UsernameNotFoundException(String.format("No user found with username '%s'.", username));
        } else {
            return JWTUserFactory.create(user);
        }
    }

    public JWTUser loadUserByEmail(String email) throws UsernameNotFoundException {
        User user = userRepository.getOneByEmailWithDecryptedPassword(email);
        if (user == null) {
            throw new UsernameNotFoundException(String.format("No user found with email '%s'.", email));
        } else {
            return JWTUserFactory.create(user);
        }
    }
}
