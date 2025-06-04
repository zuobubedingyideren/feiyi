package com.feiyi.resource.controller;

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
import com.feiyi.resource.domain.Video;
import com.feiyi.resource.service.IVideoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 视频，管理视频资源信息Controller
 * 
 * @author px
 * @date 2025-06-04
 */
@RestController
@RequestMapping("/resource/video")
public class VideoController extends BaseController
{
    @Autowired
    private IVideoService videoService;

    /**
     * 查询视频，管理视频资源信息列表
     */
    @PreAuthorize("@ss.hasPermi('resource:video:list')")
    @GetMapping("/list")
    public TableDataInfo list(Video video)
    {
        startPage();
        List<Video> list = videoService.selectVideoList(video);
        return getDataTable(list);
    }

    /**
     * 导出视频，管理视频资源信息列表
     */
    @PreAuthorize("@ss.hasPermi('resource:video:export')")
    @Log(title = "视频，管理视频资源信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Video video)
    {
        List<Video> list = videoService.selectVideoList(video);
        ExcelUtil<Video> util = new ExcelUtil<Video>(Video.class);
        util.exportExcel(response, list, "视频，管理视频资源信息数据");
    }

    /**
     * 获取视频，管理视频资源信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('resource:video:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(videoService.selectVideoById(id));
    }

    /**
     * 新增视频，管理视频资源信息
     */
    @PreAuthorize("@ss.hasPermi('resource:video:add')")
    @Log(title = "视频，管理视频资源信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Video video)
    {
        return toAjax(videoService.insertVideo(video));
    }

    /**
     * 修改视频，管理视频资源信息
     */
    @PreAuthorize("@ss.hasPermi('resource:video:edit')")
    @Log(title = "视频，管理视频资源信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Video video)
    {
        return toAjax(videoService.updateVideo(video));
    }

    /**
     * 删除视频，管理视频资源信息
     */
    @PreAuthorize("@ss.hasPermi('resource:video:remove')")
    @Log(title = "视频，管理视频资源信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(videoService.deleteVideoByIds(ids));
    }
}
