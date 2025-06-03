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
import com.feiyi.home.domain.Footer;
import com.feiyi.home.service.IFooterService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 技术支持Controller
 * 
 * @author px
 * @date 2025-06-03
 */
@RestController
@RequestMapping("/home/tech-support")
public class FooterController extends BaseController
{
    @Autowired
    private IFooterService footerService;

    /**
     * 查询技术支持列表
     */
    @PreAuthorize("@ss.hasPermi('home:tech-support:list')")
    @GetMapping("/list")
    public TableDataInfo list(Footer footer)
    {
        startPage();
        List<Footer> list = footerService.selectFooterList(footer);
        return getDataTable(list);
    }

    /**
     * 导出技术支持列表
     */
    @PreAuthorize("@ss.hasPermi('home:tech-support:export')")
    @Log(title = "技术支持", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Footer footer)
    {
        List<Footer> list = footerService.selectFooterList(footer);
        ExcelUtil<Footer> util = new ExcelUtil<Footer>(Footer.class);
        util.exportExcel(response, list, "技术支持数据");
    }

    /**
     * 获取技术支持详细信息
     */
    @PreAuthorize("@ss.hasPermi('home:tech-support:query')")
    @GetMapping(value = "/{footerId}")
    public AjaxResult getInfo(@PathVariable("footerId") Long footerId)
    {
        return success(footerService.selectFooterByFooterId(footerId));
    }

    /**
     * 新增技术支持
     */
    @PreAuthorize("@ss.hasPermi('home:tech-support:add')")
    @Log(title = "技术支持", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Footer footer)
    {
        return toAjax(footerService.insertFooter(footer));
    }

    /**
     * 修改技术支持
     */
    @PreAuthorize("@ss.hasPermi('home:tech-support:edit')")
    @Log(title = "技术支持", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Footer footer)
    {
        return toAjax(footerService.updateFooter(footer));
    }

    /**
     * 删除技术支持
     */
    @PreAuthorize("@ss.hasPermi('home:tech-support:remove')")
    @Log(title = "技术支持", businessType = BusinessType.DELETE)
	@DeleteMapping("/{footerIds}")
    public AjaxResult remove(@PathVariable Long[] footerIds)
    {
        return toAjax(footerService.deleteFooterByFooterIds(footerIds));
    }
}
