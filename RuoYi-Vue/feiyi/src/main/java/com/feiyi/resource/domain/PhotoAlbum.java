package com.feiyi.resource.domain;

import java.util.List;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 影集，管理影集信息对象 photo_album
 * 
 * @author px
 * @date 2025-06-05
 */
public class PhotoAlbum extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 影集ID */
    private Long id;

    /** 影集名称 */
    @Excel(name = "影集名称")
    private String albumName;

    /** 图片年份 */
    @Excel(name = "图片年份")
    private Integer albumYear;

    /** 图片作者 */
    @Excel(name = "图片作者")
    private String photographer;

    /** 作者介绍 */
    @Excel(name = "作者介绍")
    private String photographerBio;

    /** 影集介绍 */
    @Excel(name = "影集介绍")
    private String albumDesc;

    /** 封面图片URL */
    @Excel(name = "封面图片URL")
    private String coverImage;

    /** 发布日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发布日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date releaseDate;

    /** 发布者 */
    @Excel(name = "发布者")
    private String publisher;

    /** 版权信息 */
    @Excel(name = "版权信息")
    private String copyright;

    /** 浏览次数 */
    @Excel(name = "浏览次数")
    private Long viewCount;

    /** 状态 */
    @Excel(name = "状态")
    private Integer status;

    /** 是否推荐 */
    @Excel(name = "是否推荐")
    private Integer isFeatured;

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
    private Integer delFlag;

    /** 删除时间 */
    private Date deletedAt;

    /** 删除人ID */
    private Long deletedBy;

    /** 照片，管理影集中的照片信息 */
    private List<Photo> photoList;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setAlbumName(String albumName) 
    {
        this.albumName = albumName;
    }

    public String getAlbumName() 
    {
        return albumName;
    }

    public void setAlbumYear(Integer albumYear) 
    {
        this.albumYear = albumYear;
    }

    public Integer getAlbumYear() 
    {
        return albumYear;
    }

    public void setPhotographer(String photographer) 
    {
        this.photographer = photographer;
    }

    public String getPhotographer() 
    {
        return photographer;
    }

    public void setPhotographerBio(String photographerBio) 
    {
        this.photographerBio = photographerBio;
    }

    public String getPhotographerBio() 
    {
        return photographerBio;
    }

    public void setAlbumDesc(String albumDesc) 
    {
        this.albumDesc = albumDesc;
    }

    public String getAlbumDesc() 
    {
        return albumDesc;
    }

    public void setCoverImage(String coverImage) 
    {
        this.coverImage = coverImage;
    }

    public String getCoverImage() 
    {
        return coverImage;
    }

    public void setReleaseDate(Date releaseDate) 
    {
        this.releaseDate = releaseDate;
    }

    public Date getReleaseDate() 
    {
        return releaseDate;
    }

    public void setPublisher(String publisher) 
    {
        this.publisher = publisher;
    }

    public String getPublisher() 
    {
        return publisher;
    }

    public void setCopyright(String copyright) 
    {
        this.copyright = copyright;
    }

    public String getCopyright() 
    {
        return copyright;
    }

    public void setViewCount(Long viewCount) 
    {
        this.viewCount = viewCount;
    }

    public Long getViewCount() 
    {
        return viewCount;
    }

    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
    {
        return status;
    }

    public void setIsFeatured(Integer isFeatured) 
    {
        this.isFeatured = isFeatured;
    }

    public Integer getIsFeatured() 
    {
        return isFeatured;
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

    public void setDelFlag(Integer delFlag) 
    {
        this.delFlag = delFlag;
    }

    public Integer getDelFlag() 
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

    public List<Photo> getPhotoList()
    {
        return photoList;
    }

    public void setPhotoList(List<Photo> photoList)
    {
        this.photoList = photoList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("albumName", getAlbumName())
            .append("albumYear", getAlbumYear())
            .append("photographer", getPhotographer())
            .append("photographerBio", getPhotographerBio())
            .append("albumDesc", getAlbumDesc())
            .append("coverImage", getCoverImage())
            .append("releaseDate", getReleaseDate())
            .append("publisher", getPublisher())
            .append("copyright", getCopyright())
            .append("viewCount", getViewCount())
            .append("status", getStatus())
            .append("isFeatured", getIsFeatured())
            .append("createdAt", getCreatedAt())
            .append("updatedAt", getUpdatedAt())
            .append("createdBy", getCreatedBy())
            .append("updatedBy", getUpdatedBy())
            .append("delFlag", getDelFlag())
            .append("deletedAt", getDeletedAt())
            .append("deletedBy", getDeletedBy())
            .append("remark", getRemark())
            .append("photoList", getPhotoList())
            .toString();
    }
}
