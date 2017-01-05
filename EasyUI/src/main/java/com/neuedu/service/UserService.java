package com.neuedu.service;

import com.github.pagehelper.PageHelper;
import com.neuedu.bean.User;
import com.neuedu.bean.Want;
import com.neuedu.dao.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016-12-15.
 */
@Service
public class UserService {


    @Autowired
    private UserMapper userMapper;


    public List<User> QueryAllUser(User user){
        //PageHelper.startPage(pagenum,3);
        List<User> userList=userMapper.QueryAllUser(user);
        System.out.println("大小"+userList.size());
        return userList;
    }

    public int QueryCount(User user){
        return userMapper.QueryCount(user);
    }
    public User CheckUser(String userName){
        return  userMapper.CheckUser(userName);
    }
    public User QueryUserById(String id){
        return userMapper.QueryUserById(id);
    }

    public int ChangeUserInfo(User user){
        return userMapper.ChangeUserInfo(user);
    }

    public int DeleteUserById(String id){
        return userMapper.DeleteUserById(id);
    }
    public int ChangeMyInfo(User user){return userMapper.ChangeMyInfo(user);}
    public List<User>QueryAllUserByType(){return userMapper.QueryAllUserByType();}
    public String QueryIdByUserName(String userName){return userMapper.QueryIdByUserName(userName);}
    public String QueryUserNameById(String id){return userMapper.QueryUserNameById(id);}
    public int AddUser(User user){return userMapper.AddUser(user);}
    public List<User> QueryUserList(Map<String,Object> map){
        return userMapper.QueryUserList(map);
    }
    public int QueryTotal(Map<String,Object> map){
        return userMapper.QueryTotal(map);
    }

}
