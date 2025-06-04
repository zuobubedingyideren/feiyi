-- --------------------------------------------------------
-- 清单管理模块优化版：非遗项目分类、非遗项目、传承人等
-- 支持一个项目对应多个相关图片、传承人、学术资源的关系
-- --------------------------------------------------------
USE heritage_management;

-- --------------------------------------------------------
-- 非遗项目表：管理非遗项目信息
-- --------------------------------------------------------
CREATE TABLE heritage_project (
    -- 基本信息
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '项目唯一标识，自增主键',
    project_name VARCHAR(200) NOT NULL COMMENT '项目名称',
    
    -- 门类分类信息（根据国家级非遗项目十大门类）
    heritage_category_name VARCHAR(50) COMMENT '非遗门类名称，如民间文学、传统音乐等',
    serial_number VARCHAR(20) COMMENT '项目序号，如Ⅱ-28',
    
    -- 申报信息
    declaration_area VARCHAR(100) COMMENT '申报地区',
    declaration_level TINYINT COMMENT '申报级别：1-区级，2-州级，3-省级，4-国家级',
    batch_number TINYINT COMMENT '批次号：1-第一批，2-第二批，3-第三批，4-第四批，5-第五批',
    is_expansion_project TINYINT DEFAULT 0 COMMENT '是否为扩展项目：0-否，1-是',
    
    -- UNESCO相关信息（关联到unesco_heritage表）
    unesco_id BIGINT COMMENT '联合国教科文组织名录ID，关联unesco_heritage表',
    
    -- 项目详情
    cover_image VARCHAR(255) COMMENT '封面图片',
    milestone_events TEXT COMMENT '项目重要里程碑事件，可记录项目发展的关键时间点和事件',
    
    -- 项目类型和保护信息
    project_type VARCHAR(100) COMMENT '项目类型',
    protection_unit VARCHAR(200) COMMENT '保护单位',
    
    -- 发布信息
    publish_time DATETIME COMMENT '发布时间',
    article_source VARCHAR(200) COMMENT '文章来源',
    view_count INT DEFAULT 0 COMMENT '浏览次数',
    
    -- 状态信息
    status TINYINT DEFAULT 1 COMMENT '状态：1-显示，0-隐藏',
    is_featured TINYINT DEFAULT 0 COMMENT '是否推荐：1-推荐，0-不推荐',
    
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
    INDEX idx_project_name (project_name) COMMENT '项目名称索引',
    INDEX idx_heritage_category_name (heritage_category_name) COMMENT '非遗门类名称索引',
    INDEX idx_serial_number (serial_number) COMMENT '项目序号索引',
    INDEX idx_declaration_level (declaration_level) COMMENT '申报级别索引',
    INDEX idx_batch_number (batch_number) COMMENT '批次号索引',
    INDEX idx_is_expansion_project (is_expansion_project) COMMENT '是否扩展项目索引',
    INDEX idx_unesco_id (unesco_id) COMMENT '联合国教科文组织名录ID索引',
    INDEX idx_project_type (project_type) COMMENT '项目类型索引',

    INDEX idx_publish_time (publish_time) COMMENT '发布时间索引',
    INDEX idx_view_count (view_count) COMMENT '浏览量索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_is_featured (is_featured) COMMENT '推荐状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '非遗项目表，管理非遗项目信息';

-- --------------------------------------------------------
-- UNESCO非遗名录表：管理联合国教科文组织非遗名录信息
-- --------------------------------------------------------
CREATE TABLE unesco_heritage (
    -- 基本信息
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '名录唯一标识，自增主键',
    project_id BIGINT NOT NULL COMMENT '项目ID，外键关联heritage_project表',
    
    -- UNESCO信息
    unesco_category VARCHAR(100) NOT NULL COMMENT '联合国教科文组织类别',
    unesco_year INT NOT NULL COMMENT '入选联合国教科文组织年份',
    unesco_batch VARCHAR(50) COMMENT '入选批次',
    unesco_number VARCHAR(50) COMMENT '编号',
    unesco_certificate_url VARCHAR(255) COMMENT '证书图片URL',
    unesco_description TEXT COMMENT '名录描述',
    
    -- 申报信息
    application_date DATE COMMENT '申请日期',
    approval_date DATE COMMENT '批准日期',
    application_country VARCHAR(100) COMMENT '申报国家',
    joint_application TINYINT DEFAULT 0 COMMENT '是否联合申报：0-否，1-是',
    joint_countries TEXT COMMENT '联合申报国家，多个国家用逗号分隔',
    
    -- 状态信息
    status TINYINT DEFAULT 1 COMMENT '状态：1-有效，0-无效',
    
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
    FOREIGN KEY (project_id) REFERENCES heritage_project(id) ON DELETE CASCADE,
    
    -- 索引
    INDEX idx_project_id (project_id) COMMENT '项目ID索引',
    INDEX idx_unesco_category (unesco_category) COMMENT 'UNESCO类别索引',
    INDEX idx_unesco_year (unesco_year) COMMENT '入选年份索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT 'UNESCO非遗名录表，管理联合国教科文组织非遗名录信息';

-- --------------------------------------------------------
-- 传承人表：管理非遗传承人信息
-- --------------------------------------------------------
CREATE TABLE heritage_inheritor (
    -- 基本信息
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '传承人唯一标识，自增主键',
    inheritor_name VARCHAR(100) NOT NULL COMMENT '传承人姓名',
    gender TINYINT COMMENT '性别：1-男，2-女',
    birth_date DATE COMMENT '出生日期',
    death_date DATE COMMENT '去世日期',
    nation VARCHAR(50) COMMENT '民族',
    native_place VARCHAR(100) COMMENT '籍贯',
    id_card VARCHAR(18) COMMENT '身份证号',
    contact_phone VARCHAR(20) COMMENT '联系电话',
    address VARCHAR(255) COMMENT '联系地址',
    
    -- 传承信息
    inheritor_level TINYINT COMMENT '传承人级别：1-区级，2-州级，3-省级，4-国家级',
    approval_number VARCHAR(100) COMMENT '批准文号',
    approval_date DATE COMMENT '批准日期',
    approval_batch VARCHAR(50) COMMENT '批准批次',
    
    -- 详细信息
    avatar VARCHAR(255) COMMENT '头像',
    inheritor_desc TEXT COMMENT '传承人介绍',
    skill_desc TEXT COMMENT '技艺特点',
    inheritance_mode TEXT COMMENT '传承方式',
    inheritance_achievement TEXT COMMENT '传承成果',
    education_background VARCHAR(200) COMMENT '教育背景',
    work_experience TEXT COMMENT '工作经历',
    awards_honors TEXT COMMENT '获奖荣誉',
    
    -- 发布信息
    publish_time DATETIME COMMENT '发布时间',
    article_source VARCHAR(200) COMMENT '文章来源',
    view_count INT DEFAULT 0 COMMENT '浏览量',
    like_count INT DEFAULT 0 COMMENT '点赞次数',
    
    -- 状态信息
    status TINYINT DEFAULT 1 COMMENT '状态：1-显示，0-隐藏',
    is_alive TINYINT DEFAULT 1 COMMENT '是否在世：1-在世，0-已故',
    
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
    INDEX idx_inheritor_name (inheritor_name) COMMENT '传承人姓名索引',
    INDEX idx_inheritor_level (inheritor_level) COMMENT '传承人级别索引',
    INDEX idx_nation (nation) COMMENT '民族索引',
    INDEX idx_publish_time (publish_time) COMMENT '发布时间索引',
    INDEX idx_view_count (view_count) COMMENT '浏览量索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_is_alive (is_alive) COMMENT '是否在世索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '传承人表，管理非遗传承人信息';


-- --------------------------------------------------------
-- 项目图片表：管理项目相关图片
-- --------------------------------------------------------
CREATE TABLE project_image (
    -- 基本信息
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '图片唯一标识，自增主键',
    project_id BIGINT NOT NULL COMMENT '项目ID，外键关联heritage_project表',
    image_title VARCHAR(200) COMMENT '图片标题',
    image_url VARCHAR(500) NOT NULL COMMENT '图片URL',
    image_desc TEXT COMMENT '图片描述',
    
    -- 图片属性
    image_type TINYINT DEFAULT 1 COMMENT '图片类型：1-封面图，2-详情图，3-活动图，4-作品图，5-其他',
    image_format VARCHAR(20) COMMENT '图片格式：jpg, png, gif等',
    image_size BIGINT COMMENT '图片大小（字节）',
    image_width INT COMMENT '图片宽度（像素）',
    image_height INT COMMENT '图片高度（像素）',
    
    -- 拍摄信息
    photographer VARCHAR(100) COMMENT '摄影师',
    shooting_date DATE COMMENT '拍摄日期',
    shooting_location VARCHAR(200) COMMENT '拍摄地点',
    copyright_info VARCHAR(200) COMMENT '版权信息',
    
    -- 从原始文件保留的字段
    is_cover TINYINT DEFAULT 0 COMMENT '是否为封面图：0-否，1-是',
    watermark_url VARCHAR(255) COMMENT '水印图片URL',
    shooting_time DATETIME COMMENT '拍摄时间',
    
    -- 展示控制
    sort_order INT DEFAULT 0 COMMENT '排序顺序',
    is_watermark TINYINT DEFAULT 0 COMMENT '是否添加水印：1-是，0-否',
    
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
    
    -- 外键约束
    FOREIGN KEY (project_id) REFERENCES heritage_project(id) ON DELETE CASCADE,
    
    -- 索引
    INDEX idx_project_id (project_id) COMMENT '项目ID索引',
    INDEX idx_image_type (image_type) COMMENT '图片类型索引',
    INDEX idx_sort_order (sort_order) COMMENT '排序顺序索引',
    INDEX idx_shooting_date (shooting_date) COMMENT '拍摄日期索引',
    INDEX idx_is_cover (is_cover) COMMENT '是否为封面图索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '项目图片表，管理项目相关图片';

-- --------------------------------------------------------
-- 传承人图片表：管理传承人相关图片
-- --------------------------------------------------------
CREATE TABLE inheritor_image (
    -- 基本信息
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '图片唯一标识，自增主键',
    inheritor_id BIGINT NOT NULL COMMENT '传承人ID，外键关联heritage_inheritor表',
    image_title VARCHAR(200) COMMENT '图片标题',
    image_url VARCHAR(500) NOT NULL COMMENT '图片URL',
    image_desc TEXT COMMENT '图片描述',
    
    -- 图片属性
    image_type TINYINT DEFAULT 1 COMMENT '图片类型：1-头像，2-生活照，3-工作照，4-作品照，5-活动照，6-其他',
    image_format VARCHAR(20) COMMENT '图片格式：jpg, png, gif等',
    image_size BIGINT COMMENT '图片大小（字节）',
    image_width INT COMMENT '图片宽度（像素）',
    image_height INT COMMENT '图片高度（像素）',
    
    -- 拍摄信息
    photographer VARCHAR(100) COMMENT '摄影师',
    shooting_date DATE COMMENT '拍摄日期',
    shooting_location VARCHAR(200) COMMENT '拍摄地点',
    copyright_info VARCHAR(200) COMMENT '版权信息',
    
    -- 从原始文件保留的字段
    is_avatar TINYINT DEFAULT 0 COMMENT '是否为头像：0-否，1-是',
    watermark_url VARCHAR(255) COMMENT '水印图片URL',
    shooting_time DATETIME COMMENT '拍摄时间',
    
    -- 展示控制
    sort_order INT DEFAULT 0 COMMENT '排序顺序',
    is_watermark TINYINT DEFAULT 0 COMMENT '是否添加水印：1-是，0-否',
    
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
    
    -- 外键约束
    FOREIGN KEY (inheritor_id) REFERENCES heritage_inheritor(id) ON DELETE CASCADE,
    
    -- 索引
    INDEX idx_inheritor_id (inheritor_id) COMMENT '传承人ID索引',
    INDEX idx_image_type (image_type) COMMENT '图片类型索引',
    INDEX idx_sort_order (sort_order) COMMENT '排序顺序索引',
    INDEX idx_shooting_date (shooting_date) COMMENT '拍摄日期索引',
    INDEX idx_is_avatar (is_avatar) COMMENT '是否为头像索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '传承人图片表，管理传承人相关图片';