package com.feiyi.academic.mapper;

import java.util.List;
import com.feiyi.academic.domain.Article;

/**
 * 学术文章，管理学术研究类文章信息Mapper接口
 * 
 * @author px
 * @date 2025-06-04
 */
public interface ArticleMapper 
{
    /**
     * 查询学术文章，管理学术研究类文章信息
     * 
     * @param id 学术文章，管理学术研究类文章信息主键
     * @return 学术文章，管理学术研究类文章信息
     */
    public Article selectArticleById(Long id);

    /**
     * 查询学术文章，管理学术研究类文章信息列表
     * 
     * @param article 学术文章，管理学术研究类文章信息
     * @return 学术文章，管理学术研究类文章信息集合
     */
    public List<Article> selectArticleList(Article article);

    /**
     * 新增学术文章，管理学术研究类文章信息
     * 
     * @param article 学术文章，管理学术研究类文章信息
     * @return 结果
     */
    public int insertArticle(Article article);

    /**
     * 修改学术文章，管理学术研究类文章信息
     * 
     * @param article 学术文章，管理学术研究类文章信息
     * @return 结果
     */
    public int updateArticle(Article article);

    /**
     * 删除学术文章，管理学术研究类文章信息
     * 
     * @param id 学术文章，管理学术研究类文章信息主键
     * @return 结果
     */
    public int deleteArticleById(Long id);

    /**
     * 批量删除学术文章，管理学术研究类文章信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteArticleByIds(Long[] ids);
}
