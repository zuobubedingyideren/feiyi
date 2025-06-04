package com.feiyi.home.controller;

import java.util.List;

import com.ruoyi.common.annotation.Anonymous;
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
import com.feiyi.home.domain.HomeIntroduction;
import com.feiyi.home.service.IHomeIntroductionService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 首页引言，管理首页引言内容Controller
 * 
 * @author px
 * @date 2025-06-03
 */
@RestController
@RequestMapping("/home/introduction")
public class HomeIntroductionController extends BaseController
{
    @Autowired
    private IHomeIntroductionService homeIntroductionService;

    /**
     * 查询首页引言，管理首页引言内容列表
     */
    // @PreAuthorize("@ss.hasPermi('home:introduction:list')")
    @GetMapping("/list")
    @Anonymous
    public TableDataInfo list(HomeIntroduction homeIntroduction)
    {
        startPage();
        List<HomeIntroduction> list = homeIntroductionService.selectHomeIntroductionList(homeIntroduction);
        return getDataTable(list);
    }

    /**
     * 导出首页引言，管理首页引言内容列表
     */
    @PreAuthorize("@ss.hasPermi('home:introduction:export')")
    @Log(title = "首页引言，管理首页引言内容", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HomeIntroduction homeIntroduction)
    {
        List<HomeIntroduction> list = homeIntroductionService.selectHomeIntroductionList(homeIntroduction);
        ExcelUtil<HomeIntroduction> util = new ExcelUtil<HomeIntroduction>(HomeIntroduction.class);
        util.exportExcel(response, list, "首页引言，管理首页引言内容数据");
    }

    /**
     * 获取首页引言，管理首页引言内容详细信息
     */
    @PreAuthorize("@ss.hasPermi('home:introduction:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(homeIntroductionService.selectHomeIntroductionById(id));
    }

    /**
     * 新增首页引言，管理首页引言内容
     */
    @PreAuthorize("@ss.hasPermi('home:introduction:add')")
    @Log(title = "首页引言，管理首页引言内容", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HomeIntroduction homeIntroduction)
    {
        return toAjax(homeIntroductionService.insertHomeIntroduction(homeIntroduction));
    }

    /**
     * 修改首页引言，管理首页引言内容
     */
    @PreAuthorize("@ss.hasPermi('home:introduction:edit')")
    @Log(title = "首页引言，管理首页引言内容", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HomeIntroduction homeIntroduction)
    {
        return toAjax(homeIntroductionService.updateHomeIntroduction(homeIntroduction));
    }

    /**
     * 删除首页引言，管理首页引言内容
     */
    @PreAuthorize("@ss.hasPermi('home:introduction:remove')")
    @Log(title = "首页引言，管理首页引言内容", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(homeIntroductionService.deleteHomeIntroductionByIds(ids));
    }
}
