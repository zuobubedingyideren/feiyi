package com.feiyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 首页轮播图，管理首页展示的图片及跳转链接对象 banner
 * 
 * @author px
 * @date 2025-05-28
 */
public class Banner extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 轮播图唯一标识，自增主键 */
    private Long id;

    /** 轮播图标题 */
    @Excel(name = "轮播图标题")
    private String title;

    /** 轮播图片地址 */
    @Excel(name = "轮播图片地址")
    private String imageUrl;

    /** 点击轮播图跳转的链接 */
    @Excel(name = "点击轮播图跳转的链接")
    private String linkUrl;

    /** 页面类型（如首页、专题页等） */
    @Excel(name = "页面类型", readConverterExp = "如=首页、专题页等")
    private Long pageType;

    /** 显示顺序，数值越小越靠前 */
    @Excel(name = "显示顺序，数值越小越靠前")
    private Long displayOrder;

    /** 轮播图状态：1-显示，0-隐藏 */
    @Excel(name = "轮播图状态：1-显示，0-隐藏")
    private Long status;

    /** 图片宽高比 */
    @Excel(name = "图片宽高比")
    private String aspectRatio;

    /** 记录创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "记录创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdAt;

    /** 记录更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "记录更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updatedAt;

    /** 创建人ID */
    @Excel(name = "创建人ID")
    private Long createdBy;

    /** 更新人ID */
    @Excel(name = "更新人ID")
    private Long updatedBy;

    /** 逻辑删除标志：0-未删除，1-已删除 */
    private Long isDeleted;

    /** 删除时间 */
    private Date deletedAt;

    /** 删除人ID */
    private Long deletedBy;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }

    public void setImageUrl(String imageUrl) 
    {
        this.imageUrl = imageUrl;
    }

    public String getImageUrl() 
    {
        return imageUrl;
    }

    public void setLinkUrl(String linkUrl) 
    {
        this.linkUrl = linkUrl;
    }

    public String getLinkUrl() 
    {
        return linkUrl;
    }

    public void setPageType(Long pageType) 
    {
        this.pageType = pageType;
    }

    public Long getPageType() 
    {
        return pageType;
    }

    public void setDisplayOrder(Long displayOrder) 
    {
        this.displayOrder = displayOrder;
    }

    public Long getDisplayOrder() 
    {
        return displayOrder;
    }

    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }

    public void setAspectRatio(String aspectRatio) 
    {
        this.aspectRatio = aspectRatio;
    }

    public String getAspectRatio() 
    {
        return aspectRatio;
    }

    public void setCreatedAt(Date createdAt) 
    {
        this.createdAt = createdAt;
    }

    public Date getCreatedAt() 
    {
        return createdAt;
    }

    public void setUpdatedAt(Date updatedAt) 
    {
        this.updatedAt = updatedAt;
    }

    public Date getUpdatedAt() 
    {
        return updatedAt;
    }

    public void setCreatedBy(Long createdBy) 
    {
        this.createdBy = createdBy;
    }

    public Long getCreatedBy() 
    {
        return createdBy;
    }

    public void setUpdatedBy(Long updatedBy) 
    {
        this.updatedBy = updatedBy;
    }

    public Long getUpdatedBy() 
    {
        return updatedBy;
    }

    public void setIsDeleted(Long isDeleted) 
    {
        this.isDeleted = isDeleted;
    }

    public Long getIsDeleted() 
    {
        return isDeleted;
    }

    public void setDeletedAt(Date deletedAt) 
    {
        this.deletedAt = deletedAt;
    }

    public Date getDeletedAt() 
    {
        return deletedAt;
    }

    public void setDeletedBy(Long deletedBy) 
    {
        this.deletedBy = deletedBy;
    }

    public Long getDeletedBy() 
    {
        return deletedBy;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("title", getTitle())
            .append("imageUrl", getImageUrl())
            .append("linkUrl", getLinkUrl())
            .append("pageType", getPageType())
            .append("displayOrder", getDisplayOrder())
            .append("status", getStatus())
            .append("aspectRatio", getAspectRatio())
            .append("createdAt", getCreatedAt())
            .append("updatedAt", getUpdatedAt())
            .append("createdBy", getCreatedBy())
            .append("updatedBy", getUpdatedBy())
            .append("isDeleted", getIsDeleted())
            .append("deletedAt", getDeletedAt())
            .append("deletedBy", getDeletedBy())
            .toString();
    }
}
