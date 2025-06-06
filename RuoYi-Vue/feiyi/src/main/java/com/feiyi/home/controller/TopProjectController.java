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
import com.feiyi.home.domain.TopProject;
import com.feiyi.home.service.ITopProjectService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 置顶项目，管理世界名录中的置顶项目Controller
 * 
 * @author px
 * @date 2025-06-06
 */
@RestController
@RequestMapping("/home/top")
public class TopProjectController extends BaseController
{
    @Autowired
    private ITopProjectService topProjectService;

    /**
     * 查询置顶项目，管理世界名录中的置顶项目列表
     */
    @PreAuthorize("@ss.hasPermi('home:top:list')")
    @GetMapping("/list")
    public TableDataInfo list(TopProject topProject)
    {
        startPage();
        List<TopProject> list = topProjectService.selectTopProjectList(topProject);
        return getDataTable(list);
    }

    /**
     * 导出置顶项目，管理世界名录中的置顶项目列表
     */
    @PreAuthorize("@ss.hasPermi('home:top:export')")
    @Log(title = "置顶项目，管理世界名录中的置顶项目", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TopProject topProject)
    {
        List<TopProject> list = topProjectService.selectTopProjectList(topProject);
        ExcelUtil<TopProject> util = new ExcelUtil<TopProject>(TopProject.class);
        util.exportExcel(response, list, "置顶项目，管理世界名录中的置顶项目数据");
    }

    /**
     * 获取置顶项目，管理世界名录中的置顶项目详细信息
     */
    @PreAuthorize("@ss.hasPermi('home:top:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(topProjectService.selectTopProjectById(id));
    }

    /**
     * 新增置顶项目，管理世界名录中的置顶项目
     */
    @PreAuthorize("@ss.hasPermi('home:top:add')")
    @Log(title = "置顶项目，管理世界名录中的置顶项目", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TopProject topProject)
    {
        return toAjax(topProjectService.insertTopProject(topProject));
    }

    /**
     * 修改置顶项目，管理世界名录中的置顶项目
     */
    @PreAuthorize("@ss.hasPermi('home:top:edit')")
    @Log(title = "置顶项目，管理世界名录中的置顶项目", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TopProject topProject)
    {
        return toAjax(topProjectService.updateTopProject(topProject));
    }

    /**
     * 删除置顶项目，管理世界名录中的置顶项目
     */
    @PreAuthorize("@ss.hasPermi('home:top:remove')")
    @Log(title = "置顶项目，管理世界名录中的置顶项目", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(topProjectService.deleteTopProjectByIds(ids));
    }
}
