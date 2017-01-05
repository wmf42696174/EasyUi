package com.neuedu.dao.mapper;

import com.neuedu.bean.Record;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016-12-23.
 */
@Repository
public interface RecordMapper {
    public int AddRecord(Record record);

    public List<Record> QueryRecordByBuyername(Map<String, Object> parameter);

    public List<Record>QueryAllRecord(Map<String, Object> parameter);

    public int QueryCount(Map<String, Object> parameter);

    public int QueryReCount(Map<String, Object> parameter);
}
