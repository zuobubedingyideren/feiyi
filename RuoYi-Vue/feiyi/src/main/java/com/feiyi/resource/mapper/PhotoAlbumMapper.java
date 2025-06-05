package com.feiyi.resource.mapper;

import java.util.List;
import com.feiyi.resource.domain.PhotoAlbum;
import com.feiyi.resource.domain.Photo;

/**
 * 影集，管理影集信息Mapper接口
 * 
 * @author px
 * @date 2025-06-05
 */
public interface PhotoAlbumMapper 
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
     * 删除影集，管理影集信息
     * 
     * @param id 影集，管理影集信息主键
     * @return 结果
     */
    public int deletePhotoAlbumById(Long id);

    /**
     * 批量删除影集，管理影集信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePhotoAlbumByIds(Long[] ids);

    /**
     * 批量删除照片，管理影集中的照片
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePhotoByAlbumIds(Long[] ids);
    
    /**
     * 批量新增照片，管理影集中的照片
     * 
     * @param photoList 照片，管理影集中的照片列表
     * @return 结果
     */
    public int batchPhoto(List<Photo> photoList);
    

    /**
     * 通过影集，管理影集信息主键删除照片，管理影集中的照片信息
     * 
     * @param id 影集，管理影集信息ID
     * @return 结果
     */
    public int deletePhotoByAlbumId(Long id);
}
