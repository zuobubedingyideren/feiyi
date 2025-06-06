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
import com.feiyi.catalog.domain.HeritageProject;
import com.feiyi.catalog.service.IHeritageProjectService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 非遗项目，管理非遗项目信息Controller
 * 
 * @author px
 * @date 2025-06-06
 */
@RestController
@RequestMapping("/catalog/project")
public class HeritageProjectController extends BaseController
{
    @Autowired
    private IHeritageProjectService heritageProjectService;

    /**
     * 查询非遗项目，管理非遗项目信息列表
     */
    @PreAuthorize("@ss.hasPermi('catalog:project:list')")
    @GetMapping("/list")
    public TableDataInfo list(HeritageProject heritageProject)
    {
        startPage();
        List<HeritageProject> list = heritageProjectService.selectHeritageProjectList(heritageProject);
        return getDataTable(list);
    }

    /**
     * 导出非遗项目，管理非遗项目信息列表
     */
    @PreAuthorize("@ss.hasPermi('catalog:project:export')")
    @Log(title = "非遗项目，管理非遗项目信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HeritageProject heritageProject)
    {
        List<HeritageProject> list = heritageProjectService.selectHeritageProjectList(heritageProject);
        ExcelUtil<HeritageProject> util = new ExcelUtil<HeritageProject>(HeritageProject.class);
        util.exportExcel(response, list, "非遗项目，管理非遗项目信息数据");
    }

    /**
     * 获取非遗项目，管理非遗项目信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('catalog:project:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(heritageProjectService.selectHeritageProjectById(id));
    }

    /**
     * 新增非遗项目，管理非遗项目信息
     */
    @PreAuthorize("@ss.hasPermi('catalog:project:add')")
    @Log(title = "非遗项目，管理非遗项目信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HeritageProject heritageProject)
    {
        return toAjax(heritageProjectService.insertHeritageProject(heritageProject));
    }

    /**
     * 修改非遗项目，管理非遗项目信息
     */
    @PreAuthorize("@ss.hasPermi('catalog:project:edit')")
    @Log(title = "非遗项目，管理非遗项目信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HeritageProject heritageProject)
    {
        return toAjax(heritageProjectService.updateHeritageProject(heritageProject));
    }

    /**
     * 删除非遗项目，管理非遗项目信息
     */
    @PreAuthorize("@ss.hasPermi('catalog:project:remove')")
    @Log(title = "非遗项目，管理非遗项目信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(heritageProjectService.deleteHeritageProjectByIds(ids));
    }
}
