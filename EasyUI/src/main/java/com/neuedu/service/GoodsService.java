package com.neuedu.service;

import com.neuedu.bean.Goods;
import com.neuedu.dao.mapper.GoodsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016-12-19.
 */
@Service
public class GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;


    public List<Goods>QueryMyGoods(Map<String,Object> map){
        return goodsMapper.QueryMyGoods(map);
    }


    public Goods QueryGoodsById(String id){
        return goodsMapper.QueryGoodsById(id);
    }

    public int ChangeGoodsInfo(Goods goods){
        return goodsMapper.ChangeGoodsInfo(goods);
    }

    public int AddGoods(Goods goods){
        return goodsMapper.AddGoods(goods);
    }
    public List<Goods>QueryAllyGoods(Map<String,Object> map){
        return goodsMapper.QueryAllyGoods(map);
    }
    public int QueryCount(Map<String,Object> map){
        return goodsMapper.QueryCount(map);
    }
    public List<String>QueryAllUserId(){
        return goodsMapper.QueryAllUserId();
    }

    public int ChangeGoodsFlag(Goods goods){
        return goodsMapper.ChangeGoodsFlag(goods);
    }

    public List<Goods>QueryAllFlagedGoods(Map<String,Object> map){return goodsMapper.QueryAllFlagedGoods(map);}

    public List<String>QueryGoodsType(){return goodsMapper.QueryGoodsType();}

    public int QueryMyCount(Map<String,Object> map){
        return goodsMapper.QueryMyCount(map);
    }
    public int QueryFlagedCount(Map<String,Object> map){
        return goodsMapper.QueryFlagedCount(map);
    }
    public int DeleteGoodsById(String id){
        return goodsMapper.DeleteGoodsById(id);
    }
}
