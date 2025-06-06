package com.feiyi.catalog.mapper;

import java.util.List;
import com.feiyi.catalog.domain.ProjectImage;

/**
 * 项目图片Mapper接口
 * 
 * @author px
 * @date 2025-06-06
 */
public interface ProjectImageMapper 
{
    /**
     * 查询项目图片
     * 
     * @param id 项目图片主键
     * @return 项目图片
     */
    public ProjectImage selectProjectImageById(Long id);

    /**
     * 查询项目图片列表
     * 
     * @param projectImage 项目图片
     * @return 项目图片集合
     */
    public List<ProjectImage> selectProjectImageList(ProjectImage projectImage);

    /**
     * 新增项目图片
     * 
     * @param projectImage 项目图片
     * @return 结果
     */
    public int insertProjectImage(ProjectImage projectImage);

    /**
     * 修改项目图片
     * 
     * @param projectImage 项目图片
     * @return 结果
     */
    public int updateProjectImage(ProjectImage projectImage);

    /**
     * 删除项目图片
     * 
     * @param id 项目图片主键
     * @return 结果
     */
    public int deleteProjectImageById(Long id);

    /**
     * 批量删除项目图片
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProjectImageByIds(Long[] ids);
}
