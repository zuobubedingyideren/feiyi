package com.feiyi.home.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.feiyi.home.mapper.FooterMapper;
import com.feiyi.home.domain.Footer;
import com.feiyi.home.service.IFooterService;

/**
 * 技术支持Service业务层处理
 * 
 * @author px
 * @date 2025-06-03
 */
@Service
public class FooterServiceImpl implements IFooterService 
{
    @Autowired
    private FooterMapper footerMapper;

    /**
     * 查询技术支持
     * 
     * @param footerId 技术支持主键
     * @return 技术支持
     */
    @Override
    public Footer selectFooterByFooterId(Long footerId)
    {
        return footerMapper.selectFooterByFooterId(footerId);
    }

    /**
     * 查询技术支持列表
     * 
     * @param footer 技术支持
     * @return 技术支持
     */
    @Override
    public List<Footer> selectFooterList(Footer footer)
    {
        return footerMapper.selectFooterList(footer);
    }

    /**
     * 新增技术支持
     * 
     * @param footer 技术支持
     * @return 结果
     */
    @Override
    public int insertFooter(Footer footer)
    {
        footer.setCreateTime(DateUtils.getNowDate());
        return footerMapper.insertFooter(footer);
    }

    /**
     * 修改技术支持
     * 
     * @param footer 技术支持
     * @return 结果
     */
    @Override
    public int updateFooter(Footer footer)
    {
        footer.setUpdateTime(DateUtils.getNowDate());
        return footerMapper.updateFooter(footer);
    }

    /**
     * 批量删除技术支持
     * 
     * @param footerIds 需要删除的技术支持主键
     * @return 结果
     */
    @Override
    public int deleteFooterByFooterIds(Long[] footerIds)
    {
        return footerMapper.deleteFooterByFooterIds(footerIds);
    }

    /**
     * 删除技术支持信息
     * 
     * @param footerId 技术支持主键
     * @return 结果
     */
    @Override
    public int deleteFooterByFooterId(Long footerId)
    {
        return footerMapper.deleteFooterByFooterId(footerId);
    }
}
