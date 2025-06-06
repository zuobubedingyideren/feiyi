package com.feiyi.home.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 热门项目对象 featured_project
 * 
 * @author px
 * @date 2025-06-06
 */
public class FeaturedProject extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 热门项目ID */
    private Long id;

    /** 项目ID */
    @Excel(name = "项目ID")
    private Long projectId;

    /** 竖版图片 */
    @Excel(name = "竖版图片")
    private String verticalImage;

    /** 蒙版效果 */
    @Excel(name = "蒙版效果")
    private String maskEffect;

    /** 蒙版图片 */
    @Excel(name = "蒙版图片")
    private String maskImage;

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

    public void setVerticalImage(String verticalImage) 
    {
        this.verticalImage = verticalImage;
    }

    public String getVerticalImage() 
    {
        return verticalImage;
    }

    public void setMaskEffect(String maskEffect) 
    {
        this.maskEffect = maskEffect;
    }

    public String getMaskEffect() 
    {
        return maskEffect;
    }

    public void setMaskImage(String maskImage) 
    {
        this.maskImage = maskImage;
    }

    public String getMaskImage() 
    {
        return maskImage;
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
            .append("verticalImage", getVerticalImage())
            .append("maskEffect", getMaskEffect())
            .append("maskImage", getMaskImage())
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
