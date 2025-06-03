package com.feiyi.home.mapper;

import java.util.List;
import com.feiyi.home.domain.Footer;

/**
 * 技术支持Mapper接口
 * 
 * @author px
 * @date 2025-06-03
 */
public interface FooterMapper 
{
    /**
     * 查询技术支持
     * 
     * @param footerId 技术支持主键
     * @return 技术支持
     */
    public Footer selectFooterByFooterId(Long footerId);

    /**
     * 查询技术支持列表
     * 
     * @param footer 技术支持
     * @return 技术支持集合
     */
    public List<Footer> selectFooterList(Footer footer);

    /**
     * 新增技术支持
     * 
     * @param footer 技术支持
     * @return 结果
     */
    public int insertFooter(Footer footer);

    /**
     * 修改技术支持
     * 
     * @param footer 技术支持
     * @return 结果
     */
    public int updateFooter(Footer footer);

    /**
     * 删除技术支持
     * 
     * @param footerId 技术支持主键
     * @return 结果
     */
    public int deleteFooterByFooterId(Long footerId);

    /**
     * 批量删除技术支持
     * 
     * @param footerIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFooterByFooterIds(Long[] footerIds);
}
