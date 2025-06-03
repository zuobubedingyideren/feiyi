-- 资源管理模块：影集、照片、音乐、视频等
USE heritage_management;

-- 影集表：管理影集信息
CREATE TABLE photo_album (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '影集唯一标识，自增主键',
    album_name VARCHAR(200) NOT NULL COMMENT '影集名称',
    album_year INT COMMENT '影集年份',
    photographer VARCHAR(100) COMMENT '摄影师姓名',
    photographer_bio TEXT COMMENT '摄影师介绍',
    album_desc TEXT COMMENT '影集介绍',
    cover_image VARCHAR(255) COMMENT '封面图片',
    view_count INT DEFAULT 0 COMMENT '浏览次数',
    status TINYINT DEFAULT 1 COMMENT '状态：1-显示，0-隐藏',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    del_flag TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    remark VARCHAR(255) COMMENT '备注',
    INDEX idx_album_name (album_name) COMMENT '影集名称索引',
    INDEX idx_album_year (album_year) COMMENT '影集年份索引',
    INDEX idx_photographer (photographer) COMMENT '摄影师姓名索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '影集表，管理影集信息';

-- 照片表：管理影集中的照片
CREATE TABLE photo (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '照片唯一标识，自增主键',
    album_id BIGINT NOT NULL COMMENT '所属影集ID，外键关联photo_album表',
    photo_title VARCHAR(200) COMMENT '照片标题',
    photo_url VARCHAR(255) NOT NULL COMMENT '照片URL',
    photo_desc TEXT COMMENT '照片描述',
    shooting_time DATETIME COMMENT '拍摄时间',
    shooting_location VARCHAR(255) COMMENT '拍摄地点',
    watermark_url VARCHAR(255) COMMENT '水印图片URL',
    sort_order INT DEFAULT 0 COMMENT '排序顺序',
    status TINYINT DEFAULT 1 COMMENT '状态：1-显示，0-隐藏',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    del_flag TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    remark VARCHAR(255) COMMENT '备注',
    INDEX idx_album_id (album_id) COMMENT '所属影集ID索引',
    INDEX idx_sort_order (sort_order) COMMENT '排序顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '照片表，管理影集中的照片';

-- 音乐表：管理音乐资源
CREATE TABLE music (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '音乐唯一标识，自增主键',
    music_title VARCHAR(200) NOT NULL COMMENT '音乐标题',
    music_url VARCHAR(255) NOT NULL COMMENT '音乐文件URL',
    cover_image VARCHAR(255) COMMENT '封面图片',
    artist VARCHAR(100) COMMENT '艺术家',
    album VARCHAR(100) COMMENT '专辑',
    duration VARCHAR(20) COMMENT '时长',
    music_desc TEXT COMMENT '音乐描述',
    related_project_id BIGINT COMMENT '关联非遗项目ID，外键关联heritage_project表',
    play_count INT DEFAULT 0 COMMENT '播放次数',
    status TINYINT DEFAULT 1 COMMENT '状态：1-显示，0-隐藏',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    del_flag TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    remark VARCHAR(255) COMMENT '备注',
    INDEX idx_music_title (music_title) COMMENT '音乐标题索引',
    INDEX idx_artist (artist) COMMENT '艺术家索引',
    INDEX idx_related_project_id (related_project_id) COMMENT '关联项目ID索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '音乐表，管理音乐资源';

-- 视频表：管理视频资源
CREATE TABLE video (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '视频唯一标识，自增主键',
    video_title VARCHAR(200) NOT NULL COMMENT '视频标题',
    video_url VARCHAR(255) NOT NULL COMMENT '视频文件URL',
    cover_image VARCHAR(255) COMMENT '封面图片',
    director VARCHAR(100) COMMENT '导演',
    duration VARCHAR(20) COMMENT '时长',
    video_desc TEXT COMMENT '视频描述',
    related_project_id BIGINT COMMENT '关联非遗项目ID，外键关联heritage_project表',
    play_count INT DEFAULT 0 COMMENT '播放次数',
    status TINYINT DEFAULT 1 COMMENT '状态：1-显示，0-隐藏',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    del_flag TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    remark VARCHAR(255) COMMENT '备注',
    INDEX idx_video_title (video_title) COMMENT '视频标题索引',
    INDEX idx_director (director) COMMENT '导演索引',
    INDEX idx_related_project_id (related_project_id) COMMENT '关联项目ID索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '视频表，管理视频资源';