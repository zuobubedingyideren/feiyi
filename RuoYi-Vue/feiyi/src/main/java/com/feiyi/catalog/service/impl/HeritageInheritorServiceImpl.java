package com.feiyi.catalog.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.feiyi.catalog.mapper.HeritageInheritorMapper;
import com.feiyi.catalog.domain.HeritageInheritor;
import com.feiyi.catalog.service.IHeritageInheritorService;

/**
 * 非遗传承人Service业务层处理
 * 
 * @author px
 * @date 2025-06-06
 */
@Service
public class HeritageInheritorServiceImpl implements IHeritageInheritorService 
{
    @Autowired
    private HeritageInheritorMapper heritageInheritorMapper;

    /**
     * 查询非遗传承人
     * 
     * @param id 非遗传承人主键
     * @return 非遗传承人
     */
    @Override
    public HeritageInheritor selectHeritageInheritorById(Long id)
    {
        return heritageInheritorMapper.selectHeritageInheritorById(id);
    }

    /**
     * 查询非遗传承人列表
     * 
     * @param heritageInheritor 非遗传承人
     * @return 非遗传承人
     */
    @Override
    public List<HeritageInheritor> selectHeritageInheritorList(HeritageInheritor heritageInheritor)
    {
        return heritageInheritorMapper.selectHeritageInheritorList(heritageInheritor);
    }

    /**
     * 新增非遗传承人
     * 
     * @param heritageInheritor 非遗传承人
     * @return 结果
     */
    @Override
    public int insertHeritageInheritor(HeritageInheritor heritageInheritor)
    {
        return heritageInheritorMapper.insertHeritageInheritor(heritageInheritor);
    }

    /**
     * 修改非遗传承人
     * 
     * @param heritageInheritor 非遗传承人
     * @return 结果
     */
    @Override
    public int updateHeritageInheritor(HeritageInheritor heritageInheritor)
    {
        return heritageInheritorMapper.updateHeritageInheritor(heritageInheritor);
    }

    /**
     * 批量删除非遗传承人
     * 
     * @param ids 需要删除的非遗传承人主键
     * @return 结果
     */
    @Override
    public int deleteHeritageInheritorByIds(Long[] ids)
    {
        return heritageInheritorMapper.deleteHeritageInheritorByIds(ids);
    }

    /**
     * 删除非遗传承人信息
     * 
     * @param id 非遗传承人主键
     * @return 结果
     */
    @Override
    public int deleteHeritageInheritorById(Long id)
    {
        return heritageInheritorMapper.deleteHeritageInheritorById(id);
    }
}
