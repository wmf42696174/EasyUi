package com.neuedu.dao.mapper;

import com.neuedu.bean.Goods;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016-12-19.
 */
@Repository
public interface GoodsMapper {

    public List<Goods>QueryMyGoods(Map<String,Object> map);

    public Goods QueryGoodsById(String id);

    public int ChangeGoodsInfo(Goods goods);

    public int AddGoods(Goods goods);

    public List<Goods>QueryAllyGoods(Map<String,Object> map);

    public List<String>QueryAllUserId();

    public int ChangeGoodsFlag(Goods goods);

    public List<Goods>QueryAllFlagedGoods(Map<String,Object> map);

    public List<String>QueryGoodsType();

    public int QueryCount(Map<String,Object> map);

    public int QueryMyCount(Map<String,Object> map);

    public int QueryFlagedCount(Map<String,Object> map);

    public int DeleteGoodsById(String id);

    public List<Goods>QueryShowGoods();
}
