package com.feiyi.catalog.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 非遗项目，管理非遗项目信息对象 heritage_project
 * 
 * @author px
 * @date 2025-06-06
 */
public class HeritageProject extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 项目ID */
    private Long id;

    /** 项目名称 */
    @Excel(name = "项目名称")
    private String projectName;

    /** 遗产类别 */
    @Excel(name = "遗产类别")
    private String heritageCategoryName;

    /** 项目序号 */
    @Excel(name = "项目序号")
    private String serialNumber;

    /** 申报地区 */
    @Excel(name = "申报地区")
    private String declarationArea;

    /** 申报级别 */
    private Integer declarationLevel;

    /** 项目层级 */
    private Integer projectLevel;

    /** 父项目ID */
    private Long parentProjectId;

    /** 子项目 */
    private Integer hasSubProjects;

    /** 批次号 */
    @Excel(name = "批次号")
    private Integer batchNumber;

    /** 联合国教科文组织名录ID */
    private Long unescoId;

    /** 封面图片 */
    @Excel(name = "封面图片")
    private String coverImage;

    /** 项目重要里程碑 */
    @Excel(name = "项目重要里程碑")
    private String milestoneEvents;

    /** 项目介绍 */
    @Excel(name = "项目介绍")
    private String projectDescription;

    /** 遗产类型 */
    @Excel(name = "遗产类型")
    private String projectType;

    /** 保护单位 */
    @Excel(name = "保护单位")
    private String protectionUnit;

    /** 发布时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发布时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date publishTime;

    /** 文章来源 */
    private String articleSource;

    /** 浏览次数 */
    private Integer viewCount;

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

    public void setProjectName(String projectName) 
    {
        this.projectName = projectName;
    }

    public String getProjectName() 
    {
        return projectName;
    }

    public void setHeritageCategoryName(String heritageCategoryName) 
    {
        this.heritageCategoryName = heritageCategoryName;
    }

    public String getHeritageCategoryName() 
    {
        return heritageCategoryName;
    }

    public void setSerialNumber(String serialNumber) 
    {
        this.serialNumber = serialNumber;
    }

    public String getSerialNumber() 
    {
        return serialNumber;
    }

    public void setDeclarationArea(String declarationArea) 
    {
        this.declarationArea = declarationArea;
    }

    public String getDeclarationArea() 
    {
        return declarationArea;
    }

    public void setDeclarationLevel(Integer declarationLevel) 
    {
        this.declarationLevel = declarationLevel;
    }

    public Integer getDeclarationLevel() 
    {
        return declarationLevel;
    }

    public void setProjectLevel(Integer projectLevel) 
    {
        this.projectLevel = projectLevel;
    }

    public Integer getProjectLevel() 
    {
        return projectLevel;
    }

    public void setParentProjectId(Long parentProjectId) 
    {
        this.parentProjectId = parentProjectId;
    }

    public Long getParentProjectId() 
    {
        return parentProjectId;
    }

    public void setHasSubProjects(Integer hasSubProjects) 
    {
        this.hasSubProjects = hasSubProjects;
    }

    public Integer getHasSubProjects() 
    {
        return hasSubProjects;
    }

    public void setBatchNumber(Integer batchNumber) 
    {
        this.batchNumber = batchNumber;
    }

    public Integer getBatchNumber() 
    {
        return batchNumber;
    }

    public void setUnescoId(Long unescoId) 
    {
        this.unescoId = unescoId;
    }

    public Long getUnescoId() 
    {
        return unescoId;
    }

    public void setCoverImage(String coverImage) 
    {
        this.coverImage = coverImage;
    }

    public String getCoverImage() 
    {
        return coverImage;
    }

    public void setMilestoneEvents(String milestoneEvents) 
    {
        this.milestoneEvents = milestoneEvents;
    }

    public String getMilestoneEvents() 
    {
        return milestoneEvents;
    }

    public void setProjectDescription(String projectDescription) 
    {
        this.projectDescription = projectDescription;
    }

    public String getProjectDescription() 
    {
        return projectDescription;
    }

    public void setProjectType(String projectType) 
    {
        this.projectType = projectType;
    }

    public String getProjectType() 
    {
        return projectType;
    }

    public void setProtectionUnit(String protectionUnit) 
    {
        this.protectionUnit = protectionUnit;
    }

    public String getProtectionUnit() 
    {
        return protectionUnit;
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

    public void setViewCount(Integer viewCount) 
    {
        this.viewCount = viewCount;
    }

    public Integer getViewCount() 
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
            .append("projectName", getProjectName())
            .append("heritageCategoryName", getHeritageCategoryName())
            .append("serialNumber", getSerialNumber())
            .append("declarationArea", getDeclarationArea())
            .append("declarationLevel", getDeclarationLevel())
            .append("projectLevel", getProjectLevel())
            .append("parentProjectId", getParentProjectId())
            .append("hasSubProjects", getHasSubProjects())
            .append("batchNumber", getBatchNumber())
            .append("unescoId", getUnescoId())
            .append("coverImage", getCoverImage())
            .append("milestoneEvents", getMilestoneEvents())
            .append("projectDescription", getProjectDescription())
            .append("projectType", getProjectType())
            .append("protectionUnit", getProtectionUnit())
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
