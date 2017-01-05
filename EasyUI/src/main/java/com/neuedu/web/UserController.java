package com.neuedu.web;

import com.neuedu.bean.User;
import com.neuedu.service.UserService;
import com.neuedu.util.SendUtil;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Administrator on 2016-12-16.
 */


@Controller
@RequestMapping("user")
public class UserController {


    private String cid;

    private String ma;
    @Resource
    private SendUtil util;
    @Resource
    private UserService userService;


    @RequestMapping(value = "list",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView QueryAllUser(@RequestParam(value = "index",required = false)String index,
                                     @ModelAttribute("user")User user,
                                     @RequestParam(value = "error",required = false)String error,
                                     @RequestParam(value = "msg",required = false)String msg,
                                     HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
         mv.setViewName("ShowUserListIndex");
        mv.addObject("error",error);
        mv.addObject("msg",msg);
        System.out.println("error"+error);
        return mv;
    }

/*    @RequestMapping(value = "changeuser",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView ChangeUser(@RequestParam(value = "id")String id){
        ModelAndView mv=new ModelAndView();
        User user=userService.QueryUserById(id);
        mv.addObject("user",user);
        mv.setViewName("ChangeUser");
        return mv;
    }*/
    @RequestMapping(value = "changeuserinfo",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView ChangeUserInfo(@ModelAttribute("user")User user){
       // ModelAndView mv=new ModelAndView();
        System.out.println("ceshi"+user.toString());
        int i=userService.ChangeUserInfo(user);
       // mv.addObject("tip","success");
       // mv.setViewName("main");
        return new ModelAndView("redirect:/user/list?index=index&pagenum=1");
    }
    @RequestMapping(value = "deleteuser",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Map<String,Object> DeleteUser(@RequestParam(value = "id")List<String> idList){
       Map<String,Object> map=new HashMap<String, Object>();


        for (String id:idList
             ) {
            int i=userService.DeleteUserById(id);
        }
        map.put("mes","删除成功");
         return map;
    }

    @RequestMapping(value = "changeme",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView ChangeMe(@RequestParam("id")String id){
        ModelAndView mv=new ModelAndView();
        User user=userService.QueryUserById(id);
        mv.addObject("user",user);
        mv.setViewName("ChangeMyInfo");
        return mv;
    }
    @RequestMapping(value = "changemyinfo",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView ChangeMyInfo(@ModelAttribute("user")User user){
        ModelAndView mv=new ModelAndView();
        int i=userService.ChangeMyInfo(user);
      //  mv.setViewName("main");
        return new ModelAndView("redirect:/user/MyInfo");
    }
    @RequestMapping(value = "ChangeUser",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView ChangeUser(@ModelAttribute("user")User user,
                                   HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        System.out.println("改变"+user.toString());
        int i=userService.ChangeMyInfo(user);
        //  mv.setViewName("main");
        String type=(String) request.getSession().getAttribute("type");
        mv.addObject("msg","success");
        if(type.equals("管理员")){
            mv.setViewName("redirect:/user/list");
        }
        else{
            mv.setViewName("redirect:/user/MyInfo");
        }

        return mv;
    }
    @RequestMapping(value = "MyInfo",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView MyInfo(/*HttpServletRequest request*/){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("ShowMyInfo");
        return mv;
    }
    @RequestMapping(value = "QueryMyInfo",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Map<String,Object> QueryMyInfo(HttpServletRequest request){
        Map map=new HashMap();
        String id=(String) request.getSession().getAttribute("loginid");
        User user=userService.QueryUserById(id);
        JsonConfig jsonConfig;
        jsonConfig = new JsonConfig();
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray json = JSONArray.fromObject(user, jsonConfig);
        map.put("rows",json);
        map.put("total",1);
        return map;
    }
    @RequestMapping(value = "MyInfoWIndow",method = {RequestMethod.GET,RequestMethod.POST})
    public String MyInfoWIndow(){
        System.out.println("asdasdashahahahhahahaahhahahah");
        return "MyInfoWIndow";
    }
    @RequestMapping(value = "Return",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView Return(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("main");
        return mv;
    }
    @RequestMapping(value = "/login")
    public ModelAndView getLoginPage(
            @RequestParam(value = "error",required = false) boolean error,ModelAndView mv
    ){
        if(error==true){
            mv.addObject("error",
                    "You have entered an invalid username or password!");
        }
        else{
            mv.addObject("error", "success");
        }
        System.out.println("跳转到验证页面");
        mv.setViewName("login");
        return mv;
    }

    @RequestMapping(value = "/check",method = {RequestMethod.POST,
            RequestMethod.GET })
    public ModelAndView CheckUser(HttpServletRequest request){
        Object principle= SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        System.out.println(principle.toString());
        User user=(User)principle;
        System.out.println("yanzheng"+user.toString());
        request.getSession().setAttribute("loginid",user.getId());
        request.getSession().setAttribute("password",user.getPassword());
        request.getSession().setAttribute("username",user.getUserName());
        request.getSession().setAttribute("type",user.getType());
        ModelAndView mv=new ModelAndView();
        mv.addObject("loginid",user.getId());
        mv.addObject("username",user.getUserName());
        System.out.println("跳转到主界面");
        mv.setViewName("main");
        return mv;
    }

    @RequestMapping(value = "/regist",method = {RequestMethod.GET,RequestMethod.POST})
    public String Regist(){
        return "regist";
    }
    @RequestMapping(value = "AddUser",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView AddUser(@ModelAttribute("user")User user){
        System.out.println("asdasdsad哈"+user.toString());
        User checkUSer=userService.CheckUser(user.getUserName());
        ModelAndView mv=new ModelAndView();
        if(checkUSer!=null){
            mv.addObject("error","fail");
            mv.setViewName("redirect:/user/list");
            return mv;
        }
        mv.addObject("error", "success");
        String s= UUID.randomUUID().toString();
        String id=s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
        user.setId(id);
        if(user.getType().equals("卖方")){
            user.setRole("ROLE_USER");
        }
        else{
            user.setRole("ROLE_SALE");
        }
        mv.setViewName("redirect:/user/list");
        userService.AddUser(user);
        return mv;
    }

    @RequestMapping(value = "getback",method = {RequestMethod.GET,RequestMethod.POST})
    public String GetBack(){
        return "getback";
    }
    @RequestMapping(value = "yanzheng")
    public String SendEmail(@RequestParam String id)throws Exception{
        cid=id;
        System.out.println("asdasdas"+id);
        String email=userService.CheckUser(id).getEmail();
        ma= util.SendMail(email);
        System.out.println(ma);
        return "getback";
    }
    @RequestMapping(value = "he")
    public @ResponseBody
    User check(@RequestParam String yan){
        if(yan.equals(ma)){
            User user=userService.CheckUser(cid);
            return user;
        }
        return null;
    }
    @RequestMapping(value = "show")
    public String Show(){
        return "homePage";
    }
    @RequestMapping(value = "querylist",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Map<String,Object> querylist(@RequestParam("page")int page,
                                        @RequestParam("rows")int rows,
                                        @RequestParam(value = "userName",required = false)String userName,
                                        @RequestParam(value = "sex",required = false)String sex){
        System.out.println("访问了=========="+page+"======="+rows+"ssssssss"+userName+"===="+sex);
        Map<String,Object> parameter=new HashMap<String, Object>();
        parameter.put("page",(page-1)*rows);
        parameter.put("rows",rows);
        parameter.put("userName",userName);
        parameter.put("sex",sex);
        List<User> userList=userService.QueryUserList(parameter);
        int total=userService.QueryTotal(parameter);
        JsonConfig jsonConfig;
        Map<String,Object> map=new HashMap<String, Object>();
        jsonConfig = new JsonConfig();
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray json = JSONArray.fromObject(userList, jsonConfig);
        map.put("rows",json);
        map.put("total",total);
        System.out.println(json);
        return map;
    }
    @RequestMapping(value = "popwindow",method = {RequestMethod.GET,RequestMethod.POST})
    public String PopWindow(){
        return "PopWindow";
    }

}
