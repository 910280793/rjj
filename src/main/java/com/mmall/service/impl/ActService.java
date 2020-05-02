package com.mmall.service.impl;

import com.mmall.pojo.Activity;
import com.mmall.service.IActService;
import com.mmall.vo.ActProductVo;
import org.springframework.stereotype.Service;

@Service
public class ActService implements IActService {
    @Override
    public ActProductVo asActVo(Activity activity, ActProductVo actProductVo) {
        actProductVo.setActivityName(activity.getActivityName());
        actProductVo.setContent(activity.getContent());
        actProductVo.setId(activity.getId());
        actProductVo.setStarttime(activity.getStarttime());
        actProductVo.setUpdatetime(activity.getUpdatetime());

        return actProductVo;
    }
}
