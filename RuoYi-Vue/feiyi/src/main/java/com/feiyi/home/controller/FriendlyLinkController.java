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
import com.feiyi.home.domain.FriendlyLink;
import com.feiyi.home.service.IFriendlyLinkService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 友情链接，管理页脚友情链接Controller
 * 
 * @author px
 * @date 2025-06-03
 */
@RestController
@RequestMapping("/home/footer/link")
public class FriendlyLinkController extends BaseController
{
    @Autowired
    private IFriendlyLinkService friendlyLinkService;

    /**
     * 查询友情链接，管理页脚友情链接列表
     */
    @PreAuthorize("@ss.hasPermi('home:footer:link:list')")
    @GetMapping("/list")
    public TableDataInfo list(FriendlyLink friendlyLink)
    {
        startPage();
        List<FriendlyLink> list = friendlyLinkService.selectFriendlyLinkList(friendlyLink);
        return getDataTable(list);
    }

    /**
     * 导出友情链接，管理页脚友情链接列表
     */
    @PreAuthorize("@ss.hasPermi('home:footer:link:export')")
    @Log(title = "友情链接，管理页脚友情链接", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FriendlyLink friendlyLink)
    {
        List<FriendlyLink> list = friendlyLinkService.selectFriendlyLinkList(friendlyLink);
        ExcelUtil<FriendlyLink> util = new ExcelUtil<FriendlyLink>(FriendlyLink.class);
        util.exportExcel(response, list, "友情链接，管理页脚友情链接数据");
    }

    /**
     * 获取友情链接，管理页脚友情链接详细信息
     */
    @PreAuthorize("@ss.hasPermi('home:footer:link:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(friendlyLinkService.selectFriendlyLinkById(id));
    }

    /**
     * 新增友情链接，管理页脚友情链接
     */
    @PreAuthorize("@ss.hasPermi('home:footer:link:add')")
    @Log(title = "友情链接，管理页脚友情链接", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FriendlyLink friendlyLink)
    {
        return toAjax(friendlyLinkService.insertFriendlyLink(friendlyLink));
    }

    /**
     * 修改友情链接，管理页脚友情链接
     */
    @PreAuthorize("@ss.hasPermi('home:footer:link:edit')")
    @Log(title = "友情链接，管理页脚友情链接", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FriendlyLink friendlyLink)
    {
        return toAjax(friendlyLinkService.updateFriendlyLink(friendlyLink));
    }

    /**
     * 删除友情链接，管理页脚友情链接
     */
    @PreAuthorize("@ss.hasPermi('home:footer:link:remove')")
    @Log(title = "友情链接，管理页脚友情链接", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(friendlyLinkService.deleteFriendlyLinkByIds(ids));
    }
}
