package com.feiyi.academic.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 访谈，管理学者、传承人等访谈内容对象 interview
 * 
 * @author px
 * @date 2025-06-04
 */
public class Interview extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 访谈标题 */
    @Excel(name = "访谈标题")
    private String title;

    /** 受访者姓名 */
    @Excel(name = "受访者姓名")
    private String interviewee;

    /** 受访者头像 */
    @Excel(name = "受访者头像")
    private String avatarUrl;

    /** 受访者简介 */
    @Excel(name = "受访者简介")
    private String shortBio;

    /** 访谈日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "访谈日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date interviewDate;

    /** 访谈内容 */
    @Excel(name = "访谈内容")
    private String content;

    /** 是否推荐 */
    @Excel(name = "是否推荐")
    private Integer featured;

    /** 浏览次数 */
    @Excel(name = "浏览次数")
    private Long viewCount;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Integer displayOrder;

    /** 访谈状态 */
    @Excel(name = "访谈状态")
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

    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }

    public void setInterviewee(String interviewee) 
    {
        this.interviewee = interviewee;
    }

    public String getInterviewee() 
    {
        return interviewee;
    }

    public void setAvatarUrl(String avatarUrl) 
    {
        this.avatarUrl = avatarUrl;
    }

    public String getAvatarUrl() 
    {
        return avatarUrl;
    }

    public void setShortBio(String shortBio) 
    {
        this.shortBio = shortBio;
    }

    public String getShortBio() 
    {
        return shortBio;
    }

    public void setInterviewDate(Date interviewDate) 
    {
        this.interviewDate = interviewDate;
    }

    public Date getInterviewDate() 
    {
        return interviewDate;
    }

    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }

    public void setFeatured(Integer featured) 
    {
        this.featured = featured;
    }

    public Integer getFeatured() 
    {
        return featured;
    }

    public void setViewCount(Long viewCount) 
    {
        this.viewCount = viewCount;
    }

    public Long getViewCount() 
    {
        return viewCount;
    }

    public void setDisplayOrder(Integer displayOrder) 
    {
        this.displayOrder = displayOrder;
    }

    public Integer getDisplayOrder() 
    {
        return displayOrder;
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
            .append("title", getTitle())
            .append("interviewee", getInterviewee())
            .append("avatarUrl", getAvatarUrl())
            .append("shortBio", getShortBio())
            .append("interviewDate", getInterviewDate())
            .append("content", getContent())
            .append("featured", getFeatured())
            .append("viewCount", getViewCount())
            .append("displayOrder", getDisplayOrder())
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
