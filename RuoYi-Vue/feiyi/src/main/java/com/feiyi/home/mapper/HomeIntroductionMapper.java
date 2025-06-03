package com.feiyi.home.mapper;

import java.util.List;
import com.feiyi.home.domain.HomeIntroduction;

/**
 * 首页引言，管理首页引言内容Mapper接口
 * 
 * @author px
 * @date 2025-06-03
 */
public interface HomeIntroductionMapper 
{
    /**
     * 查询首页引言，管理首页引言内容
     * 
     * @param id 首页引言，管理首页引言内容主键
     * @return 首页引言，管理首页引言内容
     */
    public HomeIntroduction selectHomeIntroductionById(Long id);

    /**
     * 查询首页引言，管理首页引言内容列表
     * 
     * @param homeIntroduction 首页引言，管理首页引言内容
     * @return 首页引言，管理首页引言内容集合
     */
    public List<HomeIntroduction> selectHomeIntroductionList(HomeIntroduction homeIntroduction);

    /**
     * 新增首页引言，管理首页引言内容
     * 
     * @param homeIntroduction 首页引言，管理首页引言内容
     * @return 结果
     */
    public int insertHomeIntroduction(HomeIntroduction homeIntroduction);

    /**
     * 修改首页引言，管理首页引言内容
     * 
     * @param homeIntroduction 首页引言，管理首页引言内容
     * @return 结果
     */
    public int updateHomeIntroduction(HomeIntroduction homeIntroduction);

    /**
     * 删除首页引言，管理首页引言内容
     * 
     * @param id 首页引言，管理首页引言内容主键
     * @return 结果
     */
    public int deleteHomeIntroductionById(Long id);

    /**
     * 批量删除首页引言，管理首页引言内容
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHomeIntroductionByIds(Long[] ids);
}
