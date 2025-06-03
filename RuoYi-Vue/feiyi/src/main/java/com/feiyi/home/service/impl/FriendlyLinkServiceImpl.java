package com.feiyi.home.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.feiyi.home.mapper.FriendlyLinkMapper;
import com.feiyi.home.domain.FriendlyLink;
import com.feiyi.home.service.IFriendlyLinkService;

/**
 * 友情链接，管理页脚友情链接Service业务层处理
 * 
 * @author px
 * @date 2025-06-03
 */
@Service
public class FriendlyLinkServiceImpl implements IFriendlyLinkService 
{
    @Autowired
    private FriendlyLinkMapper friendlyLinkMapper;

    /**
     * 查询友情链接，管理页脚友情链接
     * 
     * @param id 友情链接，管理页脚友情链接主键
     * @return 友情链接，管理页脚友情链接
     */
    @Override
    public FriendlyLink selectFriendlyLinkById(Long id)
    {
        return friendlyLinkMapper.selectFriendlyLinkById(id);
    }

    /**
     * 查询友情链接，管理页脚友情链接列表
     * 
     * @param friendlyLink 友情链接，管理页脚友情链接
     * @return 友情链接，管理页脚友情链接
     */
    @Override
    public List<FriendlyLink> selectFriendlyLinkList(FriendlyLink friendlyLink)
    {
        return friendlyLinkMapper.selectFriendlyLinkList(friendlyLink);
    }

    /**
     * 新增友情链接，管理页脚友情链接
     * 
     * @param friendlyLink 友情链接，管理页脚友情链接
     * @return 结果
     */
    @Override
    public int insertFriendlyLink(FriendlyLink friendlyLink)
    {
        return friendlyLinkMapper.insertFriendlyLink(friendlyLink);
    }

    /**
     * 修改友情链接，管理页脚友情链接
     * 
     * @param friendlyLink 友情链接，管理页脚友情链接
     * @return 结果
     */
    @Override
    public int updateFriendlyLink(FriendlyLink friendlyLink)
    {
        return friendlyLinkMapper.updateFriendlyLink(friendlyLink);
    }

    /**
     * 批量删除友情链接，管理页脚友情链接
     * 
     * @param ids 需要删除的友情链接，管理页脚友情链接主键
     * @return 结果
     */
    @Override
    public int deleteFriendlyLinkByIds(Long[] ids)
    {
        return friendlyLinkMapper.deleteFriendlyLinkByIds(ids);
    }

    /**
     * 删除友情链接，管理页脚友情链接信息
     * 
     * @param id 友情链接，管理页脚友情链接主键
     * @return 结果
     */
    @Override
    public int deleteFriendlyLinkById(Long id)
    {
        return friendlyLinkMapper.deleteFriendlyLinkById(id);
    }
}
