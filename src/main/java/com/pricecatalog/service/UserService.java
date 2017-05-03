package com.pricecatalog.service;


import com.pricecatalog.dao.UserDao;
import com.pricecatalog.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by sukey on 2016/10/27.
 */
@Service
public class UserService {

    @Autowired
    private UserDao userDao;


    public void saveUser(User user) {
        userDao.save(user);

    }
}
