package com.neuedu.dao.mapper;

import com.neuedu.bean.User;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016-12-15.
 */
@Repository
public interface UserMapper {

    public User CheckUser(String userName);
    public List<User> QueryAllUser(User user);
    public User QueryUserById(String id);
    public int ChangeUserInfo(User user);
    public int DeleteUserById(String id);
    public int ChangeMyInfo(User user);
    public List<User>QueryAllUserByType();
    public String QueryIdByUserName(String userName);
    public String QueryUserNameById(String id);
    public int AddUser(User user);
    public int QueryCount(User user);
    public List<User> QueryUserList(Map<String,Object> map);
    public int QueryTotal(Map<String,Object> map);

}
