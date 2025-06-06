package com.feiyi.catalog.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.feiyi.catalog.mapper.ProjectImageMapper;
import com.feiyi.catalog.domain.ProjectImage;
import com.feiyi.catalog.service.IProjectImageService;

/**
 * 项目图片Service业务层处理
 * 
 * @author px
 * @date 2025-06-06
 */
@Service
public class ProjectImageServiceImpl implements IProjectImageService 
{
    @Autowired
    private ProjectImageMapper projectImageMapper;

    /**
     * 查询项目图片
     * 
     * @param id 项目图片主键
     * @return 项目图片
     */
    @Override
    public ProjectImage selectProjectImageById(Long id)
    {
        return projectImageMapper.selectProjectImageById(id);
    }

    /**
     * 查询项目图片列表
     * 
     * @param projectImage 项目图片
     * @return 项目图片
     */
    @Override
    public List<ProjectImage> selectProjectImageList(ProjectImage projectImage)
    {
        return projectImageMapper.selectProjectImageList(projectImage);
    }

    /**
     * 新增项目图片
     * 
     * @param projectImage 项目图片
     * @return 结果
     */
    @Override
    public int insertProjectImage(ProjectImage projectImage)
    {
        return projectImageMapper.insertProjectImage(projectImage);
    }

    /**
     * 修改项目图片
     * 
     * @param projectImage 项目图片
     * @return 结果
     */
    @Override
    public int updateProjectImage(ProjectImage projectImage)
    {
        return projectImageMapper.updateProjectImage(projectImage);
    }

    /**
     * 批量删除项目图片
     * 
     * @param ids 需要删除的项目图片主键
     * @return 结果
     */
    @Override
    public int deleteProjectImageByIds(Long[] ids)
    {
        return projectImageMapper.deleteProjectImageByIds(ids);
    }

    /**
     * 删除项目图片信息
     * 
     * @param id 项目图片主键
     * @return 结果
     */
    @Override
    public int deleteProjectImageById(Long id)
    {
        return projectImageMapper.deleteProjectImageById(id);
    }
}
