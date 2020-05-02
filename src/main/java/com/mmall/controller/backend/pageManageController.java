package com.mmall.controller.backend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class pageManageController {

    @RequestMapping("addproduct")
    public  String addproduct(){
        return "/admin/addproduct";
    }

    @RequestMapping("addproduct2")
    public  String addproduct2(){
        return "addproduct";
    }

    @RequestMapping("loginManage")
    public  String loginManage(){
        return "/admin/login";
    }

    @RequestMapping("activityManage")
    public  String activityManage(){
        return "/admin/activity";
    }
}
