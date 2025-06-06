package com.feiyi.catalog.mapper;

import java.util.List;
import com.feiyi.catalog.domain.HeritageProject;

/**
 * 非遗项目，管理非遗项目信息Mapper接口
 * 
 * @author px
 * @date 2025-06-06
 */
public interface HeritageProjectMapper 
{
    /**
     * 查询非遗项目，管理非遗项目信息
     * 
     * @param id 非遗项目，管理非遗项目信息主键
     * @return 非遗项目，管理非遗项目信息
     */
    public HeritageProject selectHeritageProjectById(Long id);

    /**
     * 查询非遗项目，管理非遗项目信息列表
     * 
     * @param heritageProject 非遗项目，管理非遗项目信息
     * @return 非遗项目，管理非遗项目信息集合
     */
    public List<HeritageProject> selectHeritageProjectList(HeritageProject heritageProject);

    /**
     * 新增非遗项目，管理非遗项目信息
     * 
     * @param heritageProject 非遗项目，管理非遗项目信息
     * @return 结果
     */
    public int insertHeritageProject(HeritageProject heritageProject);

    /**
     * 修改非遗项目，管理非遗项目信息
     * 
     * @param heritageProject 非遗项目，管理非遗项目信息
     * @return 结果
     */
    public int updateHeritageProject(HeritageProject heritageProject);

    /**
     * 删除非遗项目，管理非遗项目信息
     * 
     * @param id 非遗项目，管理非遗项目信息主键
     * @return 结果
     */
    public int deleteHeritageProjectById(Long id);

    /**
     * 批量删除非遗项目，管理非遗项目信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHeritageProjectByIds(Long[] ids);
}
