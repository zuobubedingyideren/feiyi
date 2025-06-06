package com.feiyi.catalog.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * UNESCO非遗名录，管理联合国教科文组织非遗名录信息对象 unesco_heritage
 * 
 * @author px
 * @date 2025-06-06
 */
public class UnescoHeritage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 名录ID */
    private Long id;

    /** 项目ID */
    @Excel(name = "项目ID")
    private Long projectId;

    /** 名录类别 */
    @Excel(name = "名录类别")
    private String unescoCategory;

    /** 名录类型 */
    @Excel(name = "名录类型")
    private Integer unescoListType;

    /** 入选年份 */
    @Excel(name = "入选年份")
    private Integer unescoYear;

    /** 名录描述 */
    private String unescoDescription;

    /** 发布时间 */
    private Date publishTime;

    /** 文章来源 */
    private String articleSource;

    /** 浏览次数 */
    private Long viewCount;

    /** 状态 */
    @Excel(name = "状态")
    private Integer status;

    /** 创建时间 */
    private Date createdAt;

    /** 更新时间 */
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

    public void setUnescoCategory(String unescoCategory) 
    {
        this.unescoCategory = unescoCategory;
    }

    public String getUnescoCategory() 
    {
        return unescoCategory;
    }

    public void setUnescoListType(Integer unescoListType) 
    {
        this.unescoListType = unescoListType;
    }

    public Integer getUnescoListType() 
    {
        return unescoListType;
    }

    public void setUnescoYear(Integer unescoYear) 
    {
        this.unescoYear = unescoYear;
    }

    public Integer getUnescoYear() 
    {
        return unescoYear;
    }

    public void setUnescoDescription(String unescoDescription) 
    {
        this.unescoDescription = unescoDescription;
    }

    public String getUnescoDescription() 
    {
        return unescoDescription;
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
            .append("unescoCategory", getUnescoCategory())
            .append("unescoListType", getUnescoListType())
            .append("unescoYear", getUnescoYear())
            .append("unescoDescription", getUnescoDescription())
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
