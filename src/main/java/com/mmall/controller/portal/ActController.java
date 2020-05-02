package com.mmall.controller.portal;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mmall.common.ServerResponse;
import com.mmall.dao.ActGoodsMapper;
import com.mmall.dao.ActivityMapper;
import com.mmall.dao.ProductMapper;
import com.mmall.pojo.ActGoods;
import com.mmall.pojo.Activity;
import com.mmall.pojo.ActivityExample;
import com.mmall.pojo.Product;
import com.mmall.service.IActService;
import com.mmall.service.IProductService;
import com.mmall.vo.ActProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
public class ActController {
    @Autowired
    private ActGoodsMapper actGoodsMapper;
    @Autowired
    private ActivityMapper activityMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private IProductService iProductService;
    @Autowired
    private IActService iActService;



    @RequestMapping("getAllact")
    @ResponseBody
    public ModelAndView getallAct(){
        ModelAndView modelAndView=new ModelAndView();
      List<Activity> list= activityMapper.selectByExample(new ActivityExample());
      modelAndView.addObject("list",list);
      modelAndView.setViewName("/admin/activity");
      return modelAndView;
    }

    @RequestMapping("/index")
    @ResponseBody
    public ModelAndView index(){
        ModelAndView modelAndView=new ModelAndView();
        List<Activity> list= activityMapper.selectByStateAct();
        ArrayList<ActProductVo> actProductVos = new ArrayList<>();
        for (Activity activity : list) {
            ActProductVo actProductVo = iActService.asActVo(activity, new ActProductVo());
            actProductVo.setList(productMapper.actAllProductByactId(actProductVo.getId()));
            actProductVos.add(actProductVo);

        }
        modelAndView.addObject("actProductVos",actProductVos);
        modelAndView.setViewName("/index");
        return modelAndView;
    }


    @RequestMapping("addActProductPage")
    @ResponseBody
    public ModelAndView addActProductPage(Integer actId
            ,@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum
    ,@RequestParam(value = "pageSize",defaultValue = "10") Integer pageSize,Product product)
    {
        PageHelper.startPage(pageNum,pageSize);
        ModelAndView modelAndView=new ModelAndView();
        ServerResponse serverResponse= iProductService.getProductList(pageNum,pageSize,product);


        modelAndView.addObject("actId",actId);
        modelAndView.addObject("page",serverResponse.getData());
        modelAndView.setViewName("/admin/allActProduct");
        return modelAndView;
    }
    @RequestMapping("delActProductPage")
    @ResponseBody
    public ModelAndView delActProductPage(Integer actId
            ,@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum
            ,@RequestParam(value = "pageSize",defaultValue = "10") Integer pageSize)
    {
        PageHelper.startPage(pageNum,pageSize);
        ModelAndView modelAndView=new ModelAndView();
        List<Product> list=productMapper.actAllProductByactId(actId);
        PageInfo pageInfo = new PageInfo(list);
        pageInfo.setList(list);


        modelAndView.addObject("actId",actId);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("/admin/delActProduct");
        return modelAndView;
    }


    @RequestMapping("getAllact2")
    @ResponseBody
    public List<Activity> getallAct2(){

        List<Activity> list= activityMapper.selectByExample(new ActivityExample());

        return list;
    }

    @RequestMapping("addGoodAct")
    @ResponseBody
    public ModelAndView addGoodAct(ActGoods actGoods){

        actGoods.setStarttime(new Date());
        actGoods.setUpdatetime(new Date());

        List<ActGoods> la=actGoodsMapper.isProduct(actGoods);
        if(la.size()==0)
         actGoodsMapper.insert(actGoods);
        ModelAndView modelAndView=new ModelAndView();
        List<Activity> list= activityMapper.selectByExample(new ActivityExample());
        modelAndView.addObject("list",list);
        modelAndView.setViewName("/admin/activity");


        return modelAndView;
    }

    @RequestMapping("delGoodAct")
    @ResponseBody
    public ModelAndView delGoodAct(ActGoods actGoods
            ,@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum
            ,@RequestParam(value = "pageSize",defaultValue = "10") Integer pageSize){
        actGoodsMapper.delActProdcut(actGoods);
        PageHelper.startPage(pageNum,pageSize);
        ModelAndView modelAndView=new ModelAndView();
        List<Product> list=productMapper.actAllProductByactId(actGoods.getActId());
        PageInfo pageInfo = new PageInfo(list);
        pageInfo.setList(list);
        modelAndView.addObject("actId",actGoods.getActId());
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("/admin/delActProduct");
        return modelAndView;
    }

    @RequestMapping("udateStateAct")
    @ResponseBody
    public ModelAndView startAct(Activity activity){
        ModelAndView modelAndView=new ModelAndView();
        activityMapper.updateByPrimaryKeySelective(activity);
        List<Activity> list= activityMapper.selectByExample(new ActivityExample());
        modelAndView.addObject("list",list);
        modelAndView.setViewName("/admin/activity");
        return modelAndView;
    }

    @RequestMapping("editPage")
    @ResponseBody
    public ModelAndView editPage(Activity activity){
        ModelAndView modelAndView=new ModelAndView();
       if(activity.getId()!=null){
           activity=activityMapper.selectByPrimaryKey(activity.getId());
           modelAndView.addObject("a",activity);
       }

        modelAndView.setViewName("/admin/editactivity");
        return modelAndView;
    }


    @RequestMapping("delAct")
    @ResponseBody
    public ModelAndView delAct(Integer id){
        ModelAndView modelAndView=new ModelAndView();
        activityMapper.deleteByPrimaryKey(id);
        List<Activity> list= activityMapper.selectByExample(new ActivityExample());
        modelAndView.addObject("list",list);
        modelAndView.setViewName("/admin/activity");
        return modelAndView;
    }

    @RequestMapping("saveAct")
    public ModelAndView saveAct(Activity activity){
        ModelAndView modelAndView=new ModelAndView();
        if(activity.getId()==null){
            activityMapper.insert(activity);

        }else {
            activityMapper.updateByPrimaryKeySelective(activity);
        }
        List<Activity> list= activityMapper.selectByExample(new ActivityExample());
        modelAndView.addObject("list",list);
        modelAndView.setViewName("/admin/editactivity");
        return modelAndView;
    }

}
