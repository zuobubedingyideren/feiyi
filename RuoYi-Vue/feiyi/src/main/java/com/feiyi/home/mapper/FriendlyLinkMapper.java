package com.feiyi.home.mapper;

import java.util.List;
import com.feiyi.home.domain.FriendlyLink;

/**
 * 友情链接，管理页脚友情链接Mapper接口
 * 
 * @author px
 * @date 2025-06-03
 */
public interface FriendlyLinkMapper 
{
    /**
     * 查询友情链接，管理页脚友情链接
     * 
     * @param id 友情链接，管理页脚友情链接主键
     * @return 友情链接，管理页脚友情链接
     */
    public FriendlyLink selectFriendlyLinkById(Long id);

    /**
     * 查询友情链接，管理页脚友情链接列表
     * 
     * @param friendlyLink 友情链接，管理页脚友情链接
     * @return 友情链接，管理页脚友情链接集合
     */
    public List<FriendlyLink> selectFriendlyLinkList(FriendlyLink friendlyLink);

    /**
     * 新增友情链接，管理页脚友情链接
     * 
     * @param friendlyLink 友情链接，管理页脚友情链接
     * @return 结果
     */
    public int insertFriendlyLink(FriendlyLink friendlyLink);

    /**
     * 修改友情链接，管理页脚友情链接
     * 
     * @param friendlyLink 友情链接，管理页脚友情链接
     * @return 结果
     */
    public int updateFriendlyLink(FriendlyLink friendlyLink);

    /**
     * 删除友情链接，管理页脚友情链接
     * 
     * @param id 友情链接，管理页脚友情链接主键
     * @return 结果
     */
    public int deleteFriendlyLinkById(Long id);

    /**
     * 批量删除友情链接，管理页脚友情链接
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFriendlyLinkByIds(Long[] ids);
}
