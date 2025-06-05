package com.feiyi.resource.service;

import java.util.List;
import com.feiyi.resource.domain.PhotoAlbum;

/**
 * 影集，管理影集信息Service接口
 * 
 * @author px
 * @date 2025-06-05
 */
public interface IPhotoAlbumService 
{
    /**
     * 查询影集，管理影集信息
     * 
     * @param id 影集，管理影集信息主键
     * @return 影集，管理影集信息
     */
    public PhotoAlbum selectPhotoAlbumById(Long id);

    /**
     * 查询影集，管理影集信息列表
     * 
     * @param photoAlbum 影集，管理影集信息
     * @return 影集，管理影集信息集合
     */
    public List<PhotoAlbum> selectPhotoAlbumList(PhotoAlbum photoAlbum);

    /**
     * 新增影集，管理影集信息
     * 
     * @param photoAlbum 影集，管理影集信息
     * @return 结果
     */
    public int insertPhotoAlbum(PhotoAlbum photoAlbum);

    /**
     * 修改影集，管理影集信息
     * 
     * @param photoAlbum 影集，管理影集信息
     * @return 结果
     */
    public int updatePhotoAlbum(PhotoAlbum photoAlbum);

    /**
     * 批量删除影集，管理影集信息
     * 
     * @param ids 需要删除的影集，管理影集信息主键集合
     * @return 结果
     */
    public int deletePhotoAlbumByIds(Long[] ids);

    /**
     * 删除影集，管理影集信息信息
     * 
     * @param id 影集，管理影集信息主键
     * @return 结果
     */
    public int deletePhotoAlbumById(Long id);
}
