package com.feiyi.academic.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.feiyi.academic.mapper.InterviewMapper;
import com.feiyi.academic.domain.Interview;
import com.feiyi.academic.service.IInterviewService;

/**
 * 访谈，管理学者、传承人等访谈内容Service业务层处理
 * 
 * @author px
 * @date 2025-06-04
 */
@Service
public class InterviewServiceImpl implements IInterviewService 
{
    @Autowired
    private InterviewMapper interviewMapper;

    /**
     * 查询访谈，管理学者、传承人等访谈内容
     * 
     * @param id 访谈，管理学者、传承人等访谈内容主键
     * @return 访谈，管理学者、传承人等访谈内容
     */
    @Override
    public Interview selectInterviewById(Long id)
    {
        return interviewMapper.selectInterviewById(id);
    }

    /**
     * 查询访谈，管理学者、传承人等访谈内容列表
     * 
     * @param interview 访谈，管理学者、传承人等访谈内容
     * @return 访谈，管理学者、传承人等访谈内容
     */
    @Override
    public List<Interview> selectInterviewList(Interview interview)
    {
        return interviewMapper.selectInterviewList(interview);
    }

    /**
     * 新增访谈，管理学者、传承人等访谈内容
     * 
     * @param interview 访谈，管理学者、传承人等访谈内容
     * @return 结果
     */
    @Override
    public int insertInterview(Interview interview)
    {
        return interviewMapper.insertInterview(interview);
    }

    /**
     * 修改访谈，管理学者、传承人等访谈内容
     * 
     * @param interview 访谈，管理学者、传承人等访谈内容
     * @return 结果
     */
    @Override
    public int updateInterview(Interview interview)
    {
        return interviewMapper.updateInterview(interview);
    }

    /**
     * 批量删除访谈，管理学者、传承人等访谈内容
     * 
     * @param ids 需要删除的访谈，管理学者、传承人等访谈内容主键
     * @return 结果
     */
    @Override
    public int deleteInterviewByIds(Long[] ids)
    {
        return interviewMapper.deleteInterviewByIds(ids);
    }

    /**
     * 删除访谈，管理学者、传承人等访谈内容信息
     * 
     * @param id 访谈，管理学者、传承人等访谈内容主键
     * @return 结果
     */
    @Override
    public int deleteInterviewById(Long id)
    {
        return interviewMapper.deleteInterviewById(id);
    }
}
