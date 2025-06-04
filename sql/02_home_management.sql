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

-- 热门项目表：管理首页热门项目
CREATE TABLE featured_project (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '热门项目唯一标识，自增主键',
    project_id BIGINT NOT NULL COMMENT '项目ID，外键关联heritage_project表',
    cover_image VARCHAR(255) COMMENT '封面图片',
    vertical_image VARCHAR(255) COMMENT '竖版图片',
    mask_effect VARCHAR(50) COMMENT '蒙版效果',
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