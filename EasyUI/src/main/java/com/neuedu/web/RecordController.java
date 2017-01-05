package com.neuedu.web;

import com.neuedu.bean.Goods;
import com.neuedu.bean.Record;
import com.neuedu.service.GoodsService;
import com.neuedu.service.RecordService;
import com.neuedu.service.UserService;
import com.neuedu.util.TimeUtil;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Administrator on 2016-12-23.
 */
@Controller
@RequestMapping(value = "record")
public class RecordController {

    @Autowired
    private RecordService recordService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private UserService userService;
    @Autowired
    private TimeUtil timeUtil;
    @RequestMapping(value = "AddRecord",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView AddRecord(@ModelAttribute("record")Record record,
                                  @RequestParam("id")String id,
                                  @RequestParam("name")String name,
                                  @RequestParam("price")float price,
                                  HttpServletRequest request){
        ModelAndView mv=new ModelAndView("redirect:/goods/showallgoods");
        Goods goods=goodsService.QueryGoodsById(id);
        if((goods.getNum()-record.getGnum())<0){
            mv.addObject("msg","fail");
            return mv;
        }else{
            mv.addObject("msg","success");
        }
        goods.setNum(goods.getNum()-record.getGnum());
        goodsService.ChangeGoodsFlag(goods);
        String userid=goods.getUserid();
        String salename=userService.QueryUserNameById(userid);
        String buyername=(String) request.getSession().getAttribute("username");
        record.setBuyername(buyername);
        record.setSalename(salename);
        record.setGname(name);
        record.setGprice(price);
        String s= UUID.randomUUID().toString();
        String rid=s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
        record.setId(rid);
        record.setTimes(new Date());
        recordService.AddRecord(record);

       // mv.setViewName("main");
        return mv;
    }
    @RequestMapping(value = "showmyrecord",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView ShowMyRecord(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("ShowMyRecordListIndex");
        return mv;
    }
    @RequestMapping(value = "showallrecordlist",method ={RequestMethod.POST,RequestMethod.GET})
    public ModelAndView ShowAllRecordList(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("ShowAllRecordListIndex");
        return mv;
    }

    @RequestMapping(value = "querymyrecordlist",method ={RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Map<String,Object> QueryMyRecordList(@RequestParam(value = "begintime",required = false)String begintime,
                                                 @RequestParam(value = "endtime",required = false)String endtime,
                                                 @RequestParam(value = "page",required = false)int page,
                                                 @RequestParam(value = "rows",required = false)int rows,
                                                HttpServletRequest request){
        Map<String,Object> parameter=new HashMap<String, Object>();
        String buyername=(String) request.getSession().getAttribute("username");
        parameter.put("buyername",buyername);
        if(begintime!=null&&begintime!=""){
            parameter.put("begintime",timeUtil.TranslatTime(begintime));
        }
        if(endtime!=null&&endtime!=""){
            parameter.put("endtime",timeUtil.TranslatTime(endtime));
        }

        parameter.put("page",(page-1)*rows);
        parameter.put("rows",rows);
        List<Record> recordList=recordService.QueryRecordByBuyername(parameter);
        int total=recordService.QueryReCount(parameter);
        JsonConfig jsonConfig;
        Map<String,Object> map=new HashMap<String, Object>();
        jsonConfig = new JsonConfig();
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray json = JSONArray.fromObject(recordList, jsonConfig);
        map.put("rows",json);
        map.put("total",total);
        return map;
    }
    @RequestMapping(value = "queryallrecordlist",method ={RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Map<String,Object> QueryAllRecordList(@RequestParam(value = "begintime",required = false)String begintime,
                                                 @RequestParam(value = "endtime",required = false)String endtime,
                                                 @RequestParam(value = "page",required = false)int page,
                                                 @RequestParam(value = "rows",required = false)int rows){
        Map<String,Object> parameter=new HashMap<String, Object>();
        System.out.println(begintime+"======="+endtime);
        if(begintime!=null&&begintime!=""){
            parameter.put("begintime",timeUtil.TranslatTime(begintime));
        }
        if(endtime!=null&&endtime!=""){
            parameter.put("endtime",timeUtil.TranslatTime(endtime));
        }

        parameter.put("page",(page-1)*rows);
        parameter.put("rows",rows);
        List<Record> recordList=recordService.QueryAllRecord(parameter);
        int total=recordService.QueryCount(parameter);
        JsonConfig jsonConfig;
        Map<String,Object> map=new HashMap<String, Object>();
        jsonConfig = new JsonConfig();
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray json = JSONArray.fromObject(recordList, jsonConfig);
        map.put("rows",json);
        map.put("total",total);
        return map;
    }
}
