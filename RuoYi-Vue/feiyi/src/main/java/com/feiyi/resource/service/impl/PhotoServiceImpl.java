package com.feiyi.resource.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.feiyi.resource.mapper.PhotoMapper;
import com.feiyi.resource.domain.Photo;
import com.feiyi.resource.service.IPhotoService;

/**
 * 照片，管理影集中的照片Service业务层处理
 * 
 * @author px
 * @date 2025-06-05
 */
@Service
public class PhotoServiceImpl implements IPhotoService 
{
    @Autowired
    private PhotoMapper photoMapper;

    /**
     * 查询照片，管理影集中的照片
     * 
     * @param id 照片，管理影集中的照片主键
     * @return 照片，管理影集中的照片
     */
    @Override
    public Photo selectPhotoById(Long id)
    {
        return photoMapper.selectPhotoById(id);
    }

    /**
     * 查询照片，管理影集中的照片列表
     * 
     * @param photo 照片，管理影集中的照片
     * @return 照片，管理影集中的照片
     */
    @Override
    public List<Photo> selectPhotoList(Photo photo)
    {
        return photoMapper.selectPhotoList(photo);
    }

    /**
     * 新增照片，管理影集中的照片
     * 
     * @param photo 照片，管理影集中的照片
     * @return 结果
     */
    @Override
    public int insertPhoto(Photo photo)
    {
        return photoMapper.insertPhoto(photo);
    }

    /**
     * 修改照片，管理影集中的照片
     * 
     * @param photo 照片，管理影集中的照片
     * @return 结果
     */
    @Override
    public int updatePhoto(Photo photo)
    {
        return photoMapper.updatePhoto(photo);
    }

    /**
     * 批量删除照片，管理影集中的照片
     * 
     * @param ids 需要删除的照片，管理影集中的照片主键
     * @return 结果
     */
    @Override
    public int deletePhotoByIds(Long[] ids)
    {
        return photoMapper.deletePhotoByIds(ids);
    }

    /**
     * 删除照片，管理影集中的照片信息
     * 
     * @param id 照片，管理影集中的照片主键
     * @return 结果
     */
    @Override
    public int deletePhotoById(Long id)
    {
        return photoMapper.deletePhotoById(id);
    }
}
