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
    album_year INT COMMENT '图片年份',
    photographer VARCHAR(100) COMMENT '图片作者',
    photographer_bio TEXT COMMENT '作者介绍',
    album_desc TEXT COMMENT '影集介绍',
    cover_image VARCHAR(500) COMMENT '封面图片URL',
    
    

    -- 发布信息
    release_date DATE COMMENT '发布日期',
    publisher VARCHAR(100) COMMENT '发布者',
    copyright VARCHAR(200) COMMENT '版权信息',
    
    -- 统计信息
    view_count INT DEFAULT 0 COMMENT '浏览次数',
    
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
    INDEX idx_photographer (photographer) COMMENT '作者姓名索引',
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
    INDEX idx_sort_order (sort_order) COMMENT '排序顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '照片表，管理影集中的照片';

-- 影集表示例数据
INSERT INTO photo_album (
    album_name,
    album_year,
    photographer,
    photographer_bio,
    album_desc,
    cover_image,
    release_date,
    publisher,
    copyright,
    view_count,
    status,
    is_featured,
    created_by,
    remark
) VALUES
-- 非遗技艺类影集
('热贡唐卡艺术影集', 2022, '王明', '王明，著名摄影师，专注于非物质文化遗产摄影20年，曾获国家地理摄影大赛金奖。', '本影集收录了青海热贡地区唐卡艺术的精美照片，展示了唐卡艺术的精湛技艺和深厚文化底蕴。', '/static/albums/regong_thangka_cover.jpg', '2022-05-15', '中国非遗出版社', '© 2022 中国非遗出版社', 3562, 1, 1, 1, '热贡唐卡是青海省重要的非物质文化遗产'),
('苏绣技艺传承影集', 2021, '李芳', '李芳，江苏省摄影家协会会员，致力于传统工艺摄影记录。', '记录苏州刺绣传承人的工作场景和精美作品，展示了苏绣的精细工艺和艺术魅力。', '/static/albums/suzhou_embroidery_cover.jpg', '2021-09-20', '江苏文化出版社', '© 2021 江苏文化出版社', 2891, 1, 1, 2, '苏绣是中国四大名绣之一，历史悠久'),
('景德镇陶瓷工艺影集', 2023, '张伟', '张伟，专业文化遗产摄影师，作品曾在国家博物馆展出。', '通过镜头记录景德镇陶瓷从原料到成品的完整制作过程，展示了千年窑火的传承与创新。', '/static/albums/jingdezhen_pottery_cover.jpg', '2023-03-10', '江西美术出版社', '© 2023 江西美术出版社', 1756, 1, 0, 1, '景德镇陶瓷的制作工艺全记录'),

-- 传统节庆类影集
('中国传统节日影集', 2022, '刘洋', '刘洋，民俗文化摄影师，足迹遍布中国各地记录传统节庆活动。', '收录了中国各地传统节日庆祝活动的精彩瞬间，包括春节、元宵、端午、中秋等重要节日。', '/static/albums/chinese_festivals_cover.jpg', '2022-12-01', '民俗文化出版社', '© 2022 民俗文化出版社', 4215, 1, 1, 3, '全面展示中国传统节日的民俗活动'),
('贵州侗族大歌节影集', 2021, '周明', '周明，少数民族文化摄影专家，多次深入少数民族地区进行拍摄。', '记录了贵州黎平侗族大歌节的盛况，展示了侗族大歌这一"人类非物质文化遗产"的魅力。', '/static/albums/dong_grand_song_cover.jpg', '2021-11-15', '贵州民族出版社', '© 2021 贵州民族出版社', 2103, 1, 0, 2, '侗族大歌是中国首批入选联合国"人类非物质文化遗产代表作名录"的项目之一'),

-- 传统建筑类影集
('中国古建筑摄影集', 2023, '赵刚', '赵刚，建筑摄影师，专注于中国传统建筑摄影研究。', '本影集收录了中国各地具有代表性的古建筑，包括宫殿、寺庙、园林、民居等，展示了中国传统建筑的独特魅力。', '/static/albums/chinese_architecture_cover.jpg', '2023-06-18', '建筑艺术出版社', '© 2023 建筑艺术出版社', 3127, 1, 1, 4, '全面展示中国传统建筑的艺术价值和文化内涵'),
('福建土楼影像志', 2020, '陈华', '陈华，福建本土摄影师，致力于客家文化遗产的影像记录。', '全景展示福建土楼的建筑特色、历史变迁和居民生活，深入挖掘客家文化的独特魅力。', '/static/albums/fujian_tulou_cover.jpg', '2020-08-25', '福建人民出版社', '© 2020 福建人民出版社', 2876, 1, 0, 3, '福建土楼是中国传统民居建筑的杰出代表，被列入世界文化遗产名录'),

-- 民间艺术类影集
('中国皮影艺术影集', 2022, '杨丽', '杨丽，民间艺术摄影师，致力于濒危民间艺术的记录与保护。', '记录了中国各地区皮影戏的艺术特色、制作工艺和表演技巧，展示了这一古老艺术形式的独特魅力。', '/static/albums/shadow_puppetry_cover.jpg', '2022-07-12', '民间文艺出版社', '© 2022 民间文艺出版社', 1893, 1, 0, 5, '中国皮影戏是世界上最早的影片形式之一'),
('中国剪纸艺术集', 2021, '孙芳', '孙芳，民间工艺摄影师，专注于传统手工艺的视觉记录。', '展示了中国各地区剪纸艺术的地域特色和艺术风格，记录了非物质文化遗产传承人的创作过程。', '/static/albums/paper_cutting_cover.jpg', '2021-04-30', '民艺出版社', '© 2021 民艺出版社', 2345, 1, 0, 2, '中国剪纸艺术的地域风格与传承实录'),

-- 测试用影集（隐藏状态）
('测试影集1', 2023, '测试作者', '这是一个测试用的摄影师简介。', '这是一个用于测试的影集描述内容。', '/static/albums/test_album1_cover.jpg', '2023-01-01', '测试出版社', '© 2023 测试版权', 0, 0, 0, 1, '这是一个测试用的影集，设置为隐藏状态');

-- 照片表示例数据
INSERT INTO photo (
    album_id,
    photo_title,
    photo_url,
    photo_desc,
    watermark_url,
    watermark_position,
    watermark_opacity,
    sort_order,
    status,
    created_by,
    remark
) VALUES
-- 热贡唐卡艺术影集的照片 (album_id = 1)
(1, '热贡唐卡大师工作照', '/static/photos/regong/master_working.jpg', '热贡唐卡传承人李大师专注绘制唐卡的工作场景', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 1, 1, 1, '记录了唐卡大师的工作状态'),
(1, '唐卡绘制工具展示', '/static/photos/regong/tools.jpg', '热贡唐卡绘制所需的传统工具和颜料', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 2, 1, 1, '展示了唐卡绘制的专业工具'),
(1, '唐卡细节特写', '/static/photos/regong/detail.jpg', '热贡唐卡作品中精细的面部特写', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 3, 1, 1, '展现了唐卡艺术的精细程度'),
(1, '唐卡绘制过程', '/static/photos/regong/process.jpg', '热贡唐卡从线稿到上色的绘制过程', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 4, 1, 1, '记录了唐卡创作的不同阶段'),
(1, '完成的唐卡作品', '/static/photos/regong/finished_work.jpg', '一幅完成的热贡唐卡作品全景', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 5, 1, 1, '展示了完成后的唐卡艺术品'),
(1, '唐卡艺术传承', '/static/photos/regong/teaching.jpg', '热贡唐卡大师向年轻学徒传授技艺', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 6, 1, 1, '记录了唐卡艺术的传承过程'),
(1, '唐卡颜料制作', '/static/photos/regong/pigment_making.jpg', '热贡唐卡传统矿物颜料的制作过程', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 7, 1, 1, '展示了传统颜料的制作方法'),
(1, '唐卡装裱过程', '/static/photos/regong/mounting.jpg', '热贡唐卡作品的传统装裱技艺', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 8, 1, 1, '记录了唐卡装裱的工艺过程'),

-- 苏绣技艺传承影集的照片 (album_id = 2)
(2, '苏绣大师创作场景', '/static/photos/suzhou/master_embroidering.jpg', '苏绣非遗传承人专注创作的场景', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 1, 1, 2, '记录了苏绣大师的工作状态'),
(2, '苏绣针法展示', '/static/photos/suzhou/stitch_techniques.jpg', '苏绣中各种精细针法的特写展示', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 2, 1, 2, '展示了苏绣的基本针法技巧'),
(2, '苏绣工具组合', '/static/photos/suzhou/embroidery_tools.jpg', '传统苏绣所使用的专业工具', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 3, 1, 2, '展示了苏绣艺术的专业工具'),
(2, '苏绣作品-花鸟图', '/static/photos/suzhou/flowers_birds.jpg', '精美的苏绣花鸟题材作品', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 4, 1, 2, '展示了苏绣花鸟题材的代表作'),
(2, '苏绣作品-人物肖像', '/static/photos/suzhou/portrait.jpg', '逼真的苏绣人物肖像作品', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 5, 1, 2, '展示了苏绣人物题材的精湛技艺'),
(2, '苏绣传承教学', '/static/photos/suzhou/teaching.jpg', '苏绣大师向年轻一代传授技艺', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 6, 1, 2, '记录了苏绣艺术的传承过程'),
(2, '苏绣作品展示', '/static/photos/suzhou/exhibition.jpg', '苏绣作品在博物馆中的展出场景', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 7, 1, 2, '展示了苏绣作品的展览情况'),

-- 景德镇陶瓷工艺影集的照片 (album_id = 3)
(3, '景德镇制瓷原料', '/static/photos/jingdezhen/raw_materials.jpg', '景德镇陶瓷制作所用的高岭土等原料', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 1, 1, 1, '展示了制瓷的原材料'),
(3, '陶瓷拉坯过程', '/static/photos/jingdezhen/throwing.jpg', '景德镇陶瓷艺人进行拉坯的工作场景', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 2, 1, 1, '记录了陶瓷拉坯的技艺'),
(3, '青花瓷绘制', '/static/photos/jingdezhen/blue_painting.jpg', '景德镇青花瓷的手工绘制过程', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 3, 1, 1, '展示了青花瓷的绘制工艺'),
(3, '陶瓷窑炉', '/static/photos/jingdezhen/kiln.jpg', '景德镇传统柴窑烧制陶瓷的场景', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 4, 1, 1, '记录了传统柴窑的烧制过程'),
(3, '出窑作品', '/static/photos/jingdezhen/finished_products.jpg', '景德镇陶瓷烧制完成后的成品展示', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 5, 1, 1, '展示了烧制完成的陶瓷作品'),
(3, '陶瓷彩绘工艺', '/static/photos/jingdezhen/color_painting.jpg', '景德镇陶瓷的传统彩绘工艺', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 6, 1, 1, '记录了陶瓷彩绘的精细过程'),
(3, '陶瓷传承人', '/static/photos/jingdezhen/master_portrait.jpg', '景德镇陶瓷非遗传承人肖像', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 7, 1, 1, '展示了陶瓷传承人的工作风采'),
(3, '现代陶瓷创新', '/static/photos/jingdezhen/modern_innovation.jpg', '景德镇陶瓷的现代创新设计作品', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 8, 1, 1, '展示了陶瓷艺术的现代创新'),
(3, '陶瓷工艺厂景', '/static/photos/jingdezhen/workshop.jpg', '景德镇传统陶瓷工坊的全景', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 9, 1, 1, '记录了传统陶瓷工坊的工作环境'),

-- 中国传统节日影集的照片 (album_id = 4)
(4, '春节庙会', '/static/photos/festivals/spring_festival.jpg', '北京地坛春节庙会的热闹场景', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 1, 1, 3, '记录了春节庙会的民俗活动'),
(4, '元宵花灯', '/static/photos/festivals/lantern_festival.jpg', '元宵节期间南京夫子庙的彩灯展示', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 2, 1, 3, '展示了元宵节的花灯艺术'),
(4, '端午赛龙舟', '/static/photos/festivals/dragon_boat.jpg', '广州端午节赛龙舟的激烈场面', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 3, 1, 3, '记录了端午节赛龙舟的传统'),
(4, '中秋赏月', '/static/photos/festivals/mid_autumn.jpg', '杭州西湖边中秋赏月的场景', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 4, 1, 3, '展示了中秋节赏月的传统活动'),
(4, '清明踏青', '/static/photos/festivals/qingming.jpg', '苏州寒山寺清明节踏青的人们', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 5, 1, 3, '记录了清明节踏青的传统'),
(4, '重阳登高', '/static/photos/festivals/double_ninth.jpg', '黄山重阳节登高的游客', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 6, 1, 3, '展示了重阳节登高的民俗活动'),
(4, '腊八粥制作', '/static/photos/festivals/laba_porridge.jpg', '北京雍和宫腊八节施粥的场景', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 7, 1, 3, '记录了腊八节熬粥的传统'),

-- 贵州侗族大歌节影集的照片 (album_id = 5)
(5, '侗族大歌表演', '/static/photos/dong/grand_song_performance.jpg', '贵州黎平侗族大歌现场表演', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 1, 1, 2, '记录了侗族大歌的表演场景'),
(5, '侗族服饰展示', '/static/photos/dong/dong_costume.jpg', '侗族传统节日盛装的民众', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 2, 1, 2, '展示了侗族的传统服饰'),
(5, '侗寨风光', '/static/photos/dong/dong_village.jpg', '贵州侗族村寨的全景风光', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 3, 1, 2, '展示了侗族村寨的建筑特色'),
(5, '侗族鼓楼', '/static/photos/dong/drum_tower.jpg', '侗族村寨中的标志性建筑鼓楼', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 4, 1, 2, '记录了侗族鼓楼的建筑特色'),
(5, '侗族风雨桥', '/static/photos/dong/wind_rain_bridge.jpg', '侗族地区特色的风雨桥', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 5, 1, 2, '展示了侗族风雨桥的建筑艺术'),
(5, '侗族大歌传承人', '/static/photos/dong/song_master.jpg', '侗族大歌非遗传承人肖像', '/static/watermarks/heritage_logo.png', 'bottom-right', 30, 6, 1, 2, '记录了侗族大歌传承人的风采');



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



