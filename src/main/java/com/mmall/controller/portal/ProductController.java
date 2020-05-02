package com.mmall.controller.portal;

import com.github.pagehelper.PageInfo;
import com.mmall.common.Const;
import com.mmall.common.ResponseCode;
import com.mmall.common.ServerResponse;
import com.mmall.dao.OrderItemMapper;
import com.mmall.dao.ProductMapper;
import com.mmall.pojo.MultiUploadFiles;
import com.mmall.pojo.OrderItem;
import com.mmall.pojo.Product;
import com.mmall.pojo.User;
import com.mmall.service.IFileService;
import com.mmall.service.IProductService;
import com.mmall.vo.ProductDetailVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by ll
 */

@Controller
@RequestMapping("")
public class ProductController {

    @Autowired
    private IProductService iProductService;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private IFileService iFileService;
    @Autowired
    private OrderItemMapper orderItemMapper;


    @RequestMapping("detail.do")
    @ResponseBody
    public ModelAndView detail(Integer productId){
        ModelAndView mav = new ModelAndView();
      ServerResponse<ProductDetailVo> serverResponse=iProductService.getProductDetail(productId);
        mav.addObject("productDetailVo",serverResponse.getData());
        mav.setViewName("proDetail");

        return mav;

    }



    @RequestMapping("myProduct.do")
    @ResponseBody
    public ModelAndView getList(HttpSession session, @RequestParam(value = "pageNum",defaultValue = "1") int pageNum, @RequestParam(value = "pageSize",defaultValue = "5") int pageSize, Product product) {
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        ModelAndView mav = new ModelAndView();
        if (user != null) {
            product.setCreateUserId(user.getId());
            product.setCreateUserName(user.getUsername());
            ServerResponse serverResponse = iProductService.getProductList(pageNum, pageSize, product);
            mav.addObject("page", serverResponse.getData());
            mav.setViewName("/userHome/productHome");
            return mav;
        } else {

            mav.setViewName("login");
            return mav;

        }
    }

    @RequestMapping("mySellProduct.do")
    @ResponseBody
    public ModelAndView mySellProduct(HttpSession session, @RequestParam(value = "pageNum",defaultValue = "1") int pageNum, @RequestParam(value = "pageSize",defaultValue = "5") int pageSize, Product product) {
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        ModelAndView mav = new ModelAndView();
        if (user != null) {
            product.setCreateUserId(user.getId());
            product.setCreateUserName(user.getUsername());
            ServerResponse serverResponse = iProductService.getSellProductList(pageNum, pageSize, user.getId());
            mav.addObject("page", serverResponse.getData());
            mav.setViewName("/userHome/sellproduct");
            return mav;
        } else {

            mav.setViewName("login");
            return mav;

        }
    }
    @RequestMapping("userUploadProduct.do")
    @ResponseBody
    public ModelAndView uploadProduct(HttpSession session, Product product, @ModelAttribute("multiUploadFiles") MultiUploadFiles multiUploadFiles , HttpServletRequest request){
        ModelAndView mav= new ModelAndView();
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            mav.setViewName("login");
            return mav;
        }

        String s="upload";
        String path = request.getSession().getServletContext().getRealPath(s);
        List<MultipartFile> m=multiUploadFiles.multiUploadFiles;
        String ims="";
        String t="";
        for(int i=0;i<m.size();i++){
            String targetFileName = iFileService.upload(m.get(i),path);
            if(i==0){
                product.setMainImage(targetFileName);
            }else {
                ims=ims+targetFileName+",";
            }
            t=t+"<li><div class='"+"small-img'"+"><img src='upload/"+targetFileName+"' /></div></li>";
        }
        product.setSubtitle(t);
        iProductService.saveOrUpdateProduct(product,user);
        Product p=new Product();
        p.setCreateUserId(user.getId());
        p.setCreateUserName(user.getUsername());
        ServerResponse serverResponse = iProductService.getProductList(1, 5, p);
        mav.addObject("page", serverResponse.getData());
        mav.setViewName("/userHome/productHome");
        return mav;



    }
    @RequestMapping("userHomeaddproduct")
    @ResponseBody
    public ModelAndView addPage(HttpSession session){
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        ModelAndView mav = new ModelAndView();
        if(user==null){
            mav.setViewName("login");
            return mav;
        }
        mav.setViewName("userHome/addproduct");
        return mav;
    }

    @RequestMapping("list.do")
    @ResponseBody
    public ServerResponse<PageInfo> list(@RequestParam(value = "keyword",required = false)String keyword,
                                         @RequestParam(value = "categoryId",required = false)Integer categoryId,
                                         @RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                         @RequestParam(value = "pageSize",defaultValue = "10") int pageSize,
                                         @RequestParam(value = "orderBy",defaultValue = "") String orderBy){
        return iProductService.getProductByKeywordCategory(keyword,categoryId,pageNum,pageSize,orderBy);
    }

    @RequestMapping("allList")
    @ResponseBody
    public ModelAndView allList(@RequestParam(value = "keyword",required = false)String keyword,
                                @RequestParam(value = "categoryId",required = false)Integer categoryId,
                                @RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                @RequestParam(value = "pageSize",defaultValue = "10") int pageSize,
                                @RequestParam(value = "orderBy",defaultValue = "") String orderBy){
        ServerResponse serverResponse=iProductService.getProductByKeywordCategory(keyword,categoryId,pageNum,pageSize,orderBy);
        ModelAndView mav = new ModelAndView();

        mav.addObject("page",serverResponse.getData());
        mav.addObject("categoryId",categoryId);
        mav.setViewName("allProduct");

        return mav;
    }

    @RequestMapping("byCidList")
    public String byCidList(String cid, Model model){
        List<Product> list=productMapper.byCateList(cid);
        model.addAttribute("list",list);
        return "allProduct";
    }

    @RequestMapping("itemStatus.do")
    @ResponseBody
    public ServerResponse itemStatus(HttpSession session, Integer id){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        OrderItem orderItem=new OrderItem();
        orderItem.setId(id);
        orderItem.setStatus("已发货");
        orderItemMapper.updateByPrimaryKeySelective(orderItem);
        return ServerResponse.createBySuccess();
    }


}
