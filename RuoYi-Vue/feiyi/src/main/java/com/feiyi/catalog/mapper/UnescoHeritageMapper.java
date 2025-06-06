package com.feiyi.catalog.mapper;

import java.util.List;
import com.feiyi.catalog.domain.UnescoHeritage;

/**
 * UNESCO非遗名录，管理联合国教科文组织非遗名录信息Mapper接口
 * 
 * @author px
 * @date 2025-06-06
 */
public interface UnescoHeritageMapper 
{
    /**
     * 查询UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     * 
     * @param id UNESCO非遗名录，管理联合国教科文组织非遗名录信息主键
     * @return UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     */
    public UnescoHeritage selectUnescoHeritageById(Long id);

    /**
     * 查询UNESCO非遗名录，管理联合国教科文组织非遗名录信息列表
     * 
     * @param unescoHeritage UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     * @return UNESCO非遗名录，管理联合国教科文组织非遗名录信息集合
     */
    public List<UnescoHeritage> selectUnescoHeritageList(UnescoHeritage unescoHeritage);

    /**
     * 新增UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     * 
     * @param unescoHeritage UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     * @return 结果
     */
    public int insertUnescoHeritage(UnescoHeritage unescoHeritage);

    /**
     * 修改UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     * 
     * @param unescoHeritage UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     * @return 结果
     */
    public int updateUnescoHeritage(UnescoHeritage unescoHeritage);

    /**
     * 删除UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     * 
     * @param id UNESCO非遗名录，管理联合国教科文组织非遗名录信息主键
     * @return 结果
     */
    public int deleteUnescoHeritageById(Long id);

    /**
     * 批量删除UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteUnescoHeritageByIds(Long[] ids);
}
