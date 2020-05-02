package com.mmall.controller.backend;

import com.google.common.collect.Maps;
import com.mmall.common.Const;
import com.mmall.common.ResponseCode;
import com.mmall.common.ServerResponse;
import com.mmall.pojo.MultiUploadFiles;
import com.mmall.pojo.Product;
import com.mmall.pojo.User;
import com.mmall.service.IFileService;
import com.mmall.service.IProductService;
import com.mmall.service.IUserService;
import com.mmall.util.PropertiesUtil;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by ll
 */

@Controller
public class ProductManageController {

    @Autowired
    private IUserService iUserService;
    @Autowired
    private IProductService iProductService;

    @Autowired
    private IFileService iFileService;

    @RequestMapping("saveProductManage.do")
    @ResponseBody
    public ServerResponse productSave(Product product,HttpSession session){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录,请登录管理员");

        }

        //填充我们增加产品的业务逻辑
        return iProductService.saveOrUpdateProduct(product,user);

    }

    @RequestMapping("set_sale_status.do")
    @ResponseBody
    public ServerResponse setSaleStatus(HttpSession session, Integer productId,Integer status){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录,请登录管理员");

        }
        if(iUserService.checkAdminRole(user).isSuccess()){
            return iProductService.setSaleStatus(productId,status);
        }else{
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    @RequestMapping("detailProductManage.do")
    @ResponseBody
    public ModelAndView getDetail(HttpSession session, Integer productId){

        User user = (User)session.getAttribute(Const.CURRENT_USER);
        ModelAndView mav=new ModelAndView();

        if(user == null){
            mav.setViewName("/admin/loginManage");
            return mav;

        }
        if(iUserService.checkAdminRole(user).isSuccess()){
            //填充业务
           mav.setViewName("/admin/editproduct");
          ServerResponse serverResponse=iProductService.getProductDetail(productId);
          mav.addObject("product",serverResponse.getData());
          return mav;
        }else{
            mav.setViewName("/admin/loginManage");
            return mav;

        }
    }

    @RequestMapping("listProductManage.do")
    @ResponseBody
    public ModelAndView getList(HttpSession session, @RequestParam(value = "pageNum",defaultValue = "1") int pageNum, @RequestParam(value = "pageSize",defaultValue = "5") int pageSize,Product product){
        ModelAndView mav=new ModelAndView();
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            mav.setViewName("/admin/login");
            return  mav;

        }
        if(iUserService.checkAdminRole(user).isSuccess()){
            ServerResponse serverResponse=iProductService.getProductList(pageNum,pageSize,product);
            //填充业务
            mav.setViewName("/admin/commodity");
            mav.addObject("page",serverResponse.getData());
            return mav;
        }else{
            mav.setViewName("/admin/login");
            return  mav;

        }
    }


    @RequestMapping("setSaltProductManage.do")
    @ResponseBody
    public ModelAndView setSaltProductManage(Integer productId,Integer status,HttpSession session, @RequestParam(value = "pageNum",defaultValue = "1") int pageNum, @RequestParam(value = "pageSize",defaultValue = "10") int pageSize){
        ModelAndView mav=new ModelAndView();
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            mav.setViewName("/admin/login");
            return  mav;

        }
        if(iUserService.checkAdminRole(user).isSuccess()){
            iProductService.setSaleStatus(productId,status);
            ServerResponse serverResponse=iProductService.getProductList(pageNum,100,new Product());
            //填充业务
            mav.setViewName("/admin/commodity");
            mav.addObject("list",serverResponse.getData());
            return mav;
        }else{
            mav.setViewName("/admin/login");
            return  mav;

        }
    }

    @RequestMapping("searchProductManage.do")
    @ResponseBody
    public ServerResponse productSearch(HttpSession session,String productName,Integer productId, @RequestParam(value = "pageNum",defaultValue = "1") int pageNum,@RequestParam(value = "pageSize",defaultValue = "10") int pageSize){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录,请登录管理员");

        }
        if(iUserService.checkAdminRole(user).isSuccess()){
            //填充业务
            return iProductService.searchProduct(productName,productId,pageNum,pageSize);
        }else{
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    @RequestMapping("uploadProductManage.do")
    @ResponseBody
    public ServerResponse upload(HttpSession session,@RequestParam(value = "upload_file",required = false) MultipartFile file,HttpServletRequest request){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录,请登录管理员");
        }
        if(iUserService.checkAdminRole(user).isSuccess()){
            String path = request.getSession().getServletContext().getRealPath("upload");
            String targetFileName = iFileService.upload(file,path);
            String url = targetFileName;

            Map fileMap = Maps.newHashMap();
            fileMap.put("uri",targetFileName);
            fileMap.put("url",url);
            return ServerResponse.createBySuccess(fileMap);
        }else{
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    @RequestMapping("uploadProductProductManage.do")
    @ResponseBody
    public ServerResponse uploadProduct(HttpSession session,Product product, @ModelAttribute("multiUploadFiles") MultiUploadFiles multiUploadFiles , HttpServletRequest request){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录,请登录管理员");
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
            return iProductService.saveOrUpdateProduct(product,user);



    }

    @RequestMapping("delproduct.do")
    @ResponseBody
    public ServerResponse delproduct(Integer id){
       return iProductService.delProduct(id);

    }


    @RequestMapping("richtext_img_upload.do")
    @ResponseBody
    public Map richtextImgUpload(HttpSession session, @RequestParam(value = "upload_file",required = false) MultipartFile file, HttpServletRequest request, HttpServletResponse response){
        Map resultMap = Maps.newHashMap();
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            resultMap.put("success",false);
            resultMap.put("msg","请登录管理员");
            return resultMap;
        }
        //富文本中对于返回值有自己的要求,我们使用是simditor所以按照simditor的要求进行返回
//        {
//            "success": true/false,
//                "msg": "error message", # optional
//            "file_path": "[real file path]"
//        }
        if(iUserService.checkAdminRole(user).isSuccess()){
            String path = request.getSession().getServletContext().getRealPath("upload");
            String targetFileName = iFileService.upload(file,path);
            if(StringUtils.isBlank(targetFileName)){
                resultMap.put("success",false);
                resultMap.put("msg","上传失败");
                return resultMap;
            }
            String url = targetFileName;
            resultMap.put("success",true);
            resultMap.put("msg","上传成功");
            resultMap.put("file_path",url);
            response.addHeader("Access-Control-Allow-Headers","X-File-Name");
            return resultMap;
        }else{
            resultMap.put("success",false);
            resultMap.put("msg","无权限操作");
            return resultMap;
        }
    }





























}
