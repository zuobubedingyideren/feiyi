package com.feiyi.resource.service;

import java.util.List;
import com.feiyi.resource.domain.Music;

/**
 * 音乐，管理音乐资源信息Service接口
 * 
 * @author px
 * @date 2025-06-04
 */
public interface IMusicService 
{
    /**
     * 查询音乐，管理音乐资源信息
     * 
     * @param id 音乐，管理音乐资源信息主键
     * @return 音乐，管理音乐资源信息
     */
    public Music selectMusicById(Long id);

    /**
     * 查询音乐，管理音乐资源信息列表
     * 
     * @param music 音乐，管理音乐资源信息
     * @return 音乐，管理音乐资源信息集合
     */
    public List<Music> selectMusicList(Music music);

    /**
     * 新增音乐，管理音乐资源信息
     * 
     * @param music 音乐，管理音乐资源信息
     * @return 结果
     */
    public int insertMusic(Music music);

    /**
     * 修改音乐，管理音乐资源信息
     * 
     * @param music 音乐，管理音乐资源信息
     * @return 结果
     */
    public int updateMusic(Music music);

    /**
     * 批量删除音乐，管理音乐资源信息
     * 
     * @param ids 需要删除的音乐，管理音乐资源信息主键集合
     * @return 结果
     */
    public int deleteMusicByIds(Long[] ids);

    /**
     * 删除音乐，管理音乐资源信息信息
     * 
     * @param id 音乐，管理音乐资源信息主键
     * @return 结果
     */
    public int deleteMusicById(Long id);
}
