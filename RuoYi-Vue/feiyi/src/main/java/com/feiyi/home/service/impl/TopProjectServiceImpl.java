package com.feiyi.home.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.feiyi.home.mapper.TopProjectMapper;
import com.feiyi.home.domain.TopProject;
import com.feiyi.home.service.ITopProjectService;

/**
 * 置顶项目，管理世界名录中的置顶项目Service业务层处理
 * 
 * @author px
 * @date 2025-06-06
 */
@Service
public class TopProjectServiceImpl implements ITopProjectService 
{
    @Autowired
    private TopProjectMapper topProjectMapper;

    /**
     * 查询置顶项目，管理世界名录中的置顶项目
     * 
     * @param id 置顶项目，管理世界名录中的置顶项目主键
     * @return 置顶项目，管理世界名录中的置顶项目
     */
    @Override
    public TopProject selectTopProjectById(Long id)
    {
        return topProjectMapper.selectTopProjectById(id);
    }

    /**
     * 查询置顶项目，管理世界名录中的置顶项目列表
     * 
     * @param topProject 置顶项目，管理世界名录中的置顶项目
     * @return 置顶项目，管理世界名录中的置顶项目
     */
    @Override
    public List<TopProject> selectTopProjectList(TopProject topProject)
    {
        return topProjectMapper.selectTopProjectList(topProject);
    }

    /**
     * 新增置顶项目，管理世界名录中的置顶项目
     * 
     * @param topProject 置顶项目，管理世界名录中的置顶项目
     * @return 结果
     */
    @Override
    public int insertTopProject(TopProject topProject)
    {
        return topProjectMapper.insertTopProject(topProject);
    }

    /**
     * 修改置顶项目，管理世界名录中的置顶项目
     * 
     * @param topProject 置顶项目，管理世界名录中的置顶项目
     * @return 结果
     */
    @Override
    public int updateTopProject(TopProject topProject)
    {
        return topProjectMapper.updateTopProject(topProject);
    }

    /**
     * 批量删除置顶项目，管理世界名录中的置顶项目
     * 
     * @param ids 需要删除的置顶项目，管理世界名录中的置顶项目主键
     * @return 结果
     */
    @Override
    public int deleteTopProjectByIds(Long[] ids)
    {
        return topProjectMapper.deleteTopProjectByIds(ids);
    }

    /**
     * 删除置顶项目，管理世界名录中的置顶项目信息
     * 
     * @param id 置顶项目，管理世界名录中的置顶项目主键
     * @return 结果
     */
    @Override
    public int deleteTopProjectById(Long id)
    {
        return topProjectMapper.deleteTopProjectById(id);
    }
}
