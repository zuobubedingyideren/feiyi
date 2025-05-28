package com.feiyi.system.service;

import java.util.List;
import com.feiyi.system.domain.Banner;

/**
 * 首页轮播图，管理首页展示的图片及跳转链接Service接口
 * 
 * @author px
 * @date 2025-05-28
 */
public interface IBannerService 
{
    /**
     * 查询首页轮播图，管理首页展示的图片及跳转链接
     * 
     * @param id 首页轮播图，管理首页展示的图片及跳转链接主键
     * @return 首页轮播图，管理首页展示的图片及跳转链接
     */
    public Banner selectBannerById(Long id);

    /**
     * 查询首页轮播图，管理首页展示的图片及跳转链接列表
     * 
     * @param banner 首页轮播图，管理首页展示的图片及跳转链接
     * @return 首页轮播图，管理首页展示的图片及跳转链接集合
     */
    public List<Banner> selectBannerList(Banner banner);

    /**
     * 新增首页轮播图，管理首页展示的图片及跳转链接
     * 
     * @param banner 首页轮播图，管理首页展示的图片及跳转链接
     * @return 结果
     */
    public int insertBanner(Banner banner);

    /**
     * 修改首页轮播图，管理首页展示的图片及跳转链接
     * 
     * @param banner 首页轮播图，管理首页展示的图片及跳转链接
     * @return 结果
     */
    public int updateBanner(Banner banner);

    /**
     * 批量删除首页轮播图，管理首页展示的图片及跳转链接
     * 
     * @param ids 需要删除的首页轮播图，管理首页展示的图片及跳转链接主键集合
     * @return 结果
     */
    public int deleteBannerByIds(Long[] ids);

    /**
     * 删除首页轮播图，管理首页展示的图片及跳转链接信息
     * 
     * @param id 首页轮播图，管理首页展示的图片及跳转链接主键
     * @return 结果
     */
    public int deleteBannerById(Long id);
}
