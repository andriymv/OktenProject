package ua.lv.service.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.dao.UserDAO;
import ua.lv.entity.User;
import ua.lv.service.UserService;

import java.util.List;

/**
 * Created by User on 19.10.2017.
 */
@Service
@Transactional
public class UserServiceImpl implements UserService,UserDetailsService{
    @Autowired
    UserDAO userDAO;
    @Autowired
    PasswordEncoder passwordEncoder;


    public void save(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userDAO.save(user);
    }

    public User findByName(String username) {
        return userDAO.findByUserName(username);
    }

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return findByName(username);
    }
    public UserDetails loadUserByID (Integer id) throws UsernameNotFoundException {
        return findOne(id);
    }

    public List<User> findAll() {
        return userDAO.findAll();
    }

    public User findOne(int id) {
        return userDAO.findOne(id);
    }

    public void updateUser(int id, String firstName, String lastName, String email, String username, String password) {
        userDAO.updateUser(id, firstName, lastName, email, username, password);
    }

    public void updateUsername(int id, String username) {
        userDAO.updateUsername(id, username);
    }

    public void updateAvatar(String username, String avatar) {
        userDAO.updateAvatar(username, avatar);
    }


}
