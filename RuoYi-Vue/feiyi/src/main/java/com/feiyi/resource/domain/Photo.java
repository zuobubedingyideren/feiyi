package com.feiyi.resource.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 照片，管理影集中的照片对象 photo
 * 
 * @author px
 * @date 2025-06-05
 */
public class Photo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 图片id */
    private Long id;

    /** 所属影集ID */
    @Excel(name = "所属影集ID")
    private Long albumId;

    /** 照片标题 */
    @Excel(name = "照片标题")
    private String photoTitle;

    /** 照片URL */
    @Excel(name = "照片URL")
    private String photoUrl;

    /** 照片描述 */
    @Excel(name = "照片描述")
    private String photoDesc;

    /** 水印图片URL */
    @Excel(name = "水印图片URL")
    private String watermarkUrl;

    /** 水印位置 */
    @Excel(name = "水印位置")
    private String watermarkPosition;

    /** 水印透明度 */
    @Excel(name = "水印透明度")
    private Integer watermarkOpacity;

    /** 排序顺序 */
    @Excel(name = "排序顺序")
    private Integer sortOrder;

    /** 状态 */
    @Excel(name = "状态")
    private Integer status;

    /** 创建时间 */
    private Date createdAt;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updatedAt;

    /** 创建人ID */
    private Long createdBy;

    /** 更新人ID */
    private Long updatedBy;

    /** 逻辑删除标志 */
    private Long delFlag;

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
    public void setAlbumId(Long albumId) 
    {
        this.albumId = albumId;
    }

    public Long getAlbumId() 
    {
        return albumId;
    }
    public void setPhotoTitle(String photoTitle) 
    {
        this.photoTitle = photoTitle;
    }

    public String getPhotoTitle() 
    {
        return photoTitle;
    }
    public void setPhotoUrl(String photoUrl) 
    {
        this.photoUrl = photoUrl;
    }

    public String getPhotoUrl() 
    {
        return photoUrl;
    }
    public void setPhotoDesc(String photoDesc) 
    {
        this.photoDesc = photoDesc;
    }

    public String getPhotoDesc() 
    {
        return photoDesc;
    }
    public void setWatermarkUrl(String watermarkUrl) 
    {
        this.watermarkUrl = watermarkUrl;
    }

    public String getWatermarkUrl() 
    {
        return watermarkUrl;
    }
    public void setWatermarkPosition(String watermarkPosition) 
    {
        this.watermarkPosition = watermarkPosition;
    }

    public String getWatermarkPosition() 
    {
        return watermarkPosition;
    }
    public void setWatermarkOpacity(Integer watermarkOpacity) 
    {
        this.watermarkOpacity = watermarkOpacity;
    }

    public Integer getWatermarkOpacity() 
    {
        return watermarkOpacity;
    }
    public void setSortOrder(Integer sortOrder) 
    {
        this.sortOrder = sortOrder;
    }

    public Integer getSortOrder() 
    {
        return sortOrder;
    }
    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
    {
        return status;
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
    public void setDelFlag(Long delFlag) 
    {
        this.delFlag = delFlag;
    }

    public Long getDelFlag() 
    {
        return delFlag;
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
            .append("albumId", getAlbumId())
            .append("photoTitle", getPhotoTitle())
            .append("photoUrl", getPhotoUrl())
            .append("photoDesc", getPhotoDesc())
            .append("watermarkUrl", getWatermarkUrl())
            .append("watermarkPosition", getWatermarkPosition())
            .append("watermarkOpacity", getWatermarkOpacity())
            .append("sortOrder", getSortOrder())
            .append("status", getStatus())
            .append("createdAt", getCreatedAt())
            .append("updatedAt", getUpdatedAt())
            .append("createdBy", getCreatedBy())
            .append("updatedBy", getUpdatedBy())
            .append("delFlag", getDelFlag())
            .append("deletedAt", getDeletedAt())
            .append("deletedBy", getDeletedBy())
            .append("remark", getRemark())
            .toString();
    }
}
