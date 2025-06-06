package com.feiyi.catalog.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.feiyi.catalog.mapper.HeritageProjectMapper;
import com.feiyi.catalog.domain.HeritageProject;
import com.feiyi.catalog.service.IHeritageProjectService;

/**
 * 非遗项目，管理非遗项目信息Service业务层处理
 * 
 * @author px
 * @date 2025-06-06
 */
@Service
public class HeritageProjectServiceImpl implements IHeritageProjectService 
{
    @Autowired
    private HeritageProjectMapper heritageProjectMapper;

    /**
     * 查询非遗项目，管理非遗项目信息
     * 
     * @param id 非遗项目，管理非遗项目信息主键
     * @return 非遗项目，管理非遗项目信息
     */
    @Override
    public HeritageProject selectHeritageProjectById(Long id)
    {
        return heritageProjectMapper.selectHeritageProjectById(id);
    }

    /**
     * 查询非遗项目，管理非遗项目信息列表
     * 
     * @param heritageProject 非遗项目，管理非遗项目信息
     * @return 非遗项目，管理非遗项目信息
     */
    @Override
    public List<HeritageProject> selectHeritageProjectList(HeritageProject heritageProject)
    {
        return heritageProjectMapper.selectHeritageProjectList(heritageProject);
    }

    /**
     * 新增非遗项目，管理非遗项目信息
     * 
     * @param heritageProject 非遗项目，管理非遗项目信息
     * @return 结果
     */
    @Override
    public int insertHeritageProject(HeritageProject heritageProject)
    {
        return heritageProjectMapper.insertHeritageProject(heritageProject);
    }

    /**
     * 修改非遗项目，管理非遗项目信息
     * 
     * @param heritageProject 非遗项目，管理非遗项目信息
     * @return 结果
     */
    @Override
    public int updateHeritageProject(HeritageProject heritageProject)
    {
        return heritageProjectMapper.updateHeritageProject(heritageProject);
    }

    /**
     * 批量删除非遗项目，管理非遗项目信息
     * 
     * @param ids 需要删除的非遗项目，管理非遗项目信息主键
     * @return 结果
     */
    @Override
    public int deleteHeritageProjectByIds(Long[] ids)
    {
        return heritageProjectMapper.deleteHeritageProjectByIds(ids);
    }

    /**
     * 删除非遗项目，管理非遗项目信息信息
     * 
     * @param id 非遗项目，管理非遗项目信息主键
     * @return 结果
     */
    @Override
    public int deleteHeritageProjectById(Long id)
    {
        return heritageProjectMapper.deleteHeritageProjectById(id);
    }
}
