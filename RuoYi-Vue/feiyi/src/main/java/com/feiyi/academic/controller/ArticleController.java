package com.feiyi.academic.controller;

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
import com.feiyi.academic.domain.Article;
import com.feiyi.academic.service.IArticleService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 学术文章，管理学术研究类文章信息Controller
 * 
 * @author px
 * @date 2025-06-04
 */
@RestController
@RequestMapping("/academic/article")
public class ArticleController extends BaseController
{
    @Autowired
    private IArticleService articleService;

    /**
     * 查询学术文章，管理学术研究类文章信息列表
     */
    @PreAuthorize("@ss.hasPermi('academic:article:list')")
    @GetMapping("/list")
    public TableDataInfo list(Article article)
    {
        startPage();
        List<Article> list = articleService.selectArticleList(article);
        return getDataTable(list);
    }

    /**
     * 导出学术文章，管理学术研究类文章信息列表
     */
    @PreAuthorize("@ss.hasPermi('academic:article:export')")
    @Log(title = "学术文章，管理学术研究类文章信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Article article)
    {
        List<Article> list = articleService.selectArticleList(article);
        ExcelUtil<Article> util = new ExcelUtil<Article>(Article.class);
        util.exportExcel(response, list, "学术文章，管理学术研究类文章信息数据");
    }

    /**
     * 获取学术文章，管理学术研究类文章信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('academic:article:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(articleService.selectArticleById(id));
    }

    /**
     * 新增学术文章，管理学术研究类文章信息
     */
    @PreAuthorize("@ss.hasPermi('academic:article:add')")
    @Log(title = "学术文章，管理学术研究类文章信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Article article)
    {
        return toAjax(articleService.insertArticle(article));
    }

    /**
     * 修改学术文章，管理学术研究类文章信息
     */
    @PreAuthorize("@ss.hasPermi('academic:article:edit')")
    @Log(title = "学术文章，管理学术研究类文章信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Article article)
    {
        return toAjax(articleService.updateArticle(article));
    }

    /**
     * 删除学术文章，管理学术研究类文章信息
     */
    @PreAuthorize("@ss.hasPermi('academic:article:remove')")
    @Log(title = "学术文章，管理学术研究类文章信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(articleService.deleteArticleByIds(ids));
    }
}
