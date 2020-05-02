package com.mmall.controller.portal;

import com.mmall.common.Const;
import com.mmall.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class PageController {

    @RequestMapping("register")
    public String register(){


        return "register";
    }

    @RequestMapping("/login")
    public String login(){


        return "login";
    }

    @RequestMapping("/home")
    @ResponseBody
    public ModelAndView home(HttpSession session){
        ModelAndView mav= new ModelAndView();
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            mav.setViewName("login");
            return mav;
        }
        mav.setViewName( "/userHome/myProduct");
        return mav;

    }
    @RequestMapping("/addAddress")
    public String addAddress(){


        return "/userHome/addAddress";
    }
}
