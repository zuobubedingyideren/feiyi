package com.feiyi.home.service;

import java.util.List;
import com.feiyi.home.domain.Banner;

/**
 * Banner图片管理Service接口
 * 
 * @author px
 * @date 2025-06-02
 */
public interface IBannerService 
{
    /**
     * 查询Banner图片管理
     * 
     * @param bannerId Banner图片管理主键
     * @return Banner图片管理
     */
    public Banner selectBannerByBannerId(Long bannerId);

    /**
     * 查询Banner图片管理列表
     * 
     * @param banner Banner图片管理
     * @return Banner图片管理集合
     */
    public List<Banner> selectBannerList(Banner banner);

    /**
     * 新增Banner图片管理
     * 
     * @param banner Banner图片管理
     * @return 结果
     */
    public int insertBanner(Banner banner);

    /**
     * 修改Banner图片管理
     * 
     * @param banner Banner图片管理
     * @return 结果
     */
    public int updateBanner(Banner banner);

    /**
     * 批量删除Banner图片管理
     * 
     * @param bannerIds 需要删除的Banner图片管理主键集合
     * @return 结果
     */
    public int deleteBannerByBannerIds(Long[] bannerIds);

    /**
     * 删除Banner图片管理信息
     * 
     * @param bannerId Banner图片管理主键
     * @return 结果
     */
    public int deleteBannerByBannerId(Long bannerId);
}
