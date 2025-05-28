package com.feiyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.feiyi.system.mapper.BannerMapper;
import com.feiyi.system.domain.Banner;
import com.feiyi.system.service.IBannerService;

/**
 * 首页轮播图，管理首页展示的图片及跳转链接Service业务层处理
 * 
 * @author px
 * @date 2025-05-28
 */
@Service
public class BannerServiceImpl implements IBannerService 
{
    @Autowired
    private BannerMapper bannerMapper;

    /**
     * 查询首页轮播图，管理首页展示的图片及跳转链接
     * 
     * @param id 首页轮播图，管理首页展示的图片及跳转链接主键
     * @return 首页轮播图，管理首页展示的图片及跳转链接
     */
    @Override
    public Banner selectBannerById(Long id)
    {
        return bannerMapper.selectBannerById(id);
    }

    /**
     * 查询首页轮播图，管理首页展示的图片及跳转链接列表
     * 
     * @param banner 首页轮播图，管理首页展示的图片及跳转链接
     * @return 首页轮播图，管理首页展示的图片及跳转链接
     */
    @Override
    public List<Banner> selectBannerList(Banner banner)
    {
        return bannerMapper.selectBannerList(banner);
    }

    /**
     * 新增首页轮播图，管理首页展示的图片及跳转链接
     * 
     * @param banner 首页轮播图，管理首页展示的图片及跳转链接
     * @return 结果
     */
    @Override
    public int insertBanner(Banner banner)
    {
        return bannerMapper.insertBanner(banner);
    }

    /**
     * 修改首页轮播图，管理首页展示的图片及跳转链接
     * 
     * @param banner 首页轮播图，管理首页展示的图片及跳转链接
     * @return 结果
     */
    @Override
    public int updateBanner(Banner banner)
    {
        return bannerMapper.updateBanner(banner);
    }

    /**
     * 批量删除首页轮播图，管理首页展示的图片及跳转链接
     * 
     * @param ids 需要删除的首页轮播图，管理首页展示的图片及跳转链接主键
     * @return 结果
     */
    @Override
    public int deleteBannerByIds(Long[] ids)
    {
        return bannerMapper.deleteBannerByIds(ids);
    }

    /**
     * 删除首页轮播图，管理首页展示的图片及跳转链接信息
     * 
     * @param id 首页轮播图，管理首页展示的图片及跳转链接主键
     * @return 结果
     */
    @Override
    public int deleteBannerById(Long id)
    {
        return bannerMapper.deleteBannerById(id);
    }
}
