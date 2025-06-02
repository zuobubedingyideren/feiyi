package com.feiyi.home.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.feiyi.home.mapper.BannerMapper;
import com.feiyi.home.domain.Banner;
import com.feiyi.home.service.IBannerService;

/**
 * Banner图片管理Service业务层处理
 * 
 * @author px
 * @date 2025-06-02
 */
@Service
public class BannerServiceImpl implements IBannerService 
{
    @Autowired
    private BannerMapper bannerMapper;

    /**
     * 查询Banner图片管理
     * 
     * @param bannerId Banner图片管理主键
     * @return Banner图片管理
     */
    @Override
    public Banner selectBannerByBannerId(Long bannerId)
    {
        return bannerMapper.selectBannerByBannerId(bannerId);
    }

    /**
     * 查询Banner图片管理列表
     * 
     * @param banner Banner图片管理
     * @return Banner图片管理
     */
    @Override
    public List<Banner> selectBannerList(Banner banner)
    {
        return bannerMapper.selectBannerList(banner);
    }

    /**
     * 新增Banner图片管理
     * 
     * @param banner Banner图片管理
     * @return 结果
     */
    @Override
    public int insertBanner(Banner banner)
    {
        banner.setCreateTime(DateUtils.getNowDate());
        return bannerMapper.insertBanner(banner);
    }

    /**
     * 修改Banner图片管理
     * 
     * @param banner Banner图片管理
     * @return 结果
     */
    @Override
    public int updateBanner(Banner banner)
    {
        banner.setUpdateTime(DateUtils.getNowDate());
        return bannerMapper.updateBanner(banner);
    }

    /**
     * 批量删除Banner图片管理
     * 
     * @param bannerIds 需要删除的Banner图片管理主键
     * @return 结果
     */
    @Override
    public int deleteBannerByBannerIds(Long[] bannerIds)
    {
        return bannerMapper.deleteBannerByBannerIds(bannerIds);
    }

    /**
     * 删除Banner图片管理信息
     * 
     * @param bannerId Banner图片管理主键
     * @return 结果
     */
    @Override
    public int deleteBannerByBannerId(Long bannerId)
    {
        return bannerMapper.deleteBannerByBannerId(bannerId);
    }
}
