package com.feiyi.academic.service;

import java.util.List;
import com.feiyi.academic.domain.Interview;

/**
 * 访谈，管理学者、传承人等访谈内容Service接口
 * 
 * @author px
 * @date 2025-06-04
 */
public interface IInterviewService 
{
    /**
     * 查询访谈，管理学者、传承人等访谈内容
     * 
     * @param id 访谈，管理学者、传承人等访谈内容主键
     * @return 访谈，管理学者、传承人等访谈内容
     */
    public Interview selectInterviewById(Long id);

    /**
     * 查询访谈，管理学者、传承人等访谈内容列表
     * 
     * @param interview 访谈，管理学者、传承人等访谈内容
     * @return 访谈，管理学者、传承人等访谈内容集合
     */
    public List<Interview> selectInterviewList(Interview interview);

    /**
     * 新增访谈，管理学者、传承人等访谈内容
     * 
     * @param interview 访谈，管理学者、传承人等访谈内容
     * @return 结果
     */
    public int insertInterview(Interview interview);

    /**
     * 修改访谈，管理学者、传承人等访谈内容
     * 
     * @param interview 访谈，管理学者、传承人等访谈内容
     * @return 结果
     */
    public int updateInterview(Interview interview);

    /**
     * 批量删除访谈，管理学者、传承人等访谈内容
     * 
     * @param ids 需要删除的访谈，管理学者、传承人等访谈内容主键集合
     * @return 结果
     */
    public int deleteInterviewByIds(Long[] ids);

    /**
     * 删除访谈，管理学者、传承人等访谈内容信息
     * 
     * @param id 访谈，管理学者、传承人等访谈内容主键
     * @return 结果
     */
    public int deleteInterviewById(Long id);
}
