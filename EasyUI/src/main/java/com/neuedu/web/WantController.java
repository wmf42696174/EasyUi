package com.neuedu.web;

import com.neuedu.bean.Goods;
import com.neuedu.bean.Want;
import com.neuedu.service.GoodsService;
import com.neuedu.service.WantService;
import com.neuedu.util.RandomUtil;
import com.sun.javafx.sg.PGShape;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by Administrator on 2016-12-24.
 */
@Controller
@RequestMapping("want")
public class WantController {

    @Autowired
    private WantService wantService;
    @Autowired
    private RandomUtil randomUtil;
    @Autowired
    private GoodsService goodsService;
    @RequestMapping(value = "addwant",method = {RequestMethod.GET,RequestMethod.POST})
    public String AddWant(){
        return "AddWantPopWindow";
    }
    @RequestMapping(value = "add",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView Add(@ModelAttribute("want")Want want,
                            HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        String buyername=(String) request.getSession().getAttribute("username");
        want.setBuyername(buyername);
        String s= UUID.randomUUID().toString();
        String id=s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
        want.setId(id);
        wantService.AddWant(want);
        mv.setViewName("redirect:/want/showmywantlist");
        return mv;
    }
    @RequestMapping(value = "return",method = {RequestMethod.GET,RequestMethod.POST})
    public String Return(){return "main";}
    @RequestMapping(value = "showwantlist",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView ShowWantList(){
       ModelAndView mv=new ModelAndView();
        mv.setViewName("ShowWantListIndex");
        return mv;
    }

    @RequestMapping(value = "showmywantlist",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView ShowMyWantList(@RequestParam(value = "msg",required = false)String msg){
        ModelAndView mv=new ModelAndView("ShowMyWantList");
        mv.addObject("msg",msg);
        return mv;
    }

    @RequestMapping(value = "show",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView Show()
    {
        ModelAndView mv=new ModelAndView();
        Want want=new Want();
        List<Want> showWantList=new ArrayList<Want>();
        List<Want> wantList=wantService.QueryShowWant(want);
        List<Goods> goodsList=goodsService.QueryShowGoods();
        List<Goods> showGoodsList=new ArrayList<Goods>();
        List<Integer> a=randomUtil.getNumer(wantList.size());
        Want temp;
        for(int i=0;i<5;i++){
            temp=wantList.get(a.get(i));
            showWantList.add(temp);
        }
        List<Integer> b=randomUtil.getNumer(goodsList.size());
        Goods tempGoods;
        for(int i=0;i<5;i++){
            tempGoods=goodsList.get(a.get(i));
            showGoodsList.add(tempGoods);
        }
        mv.addObject("showWantList",showWantList);
        mv.addObject("showGoodsList",showGoodsList);
        mv.setViewName("homePage");
        return mv;
    }
    @RequestMapping(value = "querymywantlist",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Map<String,Object> queryMywantlist( @RequestParam(value = "minprice",required = false)String minprice,
                                            @RequestParam(value = "maxprice",required = false)String maxprice,
                                            @RequestParam(value = "page",required = false)int page,
                                            @RequestParam(value = "rows",required = false)int rows,
                                               HttpServletRequest request){
        String userName=(String) request.getSession().getAttribute("username");
        Map<String,Object> parameter=new HashMap<String, Object>();
        parameter.put("buyername",userName);
        parameter.put("minprice",minprice);
        parameter.put("maxprice",maxprice);
        parameter.put("rows",rows);
        parameter.put("page",(page-1)*rows);
        List<Want> wantList=wantService.QueryAllWant(parameter);
        int total=wantService.QueryCount(parameter);
        JsonConfig jsonConfig;
        Map<String,Object> map=new HashMap<String, Object>();
        jsonConfig = new JsonConfig();
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray json = JSONArray.fromObject(wantList, jsonConfig);
        map.put("rows",json);
        map.put("total",total);
        return map;
    }
    @RequestMapping(value = "querywantlist",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Map<String,Object> querywantlist(@RequestParam(value = "buyername",required = false)String buyername,
                                            @RequestParam(value = "minprice",required = false)String minprice,
                                            @RequestParam(value = "maxprice",required = false)String maxprice,
                                            @RequestParam(value = "page",required = false)int page,
                                            @RequestParam(value = "rows",required = false)int rows){

        Map<String,Object> parameter=new HashMap<String, Object>();

        parameter.put("buyername",buyername);
        parameter.put("minprice",minprice);
        parameter.put("maxprice",maxprice);
        parameter.put("rows",rows);
        parameter.put("page",(page-1)*rows);
        List<Want> wantList=wantService.QueryAllWant(parameter);
        int total=wantService.QueryCount(parameter);
        JsonConfig jsonConfig;
        Map<String,Object> map=new HashMap<String, Object>();
        jsonConfig = new JsonConfig();
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray json = JSONArray.fromObject(wantList, jsonConfig);
        map.put("rows",json);
        map.put("total",total);
        return map;
    }
    @RequestMapping(value = "queryname",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public JSON QueryName(){
        System.out.println("queryname===============");
        Map<String,Object> map=new HashMap<String, Object>();
        List<String>nameList=wantService.QueryAllName();
        List<Map<String,Object>> list=new ArrayList<Map<String, Object>>();
        Map<String,Object> temp=null;
        for (String name:nameList
             ) {
            temp=new HashMap<String, Object>();
            temp.put("id",name);
            temp.put("text",name);
            list.add(temp);
        }
        JsonConfig jsonConfig;
        jsonConfig = new JsonConfig();
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray json = JSONArray.fromObject(list, jsonConfig);
        map.put("name",json);
        System.out.println(json);
        return json;
    }
    @RequestMapping(value = "deletewants",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Map<String,Object> DeleteWants(@RequestParam("id")List<String> idList){
        for (String id:idList
             ) {
            wantService.DeleteWantById(id);
        }
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("mes","删除成功");
        return map;
    }

    @RequestMapping(value = "updateWant",method = {RequestMethod.POST,RequestMethod.GET})
    public String UpdateWant(){
        return "UpdateWantWindow";
    }

    @RequestMapping(value = "ChangeWant",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView ChangeWant(@ModelAttribute("want")Want want){
        System.out.println("asdas"+want.toString());
        wantService.ChangeWant(want);
        ModelAndView mv=new ModelAndView("redirect:/want/showmywantlist");
        mv.addObject("msg","success");
        return mv;
    }
}
