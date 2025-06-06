package com.feiyi.catalog.mapper;

import java.util.List;
import com.feiyi.catalog.domain.HeritageInheritor;

/**
 * 非遗传承人Mapper接口
 * 
 * @author px
 * @date 2025-06-06
 */
public interface HeritageInheritorMapper 
{
    /**
     * 查询非遗传承人
     * 
     * @param id 非遗传承人主键
     * @return 非遗传承人
     */
    public HeritageInheritor selectHeritageInheritorById(Long id);

    /**
     * 查询非遗传承人列表
     * 
     * @param heritageInheritor 非遗传承人
     * @return 非遗传承人集合
     */
    public List<HeritageInheritor> selectHeritageInheritorList(HeritageInheritor heritageInheritor);

    /**
     * 新增非遗传承人
     * 
     * @param heritageInheritor 非遗传承人
     * @return 结果
     */
    public int insertHeritageInheritor(HeritageInheritor heritageInheritor);

    /**
     * 修改非遗传承人
     * 
     * @param heritageInheritor 非遗传承人
     * @return 结果
     */
    public int updateHeritageInheritor(HeritageInheritor heritageInheritor);

    /**
     * 删除非遗传承人
     * 
     * @param id 非遗传承人主键
     * @return 结果
     */
    public int deleteHeritageInheritorById(Long id);

    /**
     * 批量删除非遗传承人
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHeritageInheritorByIds(Long[] ids);
}
