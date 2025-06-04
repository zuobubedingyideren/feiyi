package com.feiyi.resource.controller;

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
import com.feiyi.resource.domain.Music;
import com.feiyi.resource.service.IMusicService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 音乐，管理音乐资源信息Controller
 * 
 * @author px
 * @date 2025-06-04
 */
@RestController
@RequestMapping("/resource/music")
public class MusicController extends BaseController
{
    @Autowired
    private IMusicService musicService;

    /**
     * 查询音乐，管理音乐资源信息列表
     */
    // @PreAuthorize("@ss.hasPermi('resource:music:list')")
    @GetMapping("/list")
    @Anonymous
    public TableDataInfo list(Music music)
    {
        startPage();
        List<Music> list = musicService.selectMusicList(music);
        return getDataTable(list);
    }

    /**
     * 导出音乐，管理音乐资源信息列表
     */
    @PreAuthorize("@ss.hasPermi('resource:music:export')")
    @Log(title = "音乐，管理音乐资源信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Music music)
    {
        List<Music> list = musicService.selectMusicList(music);
        ExcelUtil<Music> util = new ExcelUtil<Music>(Music.class);
        util.exportExcel(response, list, "音乐，管理音乐资源信息数据");
    }

    /**
     * 获取音乐，管理音乐资源信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('resource:music:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(musicService.selectMusicById(id));
    }

    /**
     * 新增音乐，管理音乐资源信息
     */
    @PreAuthorize("@ss.hasPermi('resource:music:add')")
    @Log(title = "音乐，管理音乐资源信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Music music)
    {
        return toAjax(musicService.insertMusic(music));
    }

    /**
     * 修改音乐，管理音乐资源信息
     */
    @PreAuthorize("@ss.hasPermi('resource:music:edit')")
    @Log(title = "音乐，管理音乐资源信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Music music)
    {
        return toAjax(musicService.updateMusic(music));
    }

    /**
     * 删除音乐，管理音乐资源信息
     */
    @PreAuthorize("@ss.hasPermi('resource:music:remove')")
    @Log(title = "音乐，管理音乐资源信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(musicService.deleteMusicByIds(ids));
    }
}
