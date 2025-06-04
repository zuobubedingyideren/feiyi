package com.feiyi.resource.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.feiyi.resource.mapper.MusicMapper;
import com.feiyi.resource.domain.Music;
import com.feiyi.resource.service.IMusicService;

/**
 * 音乐，管理音乐资源信息Service业务层处理
 * 
 * @author px
 * @date 2025-06-04
 */
@Service
public class MusicServiceImpl implements IMusicService 
{
    @Autowired
    private MusicMapper musicMapper;

    /**
     * 查询音乐，管理音乐资源信息
     * 
     * @param id 音乐，管理音乐资源信息主键
     * @return 音乐，管理音乐资源信息
     */
    @Override
    public Music selectMusicById(Long id)
    {
        return musicMapper.selectMusicById(id);
    }

    /**
     * 查询音乐，管理音乐资源信息列表
     * 
     * @param music 音乐，管理音乐资源信息
     * @return 音乐，管理音乐资源信息
     */
    @Override
    public List<Music> selectMusicList(Music music)
    {
        return musicMapper.selectMusicList(music);
    }

    /**
     * 新增音乐，管理音乐资源信息
     * 
     * @param music 音乐，管理音乐资源信息
     * @return 结果
     */
    @Override
    public int insertMusic(Music music)
    {
        return musicMapper.insertMusic(music);
    }

    /**
     * 修改音乐，管理音乐资源信息
     * 
     * @param music 音乐，管理音乐资源信息
     * @return 结果
     */
    @Override
    public int updateMusic(Music music)
    {
        return musicMapper.updateMusic(music);
    }

    /**
     * 批量删除音乐，管理音乐资源信息
     * 
     * @param ids 需要删除的音乐，管理音乐资源信息主键
     * @return 结果
     */
    @Override
    public int deleteMusicByIds(Long[] ids)
    {
        return musicMapper.deleteMusicByIds(ids);
    }

    /**
     * 删除音乐，管理音乐资源信息信息
     * 
     * @param id 音乐，管理音乐资源信息主键
     * @return 结果
     */
    @Override
    public int deleteMusicById(Long id)
    {
        return musicMapper.deleteMusicById(id);
    }
}
