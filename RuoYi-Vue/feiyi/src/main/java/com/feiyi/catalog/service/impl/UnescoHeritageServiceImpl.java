package com.feiyi.catalog.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.feiyi.catalog.mapper.UnescoHeritageMapper;
import com.feiyi.catalog.domain.UnescoHeritage;
import com.feiyi.catalog.service.IUnescoHeritageService;

/**
 * UNESCO非遗名录，管理联合国教科文组织非遗名录信息Service业务层处理
 * 
 * @author px
 * @date 2025-06-06
 */
@Service
public class UnescoHeritageServiceImpl implements IUnescoHeritageService 
{
    @Autowired
    private UnescoHeritageMapper unescoHeritageMapper;

    /**
     * 查询UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     * 
     * @param id UNESCO非遗名录，管理联合国教科文组织非遗名录信息主键
     * @return UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     */
    @Override
    public UnescoHeritage selectUnescoHeritageById(Long id)
    {
        return unescoHeritageMapper.selectUnescoHeritageById(id);
    }

    /**
     * 查询UNESCO非遗名录，管理联合国教科文组织非遗名录信息列表
     * 
     * @param unescoHeritage UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     * @return UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     */
    @Override
    public List<UnescoHeritage> selectUnescoHeritageList(UnescoHeritage unescoHeritage)
    {
        return unescoHeritageMapper.selectUnescoHeritageList(unescoHeritage);
    }

    /**
     * 新增UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     * 
     * @param unescoHeritage UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     * @return 结果
     */
    @Override
    public int insertUnescoHeritage(UnescoHeritage unescoHeritage)
    {
        return unescoHeritageMapper.insertUnescoHeritage(unescoHeritage);
    }

    /**
     * 修改UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     * 
     * @param unescoHeritage UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     * @return 结果
     */
    @Override
    public int updateUnescoHeritage(UnescoHeritage unescoHeritage)
    {
        return unescoHeritageMapper.updateUnescoHeritage(unescoHeritage);
    }

    /**
     * 批量删除UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     * 
     * @param ids 需要删除的UNESCO非遗名录，管理联合国教科文组织非遗名录信息主键
     * @return 结果
     */
    @Override
    public int deleteUnescoHeritageByIds(Long[] ids)
    {
        return unescoHeritageMapper.deleteUnescoHeritageByIds(ids);
    }

    /**
     * 删除UNESCO非遗名录，管理联合国教科文组织非遗名录信息信息
     * 
     * @param id UNESCO非遗名录，管理联合国教科文组织非遗名录信息主键
     * @return 结果
     */
    @Override
    public int deleteUnescoHeritageById(Long id)
    {
        return unescoHeritageMapper.deleteUnescoHeritageById(id);
    }
}
