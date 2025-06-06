package com.feiyi.catalog.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 非遗传承人对象 heritage_inheritor
 * 
 * @author px
 * @date 2025-06-06
 */
public class HeritageInheritor extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 传承人ID */
    private Long id;

    /** 项目ID */
    @Excel(name = "项目ID")
    private Long projectId;

    /** 传承人姓名 */
    @Excel(name = "传承人姓名")
    private String inheritorName;

    /** 性别 */
    @Excel(name = "性别")
    private Integer gender;

    /** 民族 */
    @Excel(name = "民族")
    private String nation;

    /** 传承人头像 */
    @Excel(name = "传承人头像")
    private String avatarUrl;

    /** 传承人级别 */
    @Excel(name = "传承人级别")
    private Integer inheritorLevel;

    /** 传承人详细信息描述 */
    @Excel(name = "传承人详细信息描述")
    private String inheritorInfo;

    /** 公布日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "公布日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date announceDate;

    /** 发布时间 */
    private Date publishTime;

    /** 文章来源 */
    private String articleSource;

    /** 浏览量 */
    private Long viewCount;

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
    private Integer delFlag;

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

    public void setProjectId(Long projectId) 
    {
        this.projectId = projectId;
    }

    public Long getProjectId() 
    {
        return projectId;
    }

    public void setInheritorName(String inheritorName) 
    {
        this.inheritorName = inheritorName;
    }

    public String getInheritorName() 
    {
        return inheritorName;
    }

    public void setGender(Integer gender) 
    {
        this.gender = gender;
    }

    public Integer getGender() 
    {
        return gender;
    }

    public void setNation(String nation) 
    {
        this.nation = nation;
    }

    public String getNation() 
    {
        return nation;
    }

    public void setAvatarUrl(String avatarUrl) 
    {
        this.avatarUrl = avatarUrl;
    }

    public String getAvatarUrl() 
    {
        return avatarUrl;
    }

    public void setInheritorLevel(Integer inheritorLevel) 
    {
        this.inheritorLevel = inheritorLevel;
    }

    public Integer getInheritorLevel() 
    {
        return inheritorLevel;
    }

    public void setInheritorInfo(String inheritorInfo) 
    {
        this.inheritorInfo = inheritorInfo;
    }

    public String getInheritorInfo() 
    {
        return inheritorInfo;
    }

    public void setAnnounceDate(Date announceDate) 
    {
        this.announceDate = announceDate;
    }

    public Date getAnnounceDate() 
    {
        return announceDate;
    }

    public void setPublishTime(Date publishTime) 
    {
        this.publishTime = publishTime;
    }

    public Date getPublishTime() 
    {
        return publishTime;
    }

    public void setArticleSource(String articleSource) 
    {
        this.articleSource = articleSource;
    }

    public String getArticleSource() 
    {
        return articleSource;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("projectId", getProjectId())
            .append("inheritorName", getInheritorName())
            .append("gender", getGender())
            .append("nation", getNation())
            .append("avatarUrl", getAvatarUrl())
            .append("inheritorLevel", getInheritorLevel())
            .append("inheritorInfo", getInheritorInfo())
            .append("announceDate", getAnnounceDate())
            .append("publishTime", getPublishTime())
            .append("articleSource", getArticleSource())
            .append("viewCount", getViewCount())
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
