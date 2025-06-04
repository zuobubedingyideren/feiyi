package com.feiyi.resource.service;

import java.util.List;
import com.feiyi.resource.domain.Video;

/**
 * 视频，管理视频资源信息Service接口
 * 
 * @author px
 * @date 2025-06-04
 */
public interface IVideoService 
{
    /**
     * 查询视频，管理视频资源信息
     * 
     * @param id 视频，管理视频资源信息主键
     * @return 视频，管理视频资源信息
     */
    public Video selectVideoById(Long id);

    /**
     * 查询视频，管理视频资源信息列表
     * 
     * @param video 视频，管理视频资源信息
     * @return 视频，管理视频资源信息集合
     */
    public List<Video> selectVideoList(Video video);

    /**
     * 新增视频，管理视频资源信息
     * 
     * @param video 视频，管理视频资源信息
     * @return 结果
     */
    public int insertVideo(Video video);

    /**
     * 修改视频，管理视频资源信息
     * 
     * @param video 视频，管理视频资源信息
     * @return 结果
     */
    public int updateVideo(Video video);

    /**
     * 批量删除视频，管理视频资源信息
     * 
     * @param ids 需要删除的视频，管理视频资源信息主键集合
     * @return 结果
     */
    public int deleteVideoByIds(Long[] ids);

    /**
     * 删除视频，管理视频资源信息信息
     * 
     * @param id 视频，管理视频资源信息主键
     * @return 结果
     */
    public int deleteVideoById(Long id);
}
