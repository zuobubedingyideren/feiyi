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
import com.feiyi.catalog.domain.AcademicResource;
import com.feiyi.catalog.service.IAcademicResourceService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 学术资源，管理非遗项目相关的学术资源Controller
 * 
 * @author px
 * @date 2025-06-06
 */
@RestController
@RequestMapping("/catalog/resource")
public class AcademicResourceController extends BaseController
{
    @Autowired
    private IAcademicResourceService academicResourceService;

    /**
     * 查询学术资源，管理非遗项目相关的学术资源列表
     */
    @PreAuthorize("@ss.hasPermi('catalog:resource:list')")
    @GetMapping("/list")
    public TableDataInfo list(AcademicResource academicResource)
    {
        startPage();
        List<AcademicResource> list = academicResourceService.selectAcademicResourceList(academicResource);
        return getDataTable(list);
    }

    /**
     * 导出学术资源，管理非遗项目相关的学术资源列表
     */
    @PreAuthorize("@ss.hasPermi('catalog:resource:export')")
    @Log(title = "学术资源，管理非遗项目相关的学术资源", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AcademicResource academicResource)
    {
        List<AcademicResource> list = academicResourceService.selectAcademicResourceList(academicResource);
        ExcelUtil<AcademicResource> util = new ExcelUtil<AcademicResource>(AcademicResource.class);
        util.exportExcel(response, list, "学术资源，管理非遗项目相关的学术资源数据");
    }

    /**
     * 获取学术资源，管理非遗项目相关的学术资源详细信息
     */
    @PreAuthorize("@ss.hasPermi('catalog:resource:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(academicResourceService.selectAcademicResourceById(id));
    }

    /**
     * 新增学术资源，管理非遗项目相关的学术资源
     */
    @PreAuthorize("@ss.hasPermi('catalog:resource:add')")
    @Log(title = "学术资源，管理非遗项目相关的学术资源", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AcademicResource academicResource)
    {
        return toAjax(academicResourceService.insertAcademicResource(academicResource));
    }

    /**
     * 修改学术资源，管理非遗项目相关的学术资源
     */
    @PreAuthorize("@ss.hasPermi('catalog:resource:edit')")
    @Log(title = "学术资源，管理非遗项目相关的学术资源", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AcademicResource academicResource)
    {
        return toAjax(academicResourceService.updateAcademicResource(academicResource));
    }

    /**
     * 删除学术资源，管理非遗项目相关的学术资源
     */
    @PreAuthorize("@ss.hasPermi('catalog:resource:remove')")
    @Log(title = "学术资源，管理非遗项目相关的学术资源", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(academicResourceService.deleteAcademicResourceByIds(ids));
    }
}
