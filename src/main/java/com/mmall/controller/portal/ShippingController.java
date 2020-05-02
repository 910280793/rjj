package com.mmall.controller.portal;

import com.github.pagehelper.PageInfo;
import com.mmall.common.Const;
import com.mmall.common.ResponseCode;
import com.mmall.common.ServerResponse;
import com.mmall.pojo.Shipping;
import com.mmall.pojo.User;
import com.mmall.service.IShippingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.UUID;

/**
 * Created by ll
 */

@Controller
public class ShippingController {


    @Autowired
    private IShippingService iShippingService;


    @RequestMapping("Shippingadd.do")
    @ResponseBody
    public ServerResponse add(HttpSession session,Shipping shipping){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        return iShippingService.add(user.getId(),shipping);
    }


    @RequestMapping("shippingdel.do")
    @ResponseBody
    public ServerResponse del(HttpSession session,String shippingId){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        return iShippingService.del(user.getId(),shippingId);
    }

    @RequestMapping("shippingupdate.do")
    @ResponseBody
    public ServerResponse update(HttpSession session,Shipping shipping){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        return iShippingService.update(user.getId(),shipping);
    }


    @RequestMapping("shippingselect.do")
    @ResponseBody
    public ServerResponse<Shipping> select(HttpSession session,String shippingId){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        return iShippingService.select(user.getId(),shippingId);
    }

    @RequestMapping("updataship")
    @ResponseBody
    public ModelAndView updataship(HttpSession session,String shippingId){
        ModelAndView modelAndView=new ModelAndView();
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        ServerResponse response= iShippingService.select(user.getId(),shippingId);
        modelAndView.setViewName("userHome/updataAddress");
        modelAndView.addObject("data",response.getData());
        return modelAndView;
    }


    @RequestMapping("shippinglist.do")
    @ResponseBody
    public ModelAndView list(@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                             @RequestParam(value = "pageSize",defaultValue = "10")int pageSize,
                             HttpSession session){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        ModelAndView modelAndView=new ModelAndView();
        if(user ==null){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        modelAndView.setViewName("/userHome/myAddressHome");
        modelAndView.addObject("page",iShippingService.list(user.getId(),pageNum,pageSize).getData());
        return modelAndView;
    }

    @RequestMapping("shiplist.do")
    @ResponseBody
    public ServerResponse shiplist(@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                             @RequestParam(value = "pageSize",defaultValue = "10")int pageSize,
                             HttpSession session){
        User user = (User)session.getAttribute(Const.CURRENT_USER);

        if(user !=null){
         return iShippingService.list(user.getId(),pageNum,pageSize);
        }
       return ServerResponse.createByError();
    }

    @RequestMapping("addAddress.do")
    @ResponseBody
    public ModelAndView addAddre(Shipping shipping, HttpSession session){
        ModelAndView mav= new ModelAndView();
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            mav.setViewName("login");
            return mav;
        }
        if(shipping.getId()=="") {
            shipping.setId(UUID.randomUUID().toString());
            iShippingService.add(user.getId(), shipping);
        }else {
            iShippingService.update(user.getId(),shipping);
        }
        mav.setViewName("/userHome/myAddressHome");
        mav.addObject("page",iShippingService.list(user.getId(),1,5).getData());

        return mav;
    }












}
