package com.feiyi.academic.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.feiyi.academic.mapper.ArticleMapper;
import com.feiyi.academic.domain.Article;
import com.feiyi.academic.service.IArticleService;

/**
 * 学术文章，管理学术研究类文章信息Service业务层处理
 * 
 * @author px
 * @date 2025-06-04
 */
@Service
public class ArticleServiceImpl implements IArticleService 
{
    @Autowired
    private ArticleMapper articleMapper;

    /**
     * 查询学术文章，管理学术研究类文章信息
     * 
     * @param id 学术文章，管理学术研究类文章信息主键
     * @return 学术文章，管理学术研究类文章信息
     */
    @Override
    public Article selectArticleById(Long id)
    {
        return articleMapper.selectArticleById(id);
    }

    /**
     * 查询学术文章，管理学术研究类文章信息列表
     * 
     * @param article 学术文章，管理学术研究类文章信息
     * @return 学术文章，管理学术研究类文章信息
     */
    @Override
    public List<Article> selectArticleList(Article article)
    {
        return articleMapper.selectArticleList(article);
    }

    /**
     * 新增学术文章，管理学术研究类文章信息
     * 
     * @param article 学术文章，管理学术研究类文章信息
     * @return 结果
     */
    @Override
    public int insertArticle(Article article)
    {
        return articleMapper.insertArticle(article);
    }

    /**
     * 修改学术文章，管理学术研究类文章信息
     * 
     * @param article 学术文章，管理学术研究类文章信息
     * @return 结果
     */
    @Override
    public int updateArticle(Article article)
    {
        return articleMapper.updateArticle(article);
    }

    /**
     * 批量删除学术文章，管理学术研究类文章信息
     * 
     * @param ids 需要删除的学术文章，管理学术研究类文章信息主键
     * @return 结果
     */
    @Override
    public int deleteArticleByIds(Long[] ids)
    {
        return articleMapper.deleteArticleByIds(ids);
    }

    /**
     * 删除学术文章，管理学术研究类文章信息信息
     * 
     * @param id 学术文章，管理学术研究类文章信息主键
     * @return 结果
     */
    @Override
    public int deleteArticleById(Long id)
    {
        return articleMapper.deleteArticleById(id);
    }
}
