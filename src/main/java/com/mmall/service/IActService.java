package com.mmall.service;

import com.mmall.pojo.Activity;
import com.mmall.vo.ActProductVo;

public interface IActService {
    public ActProductVo  asActVo(Activity activity, ActProductVo actProductVo);
}
