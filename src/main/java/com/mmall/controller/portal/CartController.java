package com.mmall.controller.portal;

import com.mmall.common.Const;
import com.mmall.common.ResponseCode;
import com.mmall.common.ServerResponse;
import com.mmall.pojo.User;
import com.mmall.service.ICartService;
import com.mmall.vo.CartVo;
import com.mmall.vo.ProductDetailVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;


@Controller

public class CartController {

    @Autowired
    private ICartService iCartService;



    @RequestMapping("cart.do")
    @ResponseBody
    public ModelAndView list(HttpSession session){
        ModelAndView mav = new ModelAndView();
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            mav.setViewName("login");
            return mav;
        }
        ServerResponse<CartVo> serverResponse =iCartService.list(user.getId());

        mav.addObject("cart",serverResponse.getData());
        mav.setViewName("shopcar");

        return mav;
    }
    @RequestMapping("cartCount.do")
    @ResponseBody
    public ServerResponse cartCount(Integer id){
        if(id==null){
            return ServerResponse.createBySuccess(0);
        }
      return   iCartService.cartCount(id);
    }


    @RequestMapping("addCart.do")
    @ResponseBody
    public ModelAndView addCart(HttpSession session, Integer count, Integer productId){
        ModelAndView mav = new ModelAndView();


        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            mav.setViewName("login");
            return  mav;
            //return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        ServerResponse response = iCartService.add(user.getId(),productId,count);
        ServerResponse<CartVo> cartVoServerResponse=iCartService.list(user.getId());
        mav.addObject("cart",cartVoServerResponse.getData());
        mav.setViewName("shopcar");

        return mav;
    }
    @RequestMapping(value = "addCart2.do",method = RequestMethod.POST)
    @ResponseBody
    public void addCart2(HttpSession session, Integer count, Integer productId){

        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return;
        }
        ServerResponse response = iCartService.add(user.getId(),productId,count);
    }



    @RequestMapping("updateCart.do")
    @ResponseBody
    public ServerResponse<CartVo> update(HttpSession session, Integer count, Integer productId){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        return iCartService.update(user.getId(),productId,count);
    }

    @RequestMapping("delete_productCart.do")
    @ResponseBody
    public ModelAndView deleteProduct(HttpSession session,String productIds){
        ModelAndView mav = new ModelAndView();
        ;
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            mav.setViewName("login");
            return mav ;
        }
        ServerResponse serverResponse=iCartService.deleteProduct(user.getId(),productIds);
        ServerResponse<CartVo> cartVoServerResponse=iCartService.list(user.getId());
        mav.setViewName("shopcar");
        mav.addObject("cart",cartVoServerResponse.getData());
        return mav;
    }


    @RequestMapping("select_allCart.do")
    @ResponseBody
    public ServerResponse<CartVo> selectAll(HttpSession session){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        return iCartService.selectOrUnSelect(user.getId(),null,Const.Cart.CHECKED);
    }

    @RequestMapping("un_select_allCart.do")
    @ResponseBody
    public ServerResponse<CartVo> unSelectAll(HttpSession session){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        return iCartService.selectOrUnSelect(user.getId(),null,Const.Cart.UN_CHECKED);
    }



    @RequestMapping("selectCart.do")
    @ResponseBody
    public ServerResponse<CartVo> select(HttpSession session,Integer productId){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        return iCartService.selectOrUnSelect(user.getId(),productId,Const.Cart.CHECKED);
    }

    @RequestMapping("un_selectCart.do")
    @ResponseBody
    public ServerResponse<CartVo> unSelect(HttpSession session,Integer productId){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        return iCartService.selectOrUnSelect(user.getId(),productId,Const.Cart.UN_CHECKED);
    }



    @RequestMapping("get_cart_product_countCart.do")
    @ResponseBody
    public ServerResponse<Integer> getCartProductCount(HttpSession session){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createBySuccess(0);
        }
        return iCartService.getCartProductCount(user.getId());
    }




    //全选
    //全反选

    //单独选
    //单独反选

    //查询当前用户的购物车里面的产品数量,如果一个产品有10个,那么数量就是10.




}
