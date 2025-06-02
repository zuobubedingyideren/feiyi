package com.feiyi.home.mapper;

import java.util.List;
import com.feiyi.home.domain.Banner;

/**
 * Banner图片管理Mapper接口
 * 
 * @author px
 * @date 2025-06-02
 */
public interface BannerMapper 
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
     * 删除Banner图片管理
     * 
     * @param bannerId Banner图片管理主键
     * @return 结果
     */
    public int deleteBannerByBannerId(Long bannerId);

    /**
     * 批量删除Banner图片管理
     * 
     * @param bannerIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBannerByBannerIds(Long[] bannerIds);
}
