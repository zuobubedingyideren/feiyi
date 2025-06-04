-- --------------------------------------------------------
-- 资源管理模块优化版：影集、照片、音乐、视频等资源与项目的关联
-- 支持一个项目对应多个资源的关系
-- --------------------------------------------------------
USE heritage_management;

-- --------------------------------------------------------
-- 影集表：管理影集信息
-- --------------------------------------------------------
CREATE TABLE photo_album (
    -- 基本信息
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '影集唯一标识，自增主键',
    album_name VARCHAR(200) NOT NULL COMMENT '影集名称',
    album_year INT COMMENT '影集年份',
    photographer VARCHAR(100) COMMENT '摄影师姓名',
    photographer_bio TEXT COMMENT '摄影师介绍',
    album_desc TEXT COMMENT '影集介绍',
    cover_image VARCHAR(500) COMMENT '封面图片URL',
    
    -- 分类信息
    album_type VARCHAR(50) COMMENT '影集类型',
    album_category VARCHAR(50) COMMENT '影集分类',
    
    -- 拍摄信息
    shooting_date DATE COMMENT '拍摄日期',
    shooting_location VARCHAR(200) COMMENT '拍摄地点',
    
    -- 发布信息
    release_date DATE COMMENT '发布日期',
    publisher VARCHAR(100) COMMENT '发布者',
    copyright VARCHAR(200) COMMENT '版权信息',
    
    -- 统计信息
    view_count INT DEFAULT 0 COMMENT '浏览次数',
    download_count INT DEFAULT 0 COMMENT '下载次数',
    like_count INT DEFAULT 0 COMMENT '点赞次数',
    share_count INT DEFAULT 0 COMMENT '分享次数',
    
    -- 状态信息
    status TINYINT DEFAULT 1 COMMENT '状态：1-显示，0-隐藏',
    is_featured TINYINT DEFAULT 0 COMMENT '是否推荐：0-否，1-是',
    
    -- 审计字段
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    del_flag TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    remark VARCHAR(255) COMMENT '备注',
    
    -- 索引
    INDEX idx_album_name (album_name) COMMENT '影集名称索引',
    INDEX idx_album_year (album_year) COMMENT '影集年份索引',
    INDEX idx_photographer (photographer) COMMENT '摄影师姓名索引',
    INDEX idx_album_type (album_type) COMMENT '影集类型索引',
    INDEX idx_release_date (release_date) COMMENT '发布日期索引',
    INDEX idx_view_count (view_count) COMMENT '浏览次数索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_is_featured (is_featured) COMMENT '推荐状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '影集表，管理影集信息';

-- --------------------------------------------------------
-- 照片表：管理影集中的照片
-- --------------------------------------------------------
CREATE TABLE photo (
    -- 基本信息
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '照片唯一标识，自增主键',
    album_id BIGINT NOT NULL COMMENT '所属影集ID，外键关联photo_album表',
    photo_title VARCHAR(200) COMMENT '照片标题',
    photo_url VARCHAR(500) NOT NULL COMMENT '照片URL',
    photo_desc TEXT COMMENT '照片描述',
    
    -- 照片属性
    photo_format VARCHAR(20) COMMENT '照片格式：jpg, png, webp等',
    file_size BIGINT COMMENT '文件大小（字节）',
    resolution VARCHAR(20) COMMENT '分辨率',
    
    -- 拍摄信息
    shooting_time DATETIME COMMENT '拍摄时间',
    shooting_location VARCHAR(255) COMMENT '拍摄地点',
    camera_model VARCHAR(100) COMMENT '相机型号',
    focal_length VARCHAR(20) COMMENT '焦距',
    aperture VARCHAR(20) COMMENT '光圈',
    iso VARCHAR(20) COMMENT 'ISO感光度',
    
    -- 水印信息
    watermark_url VARCHAR(500) COMMENT '水印图片URL',
    watermark_position VARCHAR(20) COMMENT '水印位置：center, top-left, bottom-right等',
    watermark_opacity INT COMMENT '水印透明度（0-100）',
    
    -- 排序与状态
    sort_order INT DEFAULT 0 COMMENT '排序顺序',
    status TINYINT DEFAULT 1 COMMENT '状态：1-显示，0-隐藏',
    
    -- 审计字段
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    del_flag TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    remark VARCHAR(255) COMMENT '备注',
    
    -- 外键约束
    FOREIGN KEY (album_id) REFERENCES photo_album(id) ON DELETE CASCADE,
    
    -- 索引
    INDEX idx_album_id (album_id) COMMENT '所属影集ID索引',
    INDEX idx_shooting_time (shooting_time) COMMENT '拍摄时间索引',
    INDEX idx_shooting_location (shooting_location) COMMENT '拍摄地点索引',
    INDEX idx_sort_order (sort_order) COMMENT '排序顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '照片表，管理影集中的照片';

-- --------------------------------------------------------
-- 音乐表：管理音乐资源信息
-- --------------------------------------------------------
CREATE TABLE music (
    -- 基本信息
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '音乐唯一标识，自增主键',
    title VARCHAR(200) NOT NULL COMMENT '音乐标题',
    
    -- 音乐内容
    music_url VARCHAR(500) NOT NULL COMMENT '音乐文件URL',
    
    -- 状态信息
    status TINYINT DEFAULT 1 COMMENT '状态：1-显示，0-隐藏',
    
    -- 审计字段
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    del_flag TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    remark VARCHAR(255) COMMENT '备注',
    
    -- 索引
    INDEX idx_title (title) COMMENT '标题索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '音乐表，管理音乐资源信息';

-- 音乐表示例数据
INSERT INTO music (title, music_url, status, created_by, remark) VALUES
('藏族安多民歌《拉伊》', '/static/music/layi.mp3', 1, 1, '青海藏族地区流传的传统民歌'),
('格萨尔王传奇', '/static/music/gesar.mp3', 1, 1, '格萨尔史诗中的经典选段'),
('热贡艺术赞歌', '/static/music/regong_praise.mp3', 1, 1, '赞美热贡艺术的传统歌曲'),
('唐卡绘制工作歌', '/static/music/thangka_work.mp3', 1, 1, '唐卡画师工作时的传统歌曲'),
('安多热巴舞曲', '/static/music/reba_dance.mp3', 1, 1, '配合安多热巴舞表演的传统音乐'),
('皮影戏配乐《白蛇传》', '/static/music/shadow_baishe.mp3', 1, 1, '青海皮影戏的传统配乐'),
('格萨尔史诗说唱', '/static/music/gesar_epic.mp3', 1, 1, '格萨尔史诗的传统说唱片段'),
('藏族民歌《阿妈拉》', '/static/music/ama_la.mp3', 1, 1, '表达对母亲思念的藏族民歌'),
('青海花儿《上去高山望平川》', '/static/music/huaer_gaoshang.mp3', 1, 1, '青海地区流传的经典花儿曲目'),
('唐卡祈福曲', '/static/music/thangka.mp3', 1, 1, '创作唐卡时的传统祈福音乐');

-- --------------------------------------------------------
-- 视频表：管理视频资源信息
-- --------------------------------------------------------
CREATE TABLE video (
    -- 基本信息
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '视频唯一标识，自增主键',
    title VARCHAR(200) NOT NULL COMMENT '视频标题',

    
    -- 视频内容
    video_url VARCHAR(500) NOT NULL COMMENT '视频文件URL',
    cover_image VARCHAR(500) COMMENT '封面图片URL',

    -- 状态信息
    status TINYINT DEFAULT 1 COMMENT '状态：1-显示，0-隐藏',
    
    -- 审计字段
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    del_flag TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    remark VARCHAR(255) COMMENT '备注',
    
    -- 索引
    INDEX idx_title (title) COMMENT '标题索引'
) COMMENT '视频表，管理视频资源信息';

-- 视频表假数据
INSERT INTO video (
    title,
    video_url,
    cover_image,
    status,
    created_by,
    updated_by,
    remark
) VALUES 
-- 非遗技艺类视频
('景德镇陶瓷制作工艺', 'https://example.com/videos/jingdezhen_pottery.mp4', 'https://example.com/covers/pottery_cover.jpg', 1, 1, 1, '展示景德镇传统陶瓷制作的完整流程'),
('苏州刺绣技艺传承', 'https://example.com/videos/suzhou_embroidery.mp4', 'https://example.com/covers/embroidery_cover.jpg', 1, 1, 1, '苏绣大师亲自演示传统刺绣技法'),
('四川变脸表演艺术', 'https://example.com/videos/sichuan_face_changing.mp4', 'https://example.com/covers/face_changing_cover.jpg', 1, 2, 2, '川剧变脸的精彩表演片段'),
('宜兴紫砂壶制作', 'https://example.com/videos/yixing_teapot.mp4', 'https://example.com/covers/teapot_cover.jpg', 1, 1, 1, '紫砂壶制作工艺的详细介绍'),
('京剧脸谱绘制技艺', 'https://example.com/videos/peking_opera_mask.mp4', 'https://example.com/covers/opera_mask_cover.jpg', 1, 3, 3, '京剧脸谱的绘制过程和文化内涵'),

-- 民间音乐类视频
('古琴演奏《流水》', 'https://example.com/videos/guqin_liushui.mp4', 'https://example.com/covers/guqin_cover.jpg', 1, 2, 2, '古琴名曲《流水》的精彩演奏'),
('二胡独奏《二泉映月》', 'https://example.com/videos/erhu_erquan.mp4', 'https://example.com/covers/erhu_cover.jpg', 1, 2, 2, '经典二胡曲目的深情演绎'),
('民族鼓乐合奏', 'https://example.com/videos/folk_drums.mp4', 'https://example.com/covers/drums_cover.jpg', 1, 3, 3, '多种民族鼓乐器的合奏表演'),

-- 传统舞蹈类视频
('敦煌飞天舞', 'https://example.com/videos/dunhuang_dance.mp4', 'https://example.com/covers/dunhuang_cover.jpg', 1, 4, 4, '再现敦煌壁画中飞天形象的舞蹈'),
('藏族锅庄舞', 'https://example.com/videos/tibetan_dance.mp4', 'https://example.com/covers/tibetan_cover.jpg', 1, 4, 4, '藏族传统锅庄舞的热烈表演'),
('傣族孔雀舞', 'https://example.com/videos/peacock_dance.mp4', 'https://example.com/covers/peacock_cover.jpg', 1, 4, 4, '优美的傣族孔雀舞表演'),

-- 传统建筑类视频
('故宫建筑艺术', 'https://example.com/videos/forbidden_city.mp4', 'https://example.com/covers/forbidden_city_cover.jpg', 1, 5, 5, '故宫建筑的历史和艺术价值介绍'),
('徽派建筑特色', 'https://example.com/videos/huizhou_architecture.mp4', 'https://example.com/covers/huizhou_cover.jpg', 1, 5, 5, '徽派建筑的独特风格和文化内涵'),
('客家土楼文化', 'https://example.com/videos/hakka_tulou.mp4', 'https://example.com/covers/tulou_cover.jpg', 1, 5, 5, '福建客家土楼的建筑智慧'),

-- 传统节庆类视频
('春节庙会盛况', 'https://example.com/videos/spring_festival.mp4', 'https://example.com/covers/spring_festival_cover.jpg', 1, 6, 6, '传统春节庙会的热闹场面'),
('端午龙舟竞渡', 'https://example.com/videos/dragon_boat.mp4', 'https://example.com/covers/dragon_boat_cover.jpg', 1, 6, 6, '端午节龙舟比赛的精彩瞬间'),
('中秋赏月习俗', 'https://example.com/videos/mid_autumn.mp4', 'https://example.com/covers/mid_autumn_cover.jpg', 1, 6, 6, '中秋节传统赏月活动'),

-- 传统美食类视频
('北京烤鸭制作', 'https://example.com/videos/peking_duck.mp4', 'https://example.com/covers/peking_duck_cover.jpg', 1, 7, 7, '正宗北京烤鸭的制作工艺'),
('兰州拉面技艺', 'https://example.com/videos/lanzhou_noodles.mp4', 'https://example.com/covers/lanzhou_noodles_cover.jpg', 1, 7, 7, '兰州拉面师傅的精湛技艺'),
('广式点心制作', 'https://example.com/videos/cantonese_dimsum.mp4', 'https://example.com/covers/dimsum_cover.jpg', 1, 7, 7, '传统广式点心的制作过程'),

-- 隐藏状态的视频（用于测试）
('测试视频1', 'https://example.com/videos/test1.mp4', 'https://example.com/covers/test1_cover.jpg', 0, 1, 1, '测试用途的隐藏视频'),
('测试视频2', 'https://example.com/videos/test2.mp4', 'https://example.com/covers/test2_cover.jpg', 0, 1, 1, '另一个测试用途的隐藏视频');



