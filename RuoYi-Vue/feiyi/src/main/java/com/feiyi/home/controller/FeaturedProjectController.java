package com.feiyi.home.controller;

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
import com.feiyi.home.domain.FeaturedProject;
import com.feiyi.home.service.IFeaturedProjectService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 热门项目Controller
 * 
 * @author px
 * @date 2025-06-06
 */
@RestController
@RequestMapping("/home/hot")
public class FeaturedProjectController extends BaseController
{
    @Autowired
    private IFeaturedProjectService featuredProjectService;

    /**
     * 查询热门项目列表
     */
    @PreAuthorize("@ss.hasPermi('home:hot:list')")
    @GetMapping("/list")
    public TableDataInfo list(FeaturedProject featuredProject)
    {
        startPage();
        List<FeaturedProject> list = featuredProjectService.selectFeaturedProjectList(featuredProject);
        return getDataTable(list);
    }

    /**
     * 导出热门项目列表
     */
    @PreAuthorize("@ss.hasPermi('home:hot:export')")
    @Log(title = "热门项目", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FeaturedProject featuredProject)
    {
        List<FeaturedProject> list = featuredProjectService.selectFeaturedProjectList(featuredProject);
        ExcelUtil<FeaturedProject> util = new ExcelUtil<FeaturedProject>(FeaturedProject.class);
        util.exportExcel(response, list, "热门项目数据");
    }

    /**
     * 获取热门项目详细信息
     */
    @PreAuthorize("@ss.hasPermi('home:hot:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(featuredProjectService.selectFeaturedProjectById(id));
    }

    /**
     * 新增热门项目
     */
    @PreAuthorize("@ss.hasPermi('home:hot:add')")
    @Log(title = "热门项目", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FeaturedProject featuredProject)
    {
        return toAjax(featuredProjectService.insertFeaturedProject(featuredProject));
    }

    /**
     * 修改热门项目
     */
    @PreAuthorize("@ss.hasPermi('home:hot:edit')")
    @Log(title = "热门项目", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FeaturedProject featuredProject)
    {
        return toAjax(featuredProjectService.updateFeaturedProject(featuredProject));
    }

    /**
     * 删除热门项目
     */
    @PreAuthorize("@ss.hasPermi('home:hot:remove')")
    @Log(title = "热门项目", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(featuredProjectService.deleteFeaturedProjectByIds(ids));
    }
}
