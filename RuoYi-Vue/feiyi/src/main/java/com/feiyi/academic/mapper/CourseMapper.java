package com.feiyi.academic.mapper;

import java.util.List;
import com.feiyi.academic.domain.Course;

/**
 * 课程管理Mapper接口
 * 
 * @author px
 * @date 2025-06-06
 */
public interface CourseMapper 
{
    /**
     * 查询课程管理
     * 
     * @param id 课程管理主键
     * @return 课程管理
     */
    public Course selectCourseById(Long id);

    /**
     * 查询课程管理列表
     * 
     * @param course 课程管理
     * @return 课程管理集合
     */
    public List<Course> selectCourseList(Course course);

    /**
     * 新增课程管理
     * 
     * @param course 课程管理
     * @return 结果
     */
    public int insertCourse(Course course);

    /**
     * 修改课程管理
     * 
     * @param course 课程管理
     * @return 结果
     */
    public int updateCourse(Course course);

    /**
     * 删除课程管理
     * 
     * @param id 课程管理主键
     * @return 结果
     */
    public int deleteCourseById(Long id);

    /**
     * 批量删除课程管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCourseByIds(Long[] ids);
}
