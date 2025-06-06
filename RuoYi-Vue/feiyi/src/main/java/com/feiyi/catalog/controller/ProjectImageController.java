package com.feiyi.catalog.controller;

import java.util.List;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.feiyi.catalog.domain.ProjectImage;
import com.feiyi.catalog.service.IProjectImageService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 项目图片Controller
 * 
 * @author px
 * @date 2025-06-06
 */
@RestController
@RequestMapping("/catalog/image")
public class ProjectImageController extends BaseController
{
    @Autowired
    private IProjectImageService projectImageService;

    /**
     * 查询项目图片列表
     */
    @PreAuthorize("@ss.hasPermi('catalog:image:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProjectImage projectImage)
    {
        startPage();
        List<ProjectImage> list = projectImageService.selectProjectImageList(projectImage);
        return getDataTable(list);
    }

    /**
     * 导出项目图片列表
     */
    @PreAuthorize("@ss.hasPermi('catalog:image:export')")
    @Log(title = "项目图片", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ProjectImage projectImage)
    {
        List<ProjectImage> list = projectImageService.selectProjectImageList(projectImage);
        ExcelUtil<ProjectImage> util = new ExcelUtil<ProjectImage>(ProjectImage.class);
        util.exportExcel(response, list, "项目图片数据");
    }

    /**
     * 获取项目图片详细信息
     */
    @PreAuthorize("@ss.hasPermi('catalog:image:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(projectImageService.selectProjectImageById(id));
    }

    /**
     * 新增项目图片
     */
    @PreAuthorize("@ss.hasPermi('catalog:image:add')")
    @Log(title = "项目图片", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProjectImage projectImage)
    {
        return toAjax(projectImageService.insertProjectImage(projectImage));
    }

    /**
     * 修改项目图片
     */
    @PreAuthorize("@ss.hasPermi('catalog:image:edit')")
    @Log(title = "项目图片", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProjectImage projectImage)
    {
        return toAjax(projectImageService.updateProjectImage(projectImage));
    }

    /**
     * 删除项目图片
     */
    @PreAuthorize("@ss.hasPermi('catalog:image:remove')")
    @Log(title = "项目图片", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(projectImageService.deleteProjectImageByIds(ids));
    }
}
