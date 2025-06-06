package com.feiyi.home.service;

import java.util.List;
import com.feiyi.home.domain.TopProject;

/**
 * 置顶项目，管理世界名录中的置顶项目Service接口
 * 
 * @author px
 * @date 2025-06-06
 */
public interface ITopProjectService 
{
    /**
     * 查询置顶项目，管理世界名录中的置顶项目
     * 
     * @param id 置顶项目，管理世界名录中的置顶项目主键
     * @return 置顶项目，管理世界名录中的置顶项目
     */
    public TopProject selectTopProjectById(Long id);

    /**
     * 查询置顶项目，管理世界名录中的置顶项目列表
     * 
     * @param topProject 置顶项目，管理世界名录中的置顶项目
     * @return 置顶项目，管理世界名录中的置顶项目集合
     */
    public List<TopProject> selectTopProjectList(TopProject topProject);

    /**
     * 新增置顶项目，管理世界名录中的置顶项目
     * 
     * @param topProject 置顶项目，管理世界名录中的置顶项目
     * @return 结果
     */
    public int insertTopProject(TopProject topProject);

    /**
     * 修改置顶项目，管理世界名录中的置顶项目
     * 
     * @param topProject 置顶项目，管理世界名录中的置顶项目
     * @return 结果
     */
    public int updateTopProject(TopProject topProject);

    /**
     * 批量删除置顶项目，管理世界名录中的置顶项目
     * 
     * @param ids 需要删除的置顶项目，管理世界名录中的置顶项目主键集合
     * @return 结果
     */
    public int deleteTopProjectByIds(Long[] ids);

    /**
     * 删除置顶项目，管理世界名录中的置顶项目信息
     * 
     * @param id 置顶项目，管理世界名录中的置顶项目主键
     * @return 结果
     */
    public int deleteTopProjectById(Long id);
}
