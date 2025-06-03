package com.feiyi.home.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.feiyi.home.mapper.HomeIntroductionMapper;
import com.feiyi.home.domain.HomeIntroduction;
import com.feiyi.home.service.IHomeIntroductionService;

/**
 * 首页引言，管理首页引言内容Service业务层处理
 * 
 * @author px
 * @date 2025-06-03
 */
@Service
public class HomeIntroductionServiceImpl implements IHomeIntroductionService 
{
    @Autowired
    private HomeIntroductionMapper homeIntroductionMapper;

    /**
     * 查询首页引言，管理首页引言内容
     * 
     * @param id 首页引言，管理首页引言内容主键
     * @return 首页引言，管理首页引言内容
     */
    @Override
    public HomeIntroduction selectHomeIntroductionById(Long id)
    {
        return homeIntroductionMapper.selectHomeIntroductionById(id);
    }

    /**
     * 查询首页引言，管理首页引言内容列表
     * 
     * @param homeIntroduction 首页引言，管理首页引言内容
     * @return 首页引言，管理首页引言内容
     */
    @Override
    public List<HomeIntroduction> selectHomeIntroductionList(HomeIntroduction homeIntroduction)
    {
        return homeIntroductionMapper.selectHomeIntroductionList(homeIntroduction);
    }

    /**
     * 新增首页引言，管理首页引言内容
     * 
     * @param homeIntroduction 首页引言，管理首页引言内容
     * @return 结果
     */
    @Override
    public int insertHomeIntroduction(HomeIntroduction homeIntroduction)
    {
        return homeIntroductionMapper.insertHomeIntroduction(homeIntroduction);
    }

    /**
     * 修改首页引言，管理首页引言内容
     * 
     * @param homeIntroduction 首页引言，管理首页引言内容
     * @return 结果
     */
    @Override
    public int updateHomeIntroduction(HomeIntroduction homeIntroduction)
    {
        return homeIntroductionMapper.updateHomeIntroduction(homeIntroduction);
    }

    /**
     * 批量删除首页引言，管理首页引言内容
     * 
     * @param ids 需要删除的首页引言，管理首页引言内容主键
     * @return 结果
     */
    @Override
    public int deleteHomeIntroductionByIds(Long[] ids)
    {
        return homeIntroductionMapper.deleteHomeIntroductionByIds(ids);
    }

    /**
     * 删除首页引言，管理首页引言内容信息
     * 
     * @param id 首页引言，管理首页引言内容主键
     * @return 结果
     */
    @Override
    public int deleteHomeIntroductionById(Long id)
    {
        return homeIntroductionMapper.deleteHomeIntroductionById(id);
    }
}
