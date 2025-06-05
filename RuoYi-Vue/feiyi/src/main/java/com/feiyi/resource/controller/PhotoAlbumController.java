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
import com.feiyi.resource.domain.PhotoAlbum;
import com.feiyi.resource.service.IPhotoAlbumService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 影集，管理影集信息Controller
 * 
 * @author px
 * @date 2025-06-05
 */
@RestController
@RequestMapping("/resource/album")
public class PhotoAlbumController extends BaseController
{
    @Autowired
    private IPhotoAlbumService photoAlbumService;

    /**
     * 查询影集，管理影集信息列表
     */
    @PreAuthorize("@ss.hasPermi('resource:album:list')")
    @GetMapping("/list")
    public TableDataInfo list(PhotoAlbum photoAlbum)
    {
        startPage();
        List<PhotoAlbum> list = photoAlbumService.selectPhotoAlbumList(photoAlbum);
        return getDataTable(list);
    }

    /**
     * 导出影集，管理影集信息列表
     */
    @PreAuthorize("@ss.hasPermi('resource:album:export')")
    @Log(title = "影集，管理影集信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PhotoAlbum photoAlbum)
    {
        List<PhotoAlbum> list = photoAlbumService.selectPhotoAlbumList(photoAlbum);
        ExcelUtil<PhotoAlbum> util = new ExcelUtil<PhotoAlbum>(PhotoAlbum.class);
        util.exportExcel(response, list, "影集，管理影集信息数据");
    }

    /**
     * 获取影集，管理影集信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('resource:album:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(photoAlbumService.selectPhotoAlbumById(id));
    }

    /**
     * 新增影集，管理影集信息
     */
    @PreAuthorize("@ss.hasPermi('resource:album:add')")
    @Log(title = "影集，管理影集信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PhotoAlbum photoAlbum)
    {
        return toAjax(photoAlbumService.insertPhotoAlbum(photoAlbum));
    }

    /**
     * 修改影集，管理影集信息
     */
    @PreAuthorize("@ss.hasPermi('resource:album:edit')")
    @Log(title = "影集，管理影集信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PhotoAlbum photoAlbum)
    {
        return toAjax(photoAlbumService.updatePhotoAlbum(photoAlbum));
    }

    /**
     * 删除影集，管理影集信息
     */
    @PreAuthorize("@ss.hasPermi('resource:album:remove')")
    @Log(title = "影集，管理影集信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(photoAlbumService.deletePhotoAlbumByIds(ids));
    }
}
