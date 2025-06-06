package com.feiyi.home.service;

import java.util.List;
import com.feiyi.home.domain.FeaturedProject;

/**
 * 热门项目Service接口
 * 
 * @author px
 * @date 2025-06-06
 */
public interface IFeaturedProjectService 
{
    /**
     * 查询热门项目
     * 
     * @param id 热门项目主键
     * @return 热门项目
     */
    public FeaturedProject selectFeaturedProjectById(Long id);

    /**
     * 查询热门项目列表
     * 
     * @param featuredProject 热门项目
     * @return 热门项目集合
     */
    public List<FeaturedProject> selectFeaturedProjectList(FeaturedProject featuredProject);

    /**
     * 新增热门项目
     * 
     * @param featuredProject 热门项目
     * @return 结果
     */
    public int insertFeaturedProject(FeaturedProject featuredProject);

    /**
     * 修改热门项目
     * 
     * @param featuredProject 热门项目
     * @return 结果
     */
    public int updateFeaturedProject(FeaturedProject featuredProject);

    /**
     * 批量删除热门项目
     * 
     * @param ids 需要删除的热门项目主键集合
     * @return 结果
     */
    public int deleteFeaturedProjectByIds(Long[] ids);

    /**
     * 删除热门项目信息
     * 
     * @param id 热门项目主键
     * @return 结果
     */
    public int deleteFeaturedProjectById(Long id);
}
