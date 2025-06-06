package com.feiyi.catalog.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.feiyi.catalog.mapper.AcademicResourceMapper;
import com.feiyi.catalog.domain.AcademicResource;
import com.feiyi.catalog.service.IAcademicResourceService;

/**
 * 学术资源，管理非遗项目相关的学术资源Service业务层处理
 * 
 * @author px
 * @date 2025-06-06
 */
@Service
public class AcademicResourceServiceImpl implements IAcademicResourceService 
{
    @Autowired
    private AcademicResourceMapper academicResourceMapper;

    /**
     * 查询学术资源，管理非遗项目相关的学术资源
     * 
     * @param id 学术资源，管理非遗项目相关的学术资源主键
     * @return 学术资源，管理非遗项目相关的学术资源
     */
    @Override
    public AcademicResource selectAcademicResourceById(Long id)
    {
        return academicResourceMapper.selectAcademicResourceById(id);
    }

    /**
     * 查询学术资源，管理非遗项目相关的学术资源列表
     * 
     * @param academicResource 学术资源，管理非遗项目相关的学术资源
     * @return 学术资源，管理非遗项目相关的学术资源
     */
    @Override
    public List<AcademicResource> selectAcademicResourceList(AcademicResource academicResource)
    {
        return academicResourceMapper.selectAcademicResourceList(academicResource);
    }

    /**
     * 新增学术资源，管理非遗项目相关的学术资源
     * 
     * @param academicResource 学术资源，管理非遗项目相关的学术资源
     * @return 结果
     */
    @Override
    public int insertAcademicResource(AcademicResource academicResource)
    {
        return academicResourceMapper.insertAcademicResource(academicResource);
    }

    /**
     * 修改学术资源，管理非遗项目相关的学术资源
     * 
     * @param academicResource 学术资源，管理非遗项目相关的学术资源
     * @return 结果
     */
    @Override
    public int updateAcademicResource(AcademicResource academicResource)
    {
        return academicResourceMapper.updateAcademicResource(academicResource);
    }

    /**
     * 批量删除学术资源，管理非遗项目相关的学术资源
     * 
     * @param ids 需要删除的学术资源，管理非遗项目相关的学术资源主键
     * @return 结果
     */
    @Override
    public int deleteAcademicResourceByIds(Long[] ids)
    {
        return academicResourceMapper.deleteAcademicResourceByIds(ids);
    }

    /**
     * 删除学术资源，管理非遗项目相关的学术资源信息
     * 
     * @param id 学术资源，管理非遗项目相关的学术资源主键
     * @return 结果
     */
    @Override
    public int deleteAcademicResourceById(Long id)
    {
        return academicResourceMapper.deleteAcademicResourceById(id);
    }
}
