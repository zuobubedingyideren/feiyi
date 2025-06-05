package com.feiyi.resource.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.feiyi.resource.domain.Photo;
import com.feiyi.resource.mapper.PhotoAlbumMapper;
import com.feiyi.resource.domain.PhotoAlbum;
import com.feiyi.resource.service.IPhotoAlbumService;

/**
 * 影集，管理影集信息Service业务层处理
 * 
 * @author px
 * @date 2025-06-05
 */
@Service
public class PhotoAlbumServiceImpl implements IPhotoAlbumService 
{
    @Autowired
    private PhotoAlbumMapper photoAlbumMapper;

    /**
     * 查询影集，管理影集信息
     * 
     * @param id 影集，管理影集信息主键
     * @return 影集，管理影集信息
     */
    @Override
    public PhotoAlbum selectPhotoAlbumById(Long id)
    {
        return photoAlbumMapper.selectPhotoAlbumById(id);
    }

    /**
     * 查询影集，管理影集信息列表
     * 
     * @param photoAlbum 影集，管理影集信息
     * @return 影集，管理影集信息
     */
    @Override
    public List<PhotoAlbum> selectPhotoAlbumList(PhotoAlbum photoAlbum)
    {
        return photoAlbumMapper.selectPhotoAlbumList(photoAlbum);
    }

    /**
     * 新增影集，管理影集信息
     * 
     * @param photoAlbum 影集，管理影集信息
     * @return 结果
     */
    @Transactional
    @Override
    public int insertPhotoAlbum(PhotoAlbum photoAlbum)
    {
        int rows = photoAlbumMapper.insertPhotoAlbum(photoAlbum);
        insertPhoto(photoAlbum);
        return rows;
    }

    /**
     * 修改影集，管理影集信息
     * 
     * @param photoAlbum 影集，管理影集信息
     * @return 结果
     */
    @Transactional
    @Override
    public int updatePhotoAlbum(PhotoAlbum photoAlbum)
    {
        photoAlbumMapper.deletePhotoByAlbumId(photoAlbum.getId());
        insertPhoto(photoAlbum);
        return photoAlbumMapper.updatePhotoAlbum(photoAlbum);
    }

    /**
     * 批量删除影集，管理影集信息
     * 
     * @param ids 需要删除的影集，管理影集信息主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deletePhotoAlbumByIds(Long[] ids)
    {
        photoAlbumMapper.deletePhotoByAlbumIds(ids);
        return photoAlbumMapper.deletePhotoAlbumByIds(ids);
    }

    /**
     * 删除影集，管理影集信息信息
     * 
     * @param id 影集，管理影集信息主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deletePhotoAlbumById(Long id)
    {
        photoAlbumMapper.deletePhotoByAlbumId(id);
        return photoAlbumMapper.deletePhotoAlbumById(id);
    }

    /**
     * 新增照片，管理影集中的照片信息
     * 
     * @param photoAlbum 影集，管理影集信息对象
     */
    public void insertPhoto(PhotoAlbum photoAlbum)
    {
        List<Photo> photoList = photoAlbum.getPhotoList();
        Long id = photoAlbum.getId();
        if (StringUtils.isNotNull(photoList))
        {
            List<Photo> list = new ArrayList<Photo>();
            for (Photo photo : photoList)
            {
                photo.setAlbumId(id);
                list.add(photo);
            }
            if (list.size() > 0)
            {
                photoAlbumMapper.batchPhoto(list);
            }
        }
    }
}
