package com.feiyi.academic.controller;

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
import com.feiyi.academic.domain.Interview;
import com.feiyi.academic.service.IInterviewService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 访谈，管理学者、传承人等访谈内容Controller
 * 
 * @author px
 * @date 2025-06-04
 */
@RestController
@RequestMapping("/academic/interview")
public class InterviewController extends BaseController
{
    @Autowired
    private IInterviewService interviewService;

    /**
     * 查询访谈，管理学者、传承人等访谈内容列表
     */
    // @PreAuthorize("@ss.hasPermi('academic:interview:list')")
    @GetMapping("/list")
    @Anonymous
    public TableDataInfo list(Interview interview)
    {
        startPage();
        List<Interview> list = interviewService.selectInterviewList(interview);
        return getDataTable(list);
    }

    /**
     * 导出访谈，管理学者、传承人等访谈内容列表
     */
    @PreAuthorize("@ss.hasPermi('academic:interview:export')")
    @Log(title = "访谈，管理学者、传承人等访谈内容", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Interview interview)
    {
        List<Interview> list = interviewService.selectInterviewList(interview);
        ExcelUtil<Interview> util = new ExcelUtil<Interview>(Interview.class);
        util.exportExcel(response, list, "访谈，管理学者、传承人等访谈内容数据");
    }

    /**
     * 获取访谈，管理学者、传承人等访谈内容详细信息
     */
    @PreAuthorize("@ss.hasPermi('academic:interview:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(interviewService.selectInterviewById(id));
    }

    /**
     * 新增访谈，管理学者、传承人等访谈内容
     */
    @PreAuthorize("@ss.hasPermi('academic:interview:add')")
    @Log(title = "访谈，管理学者、传承人等访谈内容", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Interview interview)
    {
        return toAjax(interviewService.insertInterview(interview));
    }

    /**
     * 修改访谈，管理学者、传承人等访谈内容
     */
    @PreAuthorize("@ss.hasPermi('academic:interview:edit')")
    @Log(title = "访谈，管理学者、传承人等访谈内容", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Interview interview)
    {
        return toAjax(interviewService.updateInterview(interview));
    }

    /**
     * 删除访谈，管理学者、传承人等访谈内容
     */
    @PreAuthorize("@ss.hasPermi('academic:interview:remove')")
    @Log(title = "访谈，管理学者、传承人等访谈内容", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(interviewService.deleteInterviewByIds(ids));
    }
}
