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
import com.feiyi.resource.domain.Photo;
import com.feiyi.resource.service.IPhotoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 照片，管理影集中的照片Controller
 * 
 * @author px
 * @date 2025-06-05
 */
@RestController
@RequestMapping("/resource/photo")
public class PhotoController extends BaseController
{
    @Autowired
    private IPhotoService photoService;

    /**
     * 查询照片，管理影集中的照片列表
     */
    @PreAuthorize("@ss.hasPermi('resource:photo:list')")
    @GetMapping("/list")
    public TableDataInfo list(Photo photo)
    {
        startPage();
        List<Photo> list = photoService.selectPhotoList(photo);
        return getDataTable(list);
    }

    /**
     * 导出照片，管理影集中的照片列表
     */
    @PreAuthorize("@ss.hasPermi('resource:photo:export')")
    @Log(title = "照片，管理影集中的照片", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Photo photo)
    {
        List<Photo> list = photoService.selectPhotoList(photo);
        ExcelUtil<Photo> util = new ExcelUtil<Photo>(Photo.class);
        util.exportExcel(response, list, "照片，管理影集中的照片数据");
    }

    /**
     * 获取照片，管理影集中的照片详细信息
     */
    @PreAuthorize("@ss.hasPermi('resource:photo:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(photoService.selectPhotoById(id));
    }

    /**
     * 新增照片，管理影集中的照片
     */
    @PreAuthorize("@ss.hasPermi('resource:photo:add')")
    @Log(title = "照片，管理影集中的照片", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Photo photo)
    {
        return toAjax(photoService.insertPhoto(photo));
    }

    /**
     * 修改照片，管理影集中的照片
     */
    @PreAuthorize("@ss.hasPermi('resource:photo:edit')")
    @Log(title = "照片，管理影集中的照片", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Photo photo)
    {
        return toAjax(photoService.updatePhoto(photo));
    }

    /**
     * 删除照片，管理影集中的照片
     */
    @PreAuthorize("@ss.hasPermi('resource:photo:remove')")
    @Log(title = "照片，管理影集中的照片", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(photoService.deletePhotoByIds(ids));
    }
}
