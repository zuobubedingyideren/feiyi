package com.feiyi.resource.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.feiyi.resource.mapper.VideoMapper;
import com.feiyi.resource.domain.Video;
import com.feiyi.resource.service.IVideoService;

/**
 * 视频，管理视频资源信息Service业务层处理
 * 
 * @author px
 * @date 2025-06-04
 */
@Service
public class VideoServiceImpl implements IVideoService 
{
    @Autowired
    private VideoMapper videoMapper;

    /**
     * 查询视频，管理视频资源信息
     * 
     * @param id 视频，管理视频资源信息主键
     * @return 视频，管理视频资源信息
     */
    @Override
    public Video selectVideoById(Long id)
    {
        return videoMapper.selectVideoById(id);
    }

    /**
     * 查询视频，管理视频资源信息列表
     * 
     * @param video 视频，管理视频资源信息
     * @return 视频，管理视频资源信息
     */
    @Override
    public List<Video> selectVideoList(Video video)
    {
        return videoMapper.selectVideoList(video);
    }

    /**
     * 新增视频，管理视频资源信息
     * 
     * @param video 视频，管理视频资源信息
     * @return 结果
     */
    @Override
    public int insertVideo(Video video)
    {
        return videoMapper.insertVideo(video);
    }

    /**
     * 修改视频，管理视频资源信息
     * 
     * @param video 视频，管理视频资源信息
     * @return 结果
     */
    @Override
    public int updateVideo(Video video)
    {
        return videoMapper.updateVideo(video);
    }

    /**
     * 批量删除视频，管理视频资源信息
     * 
     * @param ids 需要删除的视频，管理视频资源信息主键
     * @return 结果
     */
    @Override
    public int deleteVideoByIds(Long[] ids)
    {
        return videoMapper.deleteVideoByIds(ids);
    }

    /**
     * 删除视频，管理视频资源信息信息
     * 
     * @param id 视频，管理视频资源信息主键
     * @return 结果
     */
    @Override
    public int deleteVideoById(Long id)
    {
        return videoMapper.deleteVideoById(id);
    }
}
