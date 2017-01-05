package com.neuedu.service;

import com.neuedu.bean.Record;
import com.neuedu.dao.mapper.RecordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016-12-23.
 */
@Service
public class RecordService {
    @Autowired
    private RecordMapper recordMapper;

    public int AddRecord(Record record){
        return recordMapper.AddRecord(record);
    }

    public List<Record>QueryRecordByBuyername(Map<String,Object> parameter){
        return recordMapper.QueryRecordByBuyername(parameter);
    }
    public List<Record>QueryAllRecord(Map<String,Object> parameter){
        return recordMapper.QueryAllRecord(parameter);
    }

    public int QueryCount(Map<String,Object> parameter){
        return recordMapper.QueryCount(parameter);
    }

    public int QueryReCount(Map<String,Object> parameter){
        return recordMapper.QueryReCount(parameter);
    }
}
