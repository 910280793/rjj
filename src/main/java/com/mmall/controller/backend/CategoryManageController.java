package com.mmall.controller.backend;

import com.mmall.common.Const;
import com.mmall.common.ResponseCode;
import com.mmall.common.ServerResponse;
import com.mmall.dao.CategoryMapper;
import com.mmall.pojo.Category;
import com.mmall.pojo.User;
import com.mmall.service.ICategoryService;
import com.mmall.service.IUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Created by ll
 */
@Controller
public class CategoryManageController {


    @Autowired
    private IUserService iUserService;

    @Autowired
    private ICategoryService iCategoryService;
    @Autowired
    private CategoryMapper categoryMapper;
    @RequestMapping("add_categoryManage.do")
    @ResponseBody
    public ModelAndView addCategory(HttpSession session, Category category, @RequestParam(value = "parentId",defaultValue = "0") int parentId){
        ModelAndView mav=new ModelAndView();
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            mav.setViewName("/admin/loginManage");
            return  mav;
        }
        //校验一下是否是管理员
        if(iUserService.checkAdminRole(user).isSuccess()){
            //是管理员
            //增加我们处理分类的逻辑
            if(category.getId()==null){
                iCategoryService.addCategory(category.getName(),0);
            }else {
                iCategoryService.updateCategoryName(category.getId(),category.getName());
            }
            ServerResponse serverResponse=iCategoryService.getChildrenParallelCategory(0);
            mav.addObject("list",serverResponse.getData());
            mav.setViewName("/admin/type");
            return mav;
        }else{
            mav.setViewName("/admin/login");
            return  mav;
        }
    }
    @RequestMapping("dell_categoryManage.do")
    @ResponseBody
    public ModelAndView dellCategory(HttpSession session, Category category, @RequestParam(value = "parentId",defaultValue = "0") int parentId){
        ModelAndView mav=new ModelAndView();
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            mav.setViewName("/admin/loginManage");
            return  mav;
        }
        //校验一下是否是管理员
        if(iUserService.checkAdminRole(user).isSuccess()){
            //是管理员
            //增加我们处理分类的逻辑
            categoryMapper.deleteByPrimaryKey(category.getId());
            ServerResponse serverResponse=iCategoryService.getChildrenParallelCategory(0);
            mav.addObject("list",serverResponse.getData());
            mav.setViewName("/admin/type");
            return mav;
        }else{
            mav.setViewName("/admin/login");
            return  mav;
        }
    }

    @RequestMapping("set_category_nameManage.do")
    @ResponseBody
    public ServerResponse setCategoryName(HttpSession session,Integer categoryId,String categoryName){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录,请登录");
        }
        if(iUserService.checkAdminRole(user).isSuccess()){
            //更新categoryName
            return iCategoryService.updateCategoryName(categoryId,categoryName);
        }else{
            return ServerResponse.createByErrorMessage("无权限操作,需要管理员权限");
        }
    }
    @RequestMapping("editcatePage.do")
    @ResponseBody
    public ModelAndView editcatepage(Integer categoryId,String name){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("/admin/addcate");
        modelAndView.addObject("id",categoryId);
        modelAndView.addObject("name",name);
        return modelAndView;
    }
    @RequestMapping("addcatePage.do")
    public String addcatepage(Integer categoryId,String name){

        return "/admin/addcate";
    }




    @RequestMapping("get_categoryManage.do")
    @ResponseBody
    public ServerResponse getChildrenParallelCategory(HttpSession session,@RequestParam(value = "categoryId" ,defaultValue = "0") Integer categoryId){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录,请登录");
        }
        if(iUserService.checkAdminRole(user).isSuccess()){
            //查询子节点的category信息,并且不递归,保持平级
            return iCategoryService.getChildrenParallelCategory(categoryId);
        }else{
            return ServerResponse.createByErrorMessage("无权限操作,需要管理员权限");
        }
    }

    @RequestMapping("get_categoryManage2.do")
    @ResponseBody
    public ModelAndView get_categoryManage(HttpSession session, @RequestParam(value = "categoryId" ,defaultValue = "0") Integer categoryId){
        ModelAndView mav=new ModelAndView();
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            mav.setViewName("/admin/login");
            return mav;
        }
        if(iUserService.checkAdminRole(user).isSuccess()){
            //查询子节点的category信息,并且不递归,保持平级
            ServerResponse serverResponse= iCategoryService.getChildrenParallelCategory(0);
            mav.addObject("list",serverResponse.getData());
            mav.setViewName("/admin/type");
            return  mav;
        }else{
            mav.setViewName("/admin/login");
            return mav;
        }
    }


    @RequestMapping("get_deep_categoryManage.do")
    @ResponseBody
    public ServerResponse getCategoryAndDeepChildrenCategory(HttpSession session,@RequestParam(value = "categoryId" ,defaultValue = "0") Integer categoryId){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录,请登录");
        }
        if(iUserService.checkAdminRole(user).isSuccess()){
            //查询当前节点的id和递归子节点的id
//            0->10000->100000
            return iCategoryService.selectCategoryAndChildrenById(categoryId);

        }else{
            return ServerResponse.createByErrorMessage("无权限操作,需要管理员权限");
        }
    }








}
