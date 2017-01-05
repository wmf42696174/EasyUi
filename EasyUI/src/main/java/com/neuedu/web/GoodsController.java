package com.neuedu.web;

import com.neuedu.bean.Goods;
import com.neuedu.bean.User;
import com.neuedu.service.GoodsService;
import com.neuedu.service.UserService;
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
 * Created by Administrator on 2016-12-19.
 */
@Controller
@RequestMapping("goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "showmygoodslist",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView ShowMyGoodsList(@RequestParam(value = "msg",required = false)String msg,
                                        @RequestParam(value = "error",required = false)String error){
        ModelAndView mv=new ModelAndView();
        mv.addObject("msg",msg);
        mv.addObject("error",error);
        mv.setViewName("ShowMyGoodsListIndex");
        return mv;
    }
    @RequestMapping(value = "querygoodslist",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Map<String,Object> QueryGoodsList(@RequestParam(value = "name",required = false)String name,
                                             @RequestParam(value = "flag",required = false)String flag,
                                             @RequestParam(value = "page",required = false)int page,
                                             @RequestParam(value = "rows",required = false)int rows,
                                             HttpServletRequest request){

        Map<String,Object> parameter=new HashMap<String, Object>();
        String userid=(String)request.getSession().getAttribute("loginid");
        parameter.put("userid",userid);
        parameter.put("name",name);
        parameter.put("flag",flag);
        parameter.put("rows",rows);
        parameter.put("page",(page-1)*rows);
        List<Goods> goodsList=goodsService.QueryMyGoods(parameter);
        int total=goodsService.QueryMyCount(parameter);
        JsonConfig jsonConfig;
        Map<String,Object> map=new HashMap<String, Object>();
        jsonConfig = new JsonConfig();
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray json = JSONArray.fromObject(goodsList, jsonConfig);
        map.put("rows",json);
        map.put("total",total);
        System.out.println(json);
        return map;

    }
    @RequestMapping(value = "goodsPopWindow",method = {RequestMethod.POST,RequestMethod.GET})
    public String GoodsPopWindow(){
        return "GoodsPopWindow";
    }
    @RequestMapping(value = "changegoods",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView ChangeGoods(@RequestParam("id")String id){
        ModelAndView mv=new ModelAndView();
        Goods goods=goodsService.QueryGoodsById(id);
        mv.addObject("Goods",goods);
        mv.setViewName("ChangeGoods");
        return mv;
    }
    @RequestMapping(value = "deletegoods",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Map<String,Object> DeleteGoods(@RequestParam("id")List<String> idlist){
        System.out.println("asdasd今如"+idlist);
        Map<String,Object> map=new HashMap<String, Object>();
        for (String id:idlist
             ) {
            goodsService.DeleteGoodsById(id);
        }
        map.put("mes","删除成功");
        return map;
    }
    @RequestMapping(value = "UpdateGoodsWindow",method = {RequestMethod.POST,RequestMethod.GET})
    public String UpdateGoodsWindow(){
        return "UpdateGoodsWindow";
    }
    @RequestMapping(value = "changegoodsinfo",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView ChangeGoodsInfo(@ModelAttribute("goods")Goods goods){
        ModelAndView mv=new ModelAndView();
        int i=goodsService.ChangeGoodsInfo(goods);
        mv.addObject("error","success");
        mv.setViewName("redirect:/goods/showmygoodslist");
        return mv;
    }

    @RequestMapping(value = "add",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView Add(@ModelAttribute("goods")Goods goods,
                            HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        System.out.println(goods.toString());
        String s= UUID.randomUUID().toString();
        String id=s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
         goods.setId(id);
        goods.setFlag(2);
        String userid=(String)request.getSession().getAttribute("loginid");
        goods.setUserid(userid);
        int i=goodsService.AddGoods(goods);
        mv.addObject("msg","success");
        mv.setViewName("redirect:/goods/showmygoodslist");
        return mv;
    }
    @RequestMapping(value = "checkgoods",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView CheckGoods(){
       /* List<User> userList=new ArrayList<User>();
        User user=null;
        int current=goods.getPagenum();
        System.out.println("sd"+current);
        goods.setPagenum((current-1)*4);
        int count=goodsService.QueryCount(goods);
        if(count%4!=0){
            count=count/4+1;
        }else{
            count=count/4;
        }
        List<String> idList=goodsService.QueryAllUserId();
        for (String id:idList) {
            user=userService.QueryUserById(id);
            userList.add(user);
        }*/
        ModelAndView mv=new ModelAndView();
      /*  mv.addObject("userList",userList);
        mv.addObject("count",count);
        mv.addObject("goods",goods);
        mv.addObject("currentpagenum",current);
        List<Goods> goodsList=goodsService.QueryAllyGoods(goods);
        mv.addObject("goodsList",goodsList);*/
        mv.setViewName("CheckGoodsListIndex");
        return mv;
    }

    @RequestMapping(value = "queryname",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public JSON QueryName(){
        Map<String,Object> map=new HashMap<String, Object>();
        List<String> idList=goodsService.QueryAllUserId();
        List<Map<String,Object>> list=new ArrayList<Map<String, Object>>();
        Map<String,Object> temp=null;
        for (String id:idList) {
            temp=new HashMap<String, Object>();
            User user=userService.QueryUserById(id);
            temp.put("id",id);
            temp.put("text",user.getUserName());
            list.add(temp);
        }
        Map<String,Object> defaul=new HashMap<String, Object>();
        defaul.put("id","");
        defaul.put("text","全部");
        list.add(defaul);
        JsonConfig jsonConfig;
        jsonConfig = new JsonConfig();
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray json = JSONArray.fromObject(list, jsonConfig);
        System.out.println("json");
        return json;
    }
    @RequestMapping(value = "querycheckgoodslist",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Map<String,Object> QueryCheckGoodsList(@RequestParam(value = "userid",required = false)String userid,
                                                  @RequestParam(value = "flag",required = false)String flag,
                                                  @RequestParam(value = "page",required = false)int page,
                                                  @RequestParam(value = "rows",required = false)int rows,
                                                  HttpServletRequest request){
        Map<String,Object> parameter=new HashMap<String, Object>();
        parameter.put("userid",userid);
        parameter.put("flag",flag);
        parameter.put("page",(page-1)*rows);
        parameter.put("rows",rows);
        List<Goods> goodsList=goodsService.QueryAllyGoods(parameter);
        int total=goodsService.QueryCount(parameter);
        JsonConfig jsonConfig;
        Map<String,Object> map=new HashMap<String, Object>();
        jsonConfig = new JsonConfig();
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray json = JSONArray.fromObject(goodsList, jsonConfig);
        map.put("rows",json);
        map.put("total",total);
        return map;
    }
    @RequestMapping(value = "Check",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Map<String,Object> Check(@RequestParam("id")String id,
                                       @RequestParam("flag")int flag){
        Map<String,Object> map=new HashMap<String, Object>();
        Goods goods=new Goods();
        goods.setId(id);
        goods.setFlag(flag);
        System.out.println("goods是"+goods);
        goodsService.ChangeGoodsFlag(goods);
        map.put("mes","审核成功");
        return map;
    }
    @RequestMapping(value = "changeflag",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView ChangeFlag(@ModelAttribute("goods")Goods goods){
        System.out.println("asd"+goods.toString());
        int i=goodsService.ChangeGoodsFlag(goods);
        ModelAndView mv=new ModelAndView("redirect:/goods/checkgoods?pagenum=1");
        mv.addObject("changetip","success");
       // mv.setViewName("main");
        return mv;

    }
    @RequestMapping(value = "showallgoods",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView ShowAllGoods(@RequestParam(value = "msg",required = false)String msg){
        ModelAndView mv=new ModelAndView();
       mv.addObject("msg",msg);
        mv.setViewName("ShowFlagedGoodsListIndex");
        return mv;
    }

    @RequestMapping(value = "queryflagedgoodslist",method = {RequestMethod.POST,RequestMethod.GET})
     @ResponseBody
     public Map<String,Object> QueryFlagedGoodsList(@RequestParam(value = "page",required = false)int page,
                                                    @RequestParam(value = "rows",required = false)int rows,
                                                    @RequestParam(value = "name",required = false)String name,
                                                    @RequestParam(value = "type",required = false)String type){
        Map<String,Object> parameter=new HashMap<String, Object>();
        System.out.println("page"+page+"rows"+rows+"name"+name+"type"+type);
        parameter.put("page",(page-1)*rows);
        parameter.put("rows",rows);
        parameter.put("name",name);
        parameter.put("type",type);
        List<Goods> goodsList=goodsService.QueryAllFlagedGoods(parameter);
        int total=goodsService.QueryFlagedCount(parameter);
        JsonConfig jsonConfig;
        Map<String,Object> map=new HashMap<String, Object>();
        jsonConfig = new JsonConfig();
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray json = JSONArray.fromObject(goodsList, jsonConfig);
        map.put("rows",json);
        map.put("total",total);
        return map;
    }
    @RequestMapping(value = "BuyGoods",method = {RequestMethod.GET,RequestMethod.POST})
    public String BuyGoods(){
        return "BuyPopWindow";
    }
    @RequestMapping(value = "buygoods",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView BuyGoods(@RequestParam("id")String id){
        ModelAndView mv=new ModelAndView();
        Goods goods=goodsService.QueryGoodsById(id);
        mv.addObject("Goods",goods);
        mv.setViewName("BuyGoods");
        return mv;
    }
}
