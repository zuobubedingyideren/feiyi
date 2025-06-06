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
import com.feiyi.catalog.domain.UnescoHeritage;
import com.feiyi.catalog.service.IUnescoHeritageService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * UNESCO非遗名录，管理联合国教科文组织非遗名录信息Controller
 * 
 * @author px
 * @date 2025-06-06
 */
@RestController
@RequestMapping("/catalog/heritage")
public class UnescoHeritageController extends BaseController
{
    @Autowired
    private IUnescoHeritageService unescoHeritageService;

    /**
     * 查询UNESCO非遗名录，管理联合国教科文组织非遗名录信息列表
     */
    @PreAuthorize("@ss.hasPermi('catalog:heritage:list')")
    @GetMapping("/list")
    public TableDataInfo list(UnescoHeritage unescoHeritage)
    {
        startPage();
        List<UnescoHeritage> list = unescoHeritageService.selectUnescoHeritageList(unescoHeritage);
        return getDataTable(list);
    }

    /**
     * 导出UNESCO非遗名录，管理联合国教科文组织非遗名录信息列表
     */
    @PreAuthorize("@ss.hasPermi('catalog:heritage:export')")
    @Log(title = "UNESCO非遗名录，管理联合国教科文组织非遗名录信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, UnescoHeritage unescoHeritage)
    {
        List<UnescoHeritage> list = unescoHeritageService.selectUnescoHeritageList(unescoHeritage);
        ExcelUtil<UnescoHeritage> util = new ExcelUtil<UnescoHeritage>(UnescoHeritage.class);
        util.exportExcel(response, list, "UNESCO非遗名录，管理联合国教科文组织非遗名录信息数据");
    }

    /**
     * 获取UNESCO非遗名录，管理联合国教科文组织非遗名录信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('catalog:heritage:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(unescoHeritageService.selectUnescoHeritageById(id));
    }

    /**
     * 新增UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     */
    @PreAuthorize("@ss.hasPermi('catalog:heritage:add')")
    @Log(title = "UNESCO非遗名录，管理联合国教科文组织非遗名录信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody UnescoHeritage unescoHeritage)
    {
        return toAjax(unescoHeritageService.insertUnescoHeritage(unescoHeritage));
    }

    /**
     * 修改UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     */
    @PreAuthorize("@ss.hasPermi('catalog:heritage:edit')")
    @Log(title = "UNESCO非遗名录，管理联合国教科文组织非遗名录信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody UnescoHeritage unescoHeritage)
    {
        return toAjax(unescoHeritageService.updateUnescoHeritage(unescoHeritage));
    }

    /**
     * 删除UNESCO非遗名录，管理联合国教科文组织非遗名录信息
     */
    @PreAuthorize("@ss.hasPermi('catalog:heritage:remove')")
    @Log(title = "UNESCO非遗名录，管理联合国教科文组织非遗名录信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(unescoHeritageService.deleteUnescoHeritageByIds(ids));
    }
}
