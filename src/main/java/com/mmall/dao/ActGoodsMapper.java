package com.mmall.dao;


import com.mmall.pojo.ActGoods;
import com.mmall.pojo.ActGoodsExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ActGoodsMapper {
    int countByExample(ActGoodsExample example);

    int deleteByExample(ActGoodsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ActGoods record);

    int insertSelective(ActGoods record);

    void delActProdcut(ActGoods record);

    List<ActGoods> selectByExample(ActGoodsExample example);

    ActGoods selectByPrimaryKey(Integer id);

    List<ActGoods> isProduct(ActGoods actGoods);

    int updateByExampleSelective(@Param("record") ActGoods record, @Param("example") ActGoodsExample example);

    int updateByExample(@Param("record") ActGoods record, @Param("example") ActGoodsExample example);

    int updateByPrimaryKeySelective(ActGoods record);

    int updateByPrimaryKey(ActGoods record);
}