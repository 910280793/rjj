package com.mmall.controller.portal;


import com.mmall.common.Const;
import com.mmall.common.ResponseCode;
import com.mmall.common.ServerResponse;
import com.mmall.pojo.Order;
import com.mmall.pojo.Shipping;
import com.mmall.pojo.User;
import com.mmall.service.IOrderService;
import com.mmall.service.IShippingService;
import com.mmall.vo.OrderProductVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.UUID;

/**
 * Created by ll
 */

@Controller
public class OrderController {

    private static  final Logger logger = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private IOrderService iOrderService;
  @Autowired
  private IShippingService iShippingService;

    @RequestMapping("createOrder.do")
    @ResponseBody
    public ServerResponse create(HttpSession session, String shippingId){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        return iOrderService.createOrder(user.getId(),shippingId);
    }
    @RequestMapping("createOrder2.do")
    @ResponseBody
    public ModelAndView create2(HttpSession session, Shipping shipping){
        ModelAndView mav=new ModelAndView();
        shipping.setId(UUID.randomUUID().toString());
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            mav.setViewName("login");
        }
     iOrderService.createOrder(user.getId(),shipping.getId());
        ServerResponse serverResponse=iOrderService.getOrderList(user.getId(),1,10);
        mav.addObject("page",serverResponse.getData());
        mav.setViewName("orderpage");
        return mav;
    }


    @RequestMapping("cancelOrder.do")
    @ResponseBody
    public ServerResponse cancel(HttpSession session, Long orderNo){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        return iOrderService.cancel(user.getId(),orderNo);
    }

    @RequestMapping("ostatus.do")
    @ResponseBody
    public ServerResponse cancel(HttpSession session, Order order) {
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        return iOrderService.updateOrder(order);
    }


    @RequestMapping("get_order_cart_product.do")
    @ResponseBody
    public ModelAndView getOrderCartProduct(HttpSession session){
        ModelAndView mav = new ModelAndView();
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            mav.setViewName("login");
            return mav ;
        }
        ServerResponse<OrderProductVo> serverResponse=iOrderService.getOrderCartProduct(user.getId());
        mav.addObject("order",serverResponse.getData());
        mav.setViewName("pay");
        return mav ;
    }



    @RequestMapping("detailOrder.do")
    @ResponseBody
    public ServerResponse detail(HttpSession session,Long orderNo){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        return iOrderService.getOrderDetail(user.getId(),orderNo);
    }

    @RequestMapping("listOrder.do")
    @ResponseBody
    public ModelAndView list(HttpSession session, @RequestParam(value = "pageNum",defaultValue = "1") int pageNum, @RequestParam(value = "pageSize",defaultValue = "10") int pageSize){
        ModelAndView mav=new ModelAndView();
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            mav.setViewName("login");
            return mav;
        }
       ServerResponse serverResponse= iOrderService.getOrderList(user.getId(),pageNum,pageSize);
        mav.setViewName("orderpage");
        mav.addObject("page",serverResponse.getData());
        return mav;
    }





    @RequestMapping("pay.do")
    @ResponseBody
    public ServerResponse pay(HttpSession session, Long orderNo, HttpServletRequest request){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        String path = request.getSession().getServletContext().getRealPath("upload");
        return iOrderService.pay(orderNo,user.getId(),path);
    }



    @RequestMapping("query_order_pay_status.do")
    @ResponseBody
    public ServerResponse<Boolean> queryOrderPayStatus(HttpSession session, Long orderNo){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }

        ServerResponse serverResponse = iOrderService.queryOrderPayStatus(user.getId(),orderNo);
        if(serverResponse.isSuccess()){
            return ServerResponse.createBySuccess(true);
        }
        return ServerResponse.createBySuccess(false);
    }



















}
