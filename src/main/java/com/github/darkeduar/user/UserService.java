package com.github.darkeduar.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class UserService {

    private UserRepository userRepository;
    private PasswordEncoder passwordEncoder;

    @Autowired
    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public UserDto createUser(UserDto userDto){
        User user = new User();
        user.setEmail(userDto.getEmail());
        user.setPassword(passwordEncoder.encode(userDto.getPassword()));
        user.setEnabled(false);
        userRepository.save(user);
        return null;
    }

    public void enableUser(String uuid){
        User user = userRepository.findOneByUuid(uuid);
        user.setEnabled(true);
        userRepository.save(user);
    }

    public Long getUserIdByEmail(String email){
        User user = userRepository.findOneByEmail(email);
        return user.getId();
    }

    public User getOneById(Long id){
        return userRepository.getOne(id);
    }

}
