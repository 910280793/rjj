package com.mmall.controller.portal;

import com.mmall.common.Const;
import com.mmall.common.ServerResponse;
import com.mmall.pojo.Order;
import com.mmall.pojo.User;
import com.mmall.service.IOrderService;
import com.mmall.vo.OrderVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import trade.PayUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class PayController {
    @Autowired
    private IOrderService iOrderService;

    @RequestMapping("payPage")
    @ResponseBody
    public ModelAndView payPage(Long orderNo, HttpSession session, HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView();
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            modelAndView.setViewName("login");
            return  modelAndView;
        }

        ServerResponse<OrderVo> response=iOrderService.getOrderDetail(user.getId(),orderNo);
        PayUtil payUtil=new PayUtil();
        OrderVo orderVo=response.getData();
        String name=payUtil.test_trade_precreate(orderVo,request);
        HashMap map=new HashMap();
        map.put("name",name);
        map.put("total",orderVo.getPayment());
        map.put("orderNo",orderVo.getOrderNo());
        modelAndView.addObject("map",map);
        modelAndView.setViewName("paySm");
        return modelAndView;
    }

    @RequestMapping("queryPay.do")
    @ResponseBody
    public ServerResponse queryPay(String orderNo){
        PayUtil payUtil=new PayUtil();
        String re=payUtil.test_trade_query(orderNo);
        if(re=="SUCCESS"){
            Order o=new Order();
            o.setOrderNo(Long.valueOf(orderNo));
            o.setStatus(20);
            iOrderService.updateOrder(o);
            return ServerResponse.createBySuccess();
        }
        return ServerResponse.createByError();
    }


}
