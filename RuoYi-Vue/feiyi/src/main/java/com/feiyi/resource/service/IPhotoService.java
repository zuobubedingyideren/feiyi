package com.feiyi.resource.service;

import java.util.List;
import com.feiyi.resource.domain.Photo;

/**
 * 照片，管理影集中的照片Service接口
 * 
 * @author px
 * @date 2025-06-05
 */
public interface IPhotoService 
{
    /**
     * 查询照片，管理影集中的照片
     * 
     * @param id 照片，管理影集中的照片主键
     * @return 照片，管理影集中的照片
     */
    public Photo selectPhotoById(Long id);

    /**
     * 查询照片，管理影集中的照片列表
     * 
     * @param photo 照片，管理影集中的照片
     * @return 照片，管理影集中的照片集合
     */
    public List<Photo> selectPhotoList(Photo photo);

    /**
     * 新增照片，管理影集中的照片
     * 
     * @param photo 照片，管理影集中的照片
     * @return 结果
     */
    public int insertPhoto(Photo photo);

    /**
     * 修改照片，管理影集中的照片
     * 
     * @param photo 照片，管理影集中的照片
     * @return 结果
     */
    public int updatePhoto(Photo photo);

    /**
     * 批量删除照片，管理影集中的照片
     * 
     * @param ids 需要删除的照片，管理影集中的照片主键集合
     * @return 结果
     */
    public int deletePhotoByIds(Long[] ids);

    /**
     * 删除照片，管理影集中的照片信息
     * 
     * @param id 照片，管理影集中的照片主键
     * @return 结果
     */
    public int deletePhotoById(Long id);
}
