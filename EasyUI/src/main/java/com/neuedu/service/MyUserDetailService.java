package com.neuedu.service;

import com.neuedu.bean.User;
import com.neuedu.dao.mapper.UserMapper;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2016-12-15.
 */
public class MyUserDetailService implements UserDetailsService {

    @Resource

    private UserMapper userMapper;

    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {

        User user=userMapper.CheckUser(s);

        return user;
    }
}
