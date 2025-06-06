package com.feiyi.catalog.mapper;

import java.util.List;
import com.feiyi.catalog.domain.AcademicResource;

/**
 * 学术资源，管理非遗项目相关的学术资源Mapper接口
 * 
 * @author px
 * @date 2025-06-06
 */
public interface AcademicResourceMapper 
{
    /**
     * 查询学术资源，管理非遗项目相关的学术资源
     * 
     * @param id 学术资源，管理非遗项目相关的学术资源主键
     * @return 学术资源，管理非遗项目相关的学术资源
     */
    public AcademicResource selectAcademicResourceById(Long id);

    /**
     * 查询学术资源，管理非遗项目相关的学术资源列表
     * 
     * @param academicResource 学术资源，管理非遗项目相关的学术资源
     * @return 学术资源，管理非遗项目相关的学术资源集合
     */
    public List<AcademicResource> selectAcademicResourceList(AcademicResource academicResource);

    /**
     * 新增学术资源，管理非遗项目相关的学术资源
     * 
     * @param academicResource 学术资源，管理非遗项目相关的学术资源
     * @return 结果
     */
    public int insertAcademicResource(AcademicResource academicResource);

    /**
     * 修改学术资源，管理非遗项目相关的学术资源
     * 
     * @param academicResource 学术资源，管理非遗项目相关的学术资源
     * @return 结果
     */
    public int updateAcademicResource(AcademicResource academicResource);

    /**
     * 删除学术资源，管理非遗项目相关的学术资源
     * 
     * @param id 学术资源，管理非遗项目相关的学术资源主键
     * @return 结果
     */
    public int deleteAcademicResourceById(Long id);

    /**
     * 批量删除学术资源，管理非遗项目相关的学术资源
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAcademicResourceByIds(Long[] ids);
}
