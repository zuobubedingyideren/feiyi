-- --------------------------------------------------------
-- 清单管理模块优化版：非遗项目分类、非遗项目、传承人等
-- 采用一对多关系：一个项目对应多个相关图片、传承人、学术资源
-- 项目表为主表，图片表、传承人表、学术资源表为子表
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
    
    -- 项目层级信息
    project_level TINYINT COMMENT '项目层级：1-普通项目，2-UNESCO级别项目，3-UNESCO子项目',
    parent_project_id BIGINT COMMENT '父项目ID，用于子项目关联到父项目',
    has_sub_projects TINYINT DEFAULT 0 COMMENT '是否有子项目：0-否，1-是',
    
    batch_number TINYINT COMMENT '批次号：1-第一批，2-第二批，3-第三批，4-第四批，5-第五批',
    
    -- UNESCO相关信息（关联到unesco_heritage表）
    unesco_id BIGINT COMMENT '联合国教科文组织名录ID，关联unesco_heritage表',
    
    -- 项目详情
    cover_image VARCHAR(255) COMMENT '封面图片',
    milestone_events TEXT COMMENT '项目重要里程碑事件，可记录项目发展的关键时间点和事件',
    project_description TEXT COMMENT '项目介绍，详细描述项目的背景、内容、特点等',
    
    -- 项目类型和保护信息
    project_type VARCHAR(100) COMMENT '项目类型',
    protection_unit VARCHAR(200) COMMENT '保护单位',
    
    -- 发布信息
    publish_time DATETIME COMMENT '发布时间',
    article_source VARCHAR(200) COMMENT '文章来源',
    view_count INT DEFAULT 0 COMMENT '浏览次数',
    
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
    INDEX idx_project_name (project_name) COMMENT '项目名称索引',
    INDEX idx_heritage_category_name (heritage_category_name) COMMENT '非遗门类名称索引',
    INDEX idx_serial_number (serial_number) COMMENT '项目序号索引',
    INDEX idx_declaration_level (declaration_level) COMMENT '申报级别索引',
    INDEX idx_batch_number (batch_number) COMMENT '批次号索引',
    INDEX idx_unesco_id (unesco_id) COMMENT '联合国教科文组织名录ID索引',
    INDEX idx_project_type (project_type) COMMENT '项目类型索引',
    
    -- 项目层级相关索引
    INDEX idx_project_level (project_level) COMMENT '项目层级索引',
    INDEX idx_parent_project_id (parent_project_id) COMMENT '父项目ID索引',
    INDEX idx_has_sub_projects (has_sub_projects) COMMENT '是否有子项目索引',

    INDEX idx_publish_time (publish_time) COMMENT '发布时间索引',
    INDEX idx_view_count (view_count) COMMENT '浏览量索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引',
    
    -- 外键约束（自引用）
    CONSTRAINT fk_parent_project FOREIGN KEY (parent_project_id) REFERENCES heritage_project(id) ON DELETE SET NULL
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
    unesco_list_type TINYINT COMMENT 'UNESCO名录类型：1-人类非物质文化遗产代表作名录，2-急需保护的非物质文化遗产名录，3-非物质文化遗产优秀实践名册',
    unesco_year INT NOT NULL COMMENT '入选联合国教科文组织年份',
    unesco_description TEXT COMMENT '名录描述',

    -- 发布信息
    publish_time DATETIME COMMENT '发布时间',
    article_source VARCHAR(200) COMMENT '文章来源',
    view_count INT DEFAULT 0 COMMENT '浏览次数',
    
    
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
    INDEX idx_unesco_list_type (unesco_list_type) COMMENT 'UNESCO名录类型索引',
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
    project_id BIGINT COMMENT '项目ID，外键关联heritage_project表',
    inheritor_name VARCHAR(100) NOT NULL COMMENT '传承人姓名',
    gender TINYINT COMMENT '性别：1-男，2-女',
    nation VARCHAR(50) COMMENT '民族',
    avatar_url VARCHAR(500) COMMENT '传承人头像URL',

    
    -- 传承信息
    inheritor_level TINYINT COMMENT '传承人级别：1-区级，2-州级，3-省级，4-国家级',
    
    -- 详细信息
    inheritor_info TEXT COMMENT '传承人详细信息描述',
    
    -- 发布信息
    announce_date DATE COMMENT '公布日期',
    publish_time DATETIME COMMENT '发布时间',
    article_source VARCHAR(200) COMMENT '文章来源',
    view_count INT DEFAULT 0 COMMENT '浏览量',
    
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
    FOREIGN KEY (project_id) REFERENCES heritage_project(id) ON DELETE SET NULL,
    
    -- 索引
    INDEX idx_project_id (project_id) COMMENT '项目ID索引',
    INDEX idx_inheritor_name (inheritor_name) COMMENT '传承人姓名索引',
    INDEX idx_inheritor_level (inheritor_level) COMMENT '传承人级别索引',
    INDEX idx_nation (nation) COMMENT '民族索引',
    INDEX idx_publish_time (publish_time) COMMENT '发布时间索引',
    INDEX idx_view_count (view_count) COMMENT '浏览量索引',
    INDEX idx_status (status) COMMENT '状态索引',
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
    
    
    -- 展示控制
    sort_order INT DEFAULT 0 COMMENT '排序顺序',
    
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
    INDEX idx_sort_order (sort_order) COMMENT '排序顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '项目图片表，管理项目相关图片';




-- --------------------------------------------------------
-- 学术资源表：管理非遗项目相关的学术资源
-- --------------------------------------------------------
CREATE TABLE academic_resource (
    -- 基本信息
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '学术资源唯一标识，自增主键',
    project_id BIGINT COMMENT '项目ID，外键关联heritage_project表',
    resource_title VARCHAR(300) NOT NULL COMMENT '资源标题',
    jump_url VARCHAR(500) COMMENT '跳转URL链接',
   
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
    
    -- 外键约束
    FOREIGN KEY (project_id) REFERENCES heritage_project(id) ON DELETE SET NULL,
    
    -- 索引
    INDEX idx_project_id (project_id) COMMENT '项目ID索引',
    INDEX idx_resource_title (resource_title) COMMENT '资源标题索引',
    INDEX idx_jump_url (jump_url(255)) COMMENT '跳转URL索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_is_featured (is_featured) COMMENT '推荐状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '学术资源表，管理非遗项目相关的学术资源';