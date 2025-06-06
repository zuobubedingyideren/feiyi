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
import com.feiyi.catalog.domain.HeritageInheritor;
import com.feiyi.catalog.service.IHeritageInheritorService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 非遗传承人Controller
 * 
 * @author px
 * @date 2025-06-06
 */
@RestController
@RequestMapping("/catalog/inheritor")
public class HeritageInheritorController extends BaseController
{
    @Autowired
    private IHeritageInheritorService heritageInheritorService;

    /**
     * 查询非遗传承人列表
     */
    @PreAuthorize("@ss.hasPermi('catalog:inheritor:list')")
    @GetMapping("/list")
    public TableDataInfo list(HeritageInheritor heritageInheritor)
    {
        startPage();
        List<HeritageInheritor> list = heritageInheritorService.selectHeritageInheritorList(heritageInheritor);
        return getDataTable(list);
    }

    /**
     * 导出非遗传承人列表
     */
    @PreAuthorize("@ss.hasPermi('catalog:inheritor:export')")
    @Log(title = "非遗传承人", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HeritageInheritor heritageInheritor)
    {
        List<HeritageInheritor> list = heritageInheritorService.selectHeritageInheritorList(heritageInheritor);
        ExcelUtil<HeritageInheritor> util = new ExcelUtil<HeritageInheritor>(HeritageInheritor.class);
        util.exportExcel(response, list, "非遗传承人数据");
    }

    /**
     * 获取非遗传承人详细信息
     */
    @PreAuthorize("@ss.hasPermi('catalog:inheritor:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(heritageInheritorService.selectHeritageInheritorById(id));
    }

    /**
     * 新增非遗传承人
     */
    @PreAuthorize("@ss.hasPermi('catalog:inheritor:add')")
    @Log(title = "非遗传承人", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HeritageInheritor heritageInheritor)
    {
        return toAjax(heritageInheritorService.insertHeritageInheritor(heritageInheritor));
    }

    /**
     * 修改非遗传承人
     */
    @PreAuthorize("@ss.hasPermi('catalog:inheritor:edit')")
    @Log(title = "非遗传承人", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HeritageInheritor heritageInheritor)
    {
        return toAjax(heritageInheritorService.updateHeritageInheritor(heritageInheritor));
    }

    /**
     * 删除非遗传承人
     */
    @PreAuthorize("@ss.hasPermi('catalog:inheritor:remove')")
    @Log(title = "非遗传承人", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(heritageInheritorService.deleteHeritageInheritorByIds(ids));
    }
}
