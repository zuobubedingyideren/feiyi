package com.feiyi.home.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.feiyi.home.mapper.FeaturedProjectMapper;
import com.feiyi.home.domain.FeaturedProject;
import com.feiyi.home.service.IFeaturedProjectService;

/**
 * 热门项目Service业务层处理
 * 
 * @author px
 * @date 2025-06-06
 */
@Service
public class FeaturedProjectServiceImpl implements IFeaturedProjectService 
{
    @Autowired
    private FeaturedProjectMapper featuredProjectMapper;

    /**
     * 查询热门项目
     * 
     * @param id 热门项目主键
     * @return 热门项目
     */
    @Override
    public FeaturedProject selectFeaturedProjectById(Long id)
    {
        return featuredProjectMapper.selectFeaturedProjectById(id);
    }

    /**
     * 查询热门项目列表
     * 
     * @param featuredProject 热门项目
     * @return 热门项目
     */
    @Override
    public List<FeaturedProject> selectFeaturedProjectList(FeaturedProject featuredProject)
    {
        return featuredProjectMapper.selectFeaturedProjectList(featuredProject);
    }

    /**
     * 新增热门项目
     * 
     * @param featuredProject 热门项目
     * @return 结果
     */
    @Override
    public int insertFeaturedProject(FeaturedProject featuredProject)
    {
        return featuredProjectMapper.insertFeaturedProject(featuredProject);
    }

    /**
     * 修改热门项目
     * 
     * @param featuredProject 热门项目
     * @return 结果
     */
    @Override
    public int updateFeaturedProject(FeaturedProject featuredProject)
    {
        return featuredProjectMapper.updateFeaturedProject(featuredProject);
    }

    /**
     * 批量删除热门项目
     * 
     * @param ids 需要删除的热门项目主键
     * @return 结果
     */
    @Override
    public int deleteFeaturedProjectByIds(Long[] ids)
    {
        return featuredProjectMapper.deleteFeaturedProjectByIds(ids);
    }

    /**
     * 删除热门项目信息
     * 
     * @param id 热门项目主键
     * @return 结果
     */
    @Override
    public int deleteFeaturedProjectById(Long id)
    {
        return featuredProjectMapper.deleteFeaturedProjectById(id);
    }
}
