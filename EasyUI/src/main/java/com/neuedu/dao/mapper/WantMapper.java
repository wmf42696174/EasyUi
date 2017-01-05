package com.neuedu.dao.mapper;

import com.neuedu.bean.Want;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016-12-24.
 */
@Repository
public interface WantMapper {
    public int AddWant(Want want);
    public List<Want>QueryAllWant(Map<String, Object> parameter);
    public List<String>QueryAllName();
    public int QueryCount(Map<String, Object> parameter);
    public int DeleteWantById(String id);
    public int ChangeWant(Want want);
}
