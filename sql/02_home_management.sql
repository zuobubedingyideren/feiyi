-- 首页管理模块：Banner、引言、热门项目、置顶项目、页脚、友情链接等
USE heritage_management;

-- Banner表：管理首页轮播图
CREATE TABLE banner (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Banner唯一标识，自增主键',
    title VARCHAR(100) COMMENT 'Banner标题',
    image_url VARCHAR(255) NOT NULL COMMENT '图片URL',
    link_url VARCHAR(255) COMMENT '链接URL',
    description VARCHAR(255) COMMENT 'Banner描述',
    sort_order INT DEFAULT 0 COMMENT '排序顺序',
    status TINYINT DEFAULT 1 COMMENT 'Banner状态：1-显示，0-隐藏',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    del_flag TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    remark VARCHAR(255) COMMENT '备注',
    INDEX idx_sort_order (sort_order) COMMENT '排序顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT 'Banner表，管理首页轮播图';

-- 首页引言表：管理首页引言内容
CREATE TABLE home_introduction (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '引言唯一标识，自增主键',
    title VARCHAR(100) COMMENT '引言标题',
    content TEXT NOT NULL COMMENT '引言内容',
    status TINYINT DEFAULT 1 COMMENT '引言状态：1-显示，0-隐藏',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    del_flag TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    remark VARCHAR(255) COMMENT '备注',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '首页引言表，管理首页引言内容';

-- 页脚设置表：管理页脚信息
CREATE TABLE footer_setting (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '页脚设置唯一标识，自增主键',
    tech_support_title VARCHAR(100) COMMENT '技术支持标题',
    tech_support_content TEXT COMMENT '技术支持内容',
    copyright VARCHAR(255) COMMENT '版权信息',
    status TINYINT DEFAULT 1 COMMENT '状态：1-显示，0-隐藏',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    del_flag TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    remark VARCHAR(255) COMMENT '备注',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '页脚设置表，管理页脚信息';

-- 友情链接表：管理页脚友情链接
CREATE TABLE friendly_link (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '友情链接唯一标识，自增主键',
    link_name VARCHAR(100) NOT NULL COMMENT '链接名称',
    link_url VARCHAR(255) NOT NULL COMMENT '链接URL',
    link_logo VARCHAR(255) COMMENT '链接Logo',
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
    INDEX idx_sort_order (sort_order) COMMENT '排序顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '友情链接表，管理页脚友情链接';

-- 热门项目表：管理首页热门项目
CREATE TABLE featured_project (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '热门项目唯一标识，自增主键',
    project_id BIGINT NOT NULL COMMENT '项目ID，外键关联heritage_project表',
    vertical_image VARCHAR(255) COMMENT '竖版图片',
    mask_effect VARCHAR(50) COMMENT '蒙版效果',
    mask_image VARCHAR(255) COMMENT '蒙版图片',
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
    INDEX idx_project_id (project_id) COMMENT '项目ID索引',
    INDEX idx_sort_order (sort_order) COMMENT '排序顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '热门项目表，管理首页热门项目';


-- 置顶项目表：管理世界名录中的置顶项目
CREATE TABLE top_project (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '置顶项目唯一标识，自增主键',
    project_id BIGINT NOT NULL COMMENT '项目ID，外键关联heritage_project表',
    cover_image VARCHAR(255) COMMENT '封面图片',
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
    INDEX idx_project_id (project_id) COMMENT '项目ID索引',
    INDEX idx_sort_order (sort_order) COMMENT '排序顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '置顶项目表，管理世界名录中的置顶项目';

-- 插入热门项目表示例数据
INSERT INTO featured_project (project_id, vertical_image, mask_effect, mask_image, sort_order, status, created_by, updated_by, remark) VALUES
(1001, '/uploads/featured/vertical_image_1001.jpg', 'gradient', '/uploads/featured/mask_image_1001.png', 1, 1, 1, 1, '青海省非遗项目-唐卡'),
(1002, '/uploads/featured/vertical_image_1002.jpg', 'blur', '/uploads/featured/mask_image_1002.png', 2, 1, 1, 1, '青海省非遗项目-热贡艺术'),
(1003, '/uploads/featured/vertical_image_1003.jpg', 'darken', '/uploads/featured/mask_image_1003.png', 3, 1, 1, 1, '青海省非遗项目-藏族歌舞'),
(1004, '/uploads/featured/vertical_image_1004.jpg', 'gradient', '/uploads/featured/mask_image_1004.png', 4, 1, 1, 1, '青海省非遗项目-藏医药浴法'),
(1005, '/uploads/featured/vertical_image_1005.jpg', 'blur', '/uploads/featured/mask_image_1005.png', 5, 1, 1, 1, '青海省非遗项目-格萨尔说唱'),
(1006, '/uploads/featured/vertical_image_1006.jpg', 'darken', '/uploads/featured/mask_image_1006.png', 6, 1, 1, 1, '青海省非遗项目-安多藏族服饰'),
(1007, '/uploads/featured/vertical_image_1007.jpg', 'gradient', '/uploads/featured/mask_image_1007.png', 7, 1, 1, 1, '青海省非遗项目-塔尔寺酥油花'),
(1008, '/uploads/featured/vertical_image_1008.jpg', 'blur', '/uploads/featured/mask_image_1008.png', 8, 1, 1, 1, '青海省非遗项目-湟中堆绣'),
(1009, '/uploads/featured/vertical_image_1009.jpg', 'darken', '/uploads/featured/mask_image_1009.png', 9, 0, 1, 1, '青海省非遗项目-热贡面具'),
(1010, '/uploads/featured/vertical_image_1010.jpg', 'gradient', '/uploads/featured/mask_image_1010.png', 10, 0, 1, 1, '青海省非遗项目-藏族唐卡');

-- 插入置顶项目表示例数据
INSERT INTO top_project (project_id, cover_image, sort_order, status, created_by, updated_by, remark) VALUES
(2001, '/uploads/top/cover_image_2001.jpg', 1, 1, 1, 1, '世界非遗项目-中国昆曲'),
(2002, '/uploads/top/cover_image_2002.jpg', 2, 1, 1, 1, '世界非遗项目-中国京剧'),
(2003, '/uploads/top/cover_image_2003.jpg', 3, 1, 1, 1, '世界非遗项目-中国传统木结构营造技艺'),
(2004, '/uploads/top/cover_image_2004.jpg', 4, 1, 1, 1, '世界非遗项目-中国剪纸'),
(2005, '/uploads/top/cover_image_2005.jpg', 5, 1, 1, 1, '世界非遗项目-中国书法'),
(2006, '/uploads/top/cover_image_2006.jpg', 6, 1, 1, 1, '世界非遗项目-中国传统医药'),
(2007, '/uploads/top/cover_image_2007.jpg', 7, 1, 1, 1, '世界非遗项目-中国传统造纸技艺'),
(2008, '/uploads/top/cover_image_2008.jpg', 8, 1, 1, 1, '世界非遗项目-中国古琴艺术'),
(2009, '/uploads/top/cover_image_2009.jpg', 9, 0, 1, 1, '世界非遗项目-中国传统节日'),
(2010, '/uploads/top/cover_image_2010.jpg', 10, 0, 1, 1, '世界非遗项目-中国传统戏曲');
