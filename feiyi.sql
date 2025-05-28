-- 创建文化遗产管理数据库，使用 UTF-8 字符集和 Unicode 排序规则
CREATE DATABASE IF NOT EXISTS heritage_management CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 切换到新创建的数据库
USE heritage_management;

-- 用户管理表：存储系统用户的详细信息
CREATE TABLE user (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '用户唯一标识，自增主键',
    username VARCHAR(50) NOT NULL UNIQUE COMMENT '用户名，唯一且不可为空',
    password VARCHAR(255) NOT NULL COMMENT '用户密码，使用加密存储',
    real_name VARCHAR(50) COMMENT '用户真实姓名',
    email VARCHAR(100) COMMENT '用户电子邮箱',
    phone VARCHAR(20) COMMENT '用户联系电话',
    role_id BIGINT NOT NULL COMMENT '用户角色ID，外键关联角色表',
    avatar VARCHAR(255) COMMENT '用户头像地址',
    last_login_time DATETIME COMMENT '最后登录时间',
    status TINYINT DEFAULT 1 COMMENT '用户状态：1-正常，0-禁用',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_username (username) COMMENT '用户名索引，提高查询性能',
    INDEX idx_status (status) COMMENT '用户状态索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '用户信息表，管理系统用户基本信息和状态';

-- 角色表：定义系统中的用户角色
CREATE TABLE role (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '角色唯一标识，自增主键',
    role_name VARCHAR(50) NOT NULL COMMENT '角色名称',
    description VARCHAR(255) COMMENT '角色描述',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_role_name (role_name) COMMENT '角色名称索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '系统角色表，定义不同的用户角色和权限';

-- 权限表：定义系统中的具体权限
CREATE TABLE permission (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '权限唯一标识，自增主键',
    permission_name VARCHAR(100) NOT NULL COMMENT '权限名称',
    permission_code VARCHAR(100) NOT NULL COMMENT '权限编码，用于精确控制权限',
    description VARCHAR(255) COMMENT '权限描述',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_permission_code (permission_code) COMMENT '权限编码索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '系统权限表，定义细粒度的操作权限';

-- 角色权限关系表：定义角色与权限的多对多关系
CREATE TABLE role_permission (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '角色权限关系唯一标识，自增主键',
    role_id BIGINT NOT NULL COMMENT '角色ID，外键关联角色表',
    permission_id BIGINT NOT NULL COMMENT '权限ID，外键关联权限表',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_role_id (role_id) COMMENT '角色ID索引',
    INDEX idx_permission_id (permission_id) COMMENT '权限ID索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '角色权限关系表，管理角色与权限的映射关系';

-- 登录日志表：记录用户登录系统的详细信息
CREATE TABLE login_log (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '登录日志唯一标识，自增主键',
    user_id BIGINT COMMENT '登录用户ID，外键关联用户表',
    username VARCHAR(50) COMMENT '登录用户名',
    login_ip VARCHAR(50) COMMENT '登录IP地址',
    login_location VARCHAR(100) COMMENT '登录地理位置',
    browser VARCHAR(50) COMMENT '登录浏览器类型',
    os VARCHAR(50) COMMENT '登录操作系统',
    status TINYINT COMMENT '登录状态：1-成功，0-失败',
    msg VARCHAR(255) COMMENT '登录消息或错误描述',
    login_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
    INDEX idx_user_id (user_id) COMMENT '用户ID索引',
    INDEX idx_login_time (login_time) COMMENT '登录时间索引',
    INDEX idx_status (status) COMMENT '登录状态索引'
) COMMENT '用户登录日志表，记录系统登录活动和安全信息';

-- 操作日志表：记录用户在系统中的操作详细信息
CREATE TABLE operation_log (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '操作日志唯一标识，自增主键',
    user_id BIGINT COMMENT '操作用户ID，外键关联用户表',
    username VARCHAR(50) COMMENT '操作用户名',
    operation_ip VARCHAR(50) COMMENT '操作IP地址',
    operation_location VARCHAR(100) COMMENT '操作地理位置',
    operation_type VARCHAR(50) COMMENT '操作类型（如：新增、修改、删除）',
    method VARCHAR(100) COMMENT '操作方法或接口名称',
    request_url VARCHAR(255) COMMENT '请求的URL地址',
    request_method VARCHAR(10) COMMENT 'HTTP请求方法（GET、POST等）',
    request_param TEXT COMMENT '请求参数',
    response_result TEXT COMMENT '响应结果',
    operation_status TINYINT COMMENT '操作状态：1-成功，0-失败',
    error_msg VARCHAR(2000) COMMENT '错误信息描述',
    operation_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
    INDEX idx_user_id (user_id) COMMENT '用户ID索引',
    INDEX idx_operation_time (operation_time) COMMENT '操作时间索引',
    INDEX idx_operation_type (operation_type) COMMENT '操作类型索引',
    INDEX idx_operation_status (operation_status) COMMENT '操作状态索引'
) COMMENT '系统操作日志表，记录用户的详细操作行为和系统活动';

-- 首页轮播图表：管理首页展示的轮播图片及相关信息
CREATE TABLE banner (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '轮播图唯一标识，自增主键',
    title VARCHAR(100) NOT NULL COMMENT '轮播图标题',
    image_url VARCHAR(255) NOT NULL COMMENT '轮播图片地址',
    link_url VARCHAR(255) COMMENT '点击轮播图跳转的链接',
    page_type TINYINT NOT NULL COMMENT '页面类型（如首页、专题页等）',
    display_order INT DEFAULT 0 COMMENT '显示顺序，数值越小越靠前',
    status TINYINT DEFAULT 1 COMMENT '轮播图状态：1-显示，0-隐藏',
    aspect_ratio VARCHAR(20) COMMENT '图片宽高比',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_page_type (page_type) COMMENT '页面类型索引',
    INDEX idx_display_order (display_order) COMMENT '显示顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '首页轮播图表，管理首页展示的图片及跳转链接';

-- 首页简介表：管理首页的简介内容
CREATE TABLE home_introduction (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '简介唯一标识，自增主键',
    title VARCHAR(100) NOT NULL COMMENT '简介标题',
    content TEXT NOT NULL COMMENT '简介内容',
    display_order INT DEFAULT 0 COMMENT '显示顺序',
    status TINYINT DEFAULT 1 COMMENT '简介状态：1-显示，0-隐藏',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_display_order (display_order) COMMENT '显示顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '首页简介表，管理首页展示的简介内容';

-- 首页推荐项目表：管理首页推荐的重点项目
CREATE TABLE featured_project (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '推荐项目唯一标识，自增主键',
    project_id BIGINT NOT NULL COMMENT '项目ID，外键关联heritage_project表',
    feature_type TINYINT NOT NULL COMMENT '推荐类型（如首页推荐、专题推荐等）',
    display_order INT DEFAULT 0 COMMENT '显示顺序',
    status TINYINT DEFAULT 1 COMMENT '推荐状态：1-显示，0-隐藏',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_project_id (project_id) COMMENT '项目ID索引',
    INDEX idx_feature_type (feature_type) COMMENT '推荐类型索引',
    INDEX idx_display_order (display_order) COMMENT '显示顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '首页推荐项目表，管理首页重点推荐的文化遗产项目';

-- 页脚设置表：管理网站底部的相关信息
CREATE TABLE footer_setting (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '页脚设置唯一标识，自增主键',
    copyright TEXT COMMENT '版权信息',
    technical_support TEXT COMMENT '技术支持信息',
    contact_info TEXT COMMENT '联系方式',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '网站页脚设置表，管理底部版权、技术支持等信息';

-- 友情链接表：管理首页展示的友情链接
CREATE TABLE friendly_link (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '友情链接唯一标识，自增主键',
    link_name VARCHAR(100) NOT NULL COMMENT '链接名称',
    link_url VARCHAR(255) NOT NULL COMMENT '链接地址',
    logo_url VARCHAR(255) COMMENT '链接Logo图片地址',
    display_order INT DEFAULT 0 COMMENT '显示顺序',
    status TINYINT DEFAULT 1 COMMENT '链接状态：1-显示，0-隐藏',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_display_order (display_order) COMMENT '显示顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '首页友情链接表，管理首页展示的外部链接';

-- 非遗项目表：记录各类非物质文化遗产项目信息
CREATE TABLE heritage_project (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '非遗项目唯一标识，自增主键',
    project_name VARCHAR(100) NOT NULL COMMENT '非遗项目名称',
    project_code VARCHAR(50) UNIQUE COMMENT '项目编号，唯一',
    description TEXT COMMENT '项目简介',
    thumbnail_image VARCHAR(255) COMMENT '项目缩略图',
    vertical_image VARCHAR(255) COMMENT '项目竖版图片',
    mask_effect_image VARCHAR(255) COMMENT '项目遮罩特效图片',
    project_level TINYINT NOT NULL COMMENT '项目级别（如国家级、省级等）',
    is_unesco TINYINT DEFAULT 0 COMMENT '是否为联合国教科文组织项目：1-是，0-否',
    category_id BIGINT COMMENT '项目类别ID，外键关联heritage_category表',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_project_name (project_name) COMMENT '项目名称索引',
    INDEX idx_project_code (project_code) COMMENT '项目编号索引',
    INDEX idx_project_level (project_level) COMMENT '项目级别索引',
    INDEX idx_is_unesco (is_unesco) COMMENT '联合国教科文组织项目索引',
    INDEX idx_category_id (category_id) COMMENT '项目类别ID索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '非物质文化遗产项目表，记录各类非遗项目信息';

-- 非遗类别表：记录非遗项目的分类信息
CREATE TABLE heritage_category (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '类别唯一标识，自增主键',
    category_name VARCHAR(100) NOT NULL COMMENT '类别名称',
    description TEXT COMMENT '类别描述',
    display_order INT DEFAULT 0 COMMENT '显示顺序',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_category_name (category_name) COMMENT '类别名称索引',
    INDEX idx_display_order (display_order) COMMENT '显示顺序索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '非遗类别表，记录非遗项目的分类信息';

-- 非遗传承人表：记录非遗项目的传承人信息
CREATE TABLE heritage_inheritor (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '传承人唯一标识，自增主键',
    inheritor_name VARCHAR(100) NOT NULL COMMENT '传承人姓名',
    inheritor_code VARCHAR(50) UNIQUE COMMENT '传承人编号，唯一',
    gender TINYINT COMMENT '性别：1-男，2-女',
    birth_date DATE COMMENT '出生日期',
    ethnicity VARCHAR(50) COMMENT '民族',
    address VARCHAR(255) COMMENT '联系地址',
    contact VARCHAR(50) COMMENT '联系方式',
    portrait_image VARCHAR(255) COMMENT '传承人头像',
    bio TEXT COMMENT '传承人简介',
    project_id BIGINT COMMENT '所属非遗项目ID，外键关联heritage_project表',
    inheritor_level TINYINT NOT NULL COMMENT '传承人级别（如国家级、省级等）',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_inheritor_name (inheritor_name) COMMENT '传承人姓名索引',
    INDEX idx_inheritor_code (inheritor_code) COMMENT '传承人编号索引',
    INDEX idx_project_id (project_id) COMMENT '所属项目ID索引',
    INDEX idx_inheritor_level (inheritor_level) COMMENT '传承人级别索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '非遗传承人表，记录非遗项目的传承人详细信息';

-- 照片相册表：管理各类照片相册及其信息
CREATE TABLE photo_album (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '相册唯一标识，自增主键',
    album_name VARCHAR(100) NOT NULL COMMENT '相册名称',
    description TEXT COMMENT '相册描述',
    cover_image VARCHAR(255) COMMENT '相册封面图片',
    year INT COMMENT '拍摄年份',
    photographer VARCHAR(100) COMMENT '摄影师姓名',
    photographer_bio TEXT COMMENT '摄影师简介',
    display_order INT DEFAULT 0 COMMENT '显示顺序',
    status TINYINT DEFAULT 1 COMMENT '相册状态：1-显示，0-隐藏',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_album_name (album_name) COMMENT '相册名称索引',
    INDEX idx_year (year) COMMENT '年份索引',
    INDEX idx_photographer (photographer) COMMENT '摄影师索引',
    INDEX idx_display_order (display_order) COMMENT '显示顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '照片相册表，管理各类照片相册信息';

-- 照片表：管理相册下的具体照片信息
CREATE TABLE photo (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '照片唯一标识，自增主键',
    album_id BIGINT COMMENT '所属相册ID，外键关联photo_album表',
    photo_name VARCHAR(100) COMMENT '照片名称',
    photo_url VARCHAR(255) NOT NULL COMMENT '照片原图地址',
    thumbnail_url VARCHAR(255) COMMENT '照片缩略图地址',
    description TEXT COMMENT '照片描述',
    exif_info TEXT COMMENT '照片EXIF信息',
    watermark TINYINT DEFAULT 1 COMMENT '是否有水印：1-有，0-无',
    display_order INT DEFAULT 0 COMMENT '显示顺序',
    status TINYINT DEFAULT 1 COMMENT '照片状态：1-显示，0-隐藏',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_album_id (album_id) COMMENT '相册ID索引',
    INDEX idx_photo_name (photo_name) COMMENT '照片名称索引',
    INDEX idx_display_order (display_order) COMMENT '显示顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '照片表，管理相册下的具体照片信息';

-- 音乐表：管理与非遗项目相关的音乐资源
CREATE TABLE music (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '音乐唯一标识，自增主键',
    music_name VARCHAR(100) NOT NULL COMMENT '音乐名称',
    artist VARCHAR(100) COMMENT '艺术家/演奏者',
    music_url VARCHAR(255) NOT NULL COMMENT '音乐文件地址',
    cover_image VARCHAR(255) COMMENT '音乐封面图片',
    description TEXT COMMENT '音乐描述',
    duration VARCHAR(20) COMMENT '音乐时长',
    related_project_id BIGINT COMMENT '关联非遗项目ID，外键关联heritage_project表',
    display_order INT DEFAULT 0 COMMENT '显示顺序',
    status TINYINT DEFAULT 1 COMMENT '音乐状态：1-显示，0-隐藏',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_music_name (music_name) COMMENT '音乐名称索引',
    INDEX idx_artist (artist) COMMENT '艺术家索引',
    INDEX idx_related_project_id (related_project_id) COMMENT '关联项目ID索引',
    INDEX idx_display_order (display_order) COMMENT '显示顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '音乐资源表，管理与非遗项目相关的音乐信息';

-- 视频表：管理与非遗项目相关的视频资源
CREATE TABLE video (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '视频唯一标识，自增主键',
    video_name VARCHAR(100) NOT NULL COMMENT '视频名称',
    video_url VARCHAR(255) NOT NULL COMMENT '视频文件地址',
    cover_image VARCHAR(255) COMMENT '视频封面图片',
    description TEXT COMMENT '视频描述',
    duration VARCHAR(20) COMMENT '视频时长',
    related_project_id BIGINT COMMENT '关联非遗项目ID，外键关联heritage_project表',
    display_order INT DEFAULT 0 COMMENT '显示顺序',
    status TINYINT DEFAULT 1 COMMENT '视频状态：1-显示，0-隐藏',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_video_name (video_name) COMMENT '视频名称索引',
    INDEX idx_related_project_id (related_project_id) COMMENT '关联项目ID索引',
    INDEX idx_display_order (display_order) COMMENT '显示顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '视频资源表，管理与非遗项目相关的视频信息';

-- 学术文章表：管理学术研究类文章信息
CREATE TABLE academic_article (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '学术文章唯一标识，自增主键',
    title VARCHAR(200) NOT NULL COMMENT '文章标题',
    author VARCHAR(100) COMMENT '作者',
    publish_date DATE COMMENT '发表日期',
    source VARCHAR(100) COMMENT '文章来源',
    content TEXT NOT NULL COMMENT '文章内容',
    category TINYINT COMMENT '文章类别',
    featured TINYINT DEFAULT 0 COMMENT '是否推荐：1-推荐，0-不推荐',
    view_count INT DEFAULT 0 COMMENT '浏览次数',
    display_order INT DEFAULT 0 COMMENT '显示顺序',
    status TINYINT DEFAULT 1 COMMENT '文章状态：1-显示，0-隐藏',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_title (title) COMMENT '标题索引',
    INDEX idx_author (author) COMMENT '作者索引',
    INDEX idx_publish_date (publish_date) COMMENT '发表日期索引',
    INDEX idx_category (category) COMMENT '类别索引',
    INDEX idx_featured (featured) COMMENT '推荐索引',
    INDEX idx_display_order (display_order) COMMENT '显示顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '学术文章表，管理学术研究类文章信息';

-- 访谈表：管理学者、传承人等访谈内容
CREATE TABLE interview (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '访谈唯一标识，自增主键',
    title VARCHAR(200) NOT NULL COMMENT '访谈标题',
    interviewee VARCHAR(100) COMMENT '受访者姓名',
    avatar_url VARCHAR(255) COMMENT '受访者头像',
    short_bio VARCHAR(300) COMMENT '受访者简介',
    interview_date DATE COMMENT '访谈日期',
    content TEXT NOT NULL COMMENT '访谈内容',
    featured TINYINT DEFAULT 0 COMMENT '是否推荐：1-推荐，0-不推荐',
    view_count INT DEFAULT 0 COMMENT '浏览次数',
    display_order INT DEFAULT 0 COMMENT '显示顺序',
    status TINYINT DEFAULT 1 COMMENT '访谈状态：1-显示，0-隐藏',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_title (title) COMMENT '标题索引',
    INDEX idx_interviewee (interviewee) COMMENT '受访者索引',
    INDEX idx_interview_date (interview_date) COMMENT '访谈日期索引',
    INDEX idx_featured (featured) COMMENT '推荐索引',
    INDEX idx_display_order (display_order) COMMENT '显示顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '访谈表，管理学者、传承人等访谈内容';

-- 课程表：管理与非遗相关的课程信息
CREATE TABLE course (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '课程唯一标识，自增主键',
    course_name VARCHAR(200) NOT NULL COMMENT '课程名称',
    instructor VARCHAR(100) COMMENT '讲师姓名',
    cover_image VARCHAR(255) COMMENT '课程封面图片',
    description TEXT COMMENT '课程简介',
    course_duration VARCHAR(50) COMMENT '课程时长',
    related_project_id BIGINT COMMENT '关联非遗项目ID，外键关联heritage_project表',
    featured TINYINT DEFAULT 0 COMMENT '是否推荐：1-推荐，0-不推荐',
    view_count INT DEFAULT 0 COMMENT '浏览次数',
    display_order INT DEFAULT 0 COMMENT '显示顺序',
    status TINYINT DEFAULT 1 COMMENT '课程状态：1-显示，0-隐藏',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_course_name (course_name) COMMENT '课程名称索引',
    INDEX idx_instructor (instructor) COMMENT '讲师索引',
    INDEX idx_related_project_id (related_project_id) COMMENT '关联项目ID索引',
    INDEX idx_featured (featured) COMMENT '推荐索引',
    INDEX idx_display_order (display_order) COMMENT '显示顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '课程表，管理与非遗相关的课程信息';

-- 课程章节表：管理课程下的章节内容
CREATE TABLE course_chapter (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '课程章节唯一标识，自增主键',
    course_id BIGINT NOT NULL COMMENT '所属课程ID，外键关联course表',
    chapter_name VARCHAR(200) NOT NULL COMMENT '章节名称',
    content TEXT COMMENT '章节内容',
    video_url VARCHAR(255) COMMENT '章节视频地址',
    chapter_order INT DEFAULT 0 COMMENT '章节顺序',
    status TINYINT DEFAULT 1 COMMENT '章节状态：1-显示，0-隐藏',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_course_id (course_id) COMMENT '课程ID索引',
    INDEX idx_chapter_order (chapter_order) COMMENT '章节顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '课程章节表，管理课程下的章节内容';

-- 水印设置表：管理系统图片等资源的水印配置
CREATE TABLE watermark_setting (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '水印设置唯一标识，自增主键',
    watermark_image VARCHAR(255) COMMENT '水印图片地址',
    watermark_text VARCHAR(100) COMMENT '水印文字内容',
    position VARCHAR(20) COMMENT '水印位置',
    transparency FLOAT DEFAULT 0.5 COMMENT '水印透明度',
    size VARCHAR(20) COMMENT '水印大小',
    status TINYINT DEFAULT 1 COMMENT '水印状态：1-启用，0-禁用',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '水印设置表，管理系统图片等资源的水印配置';

-- 系统配置表：管理全局系统参数
CREATE TABLE system_config (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '系统配置唯一标识，自增主键',
    config_key VARCHAR(100) NOT NULL UNIQUE COMMENT '配置项键名，唯一',
    config_value TEXT COMMENT '配置项值',
    description VARCHAR(255) COMMENT '配置项描述',
    status TINYINT DEFAULT 1 COMMENT '配置项状态：1-启用，0-禁用',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    is_deleted TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    INDEX idx_config_key (config_key) COMMENT '配置项键名索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_is_deleted (is_deleted) COMMENT '删除状态索引'
) COMMENT '系统配置表，管理全局系统参数';

-- 外键约束：保证数据表之间的关联完整性
ALTER TABLE user ADD CONSTRAINT fk_user_role FOREIGN KEY (role_id) REFERENCES role(id);
ALTER TABLE role_permission ADD CONSTRAINT fk_role_permission_role FOREIGN KEY (role_id) REFERENCES role(id);
ALTER TABLE role_permission ADD CONSTRAINT fk_role_permission_permission FOREIGN KEY (permission_id) REFERENCES permission(id);
ALTER TABLE featured_project ADD CONSTRAINT fk_featured_project_project FOREIGN KEY (project_id) REFERENCES heritage_project(id);
ALTER TABLE heritage_project ADD CONSTRAINT fk_heritage_project_category FOREIGN KEY (category_id) REFERENCES heritage_category(id);
ALTER TABLE heritage_inheritor ADD CONSTRAINT fk_heritage_inheritor_project FOREIGN KEY (project_id) REFERENCES heritage_project(id);
ALTER TABLE photo ADD CONSTRAINT fk_photo_album FOREIGN KEY (album_id) REFERENCES photo_album(id);
ALTER TABLE music ADD CONSTRAINT fk_music_project FOREIGN KEY (related_project_id) REFERENCES heritage_project(id);
ALTER TABLE video ADD CONSTRAINT fk_video_project FOREIGN KEY (related_project_id) REFERENCES heritage_project(id);
ALTER TABLE course ADD CONSTRAINT fk_course_project FOREIGN KEY (related_project_id) REFERENCES heritage_project(id);
ALTER TABLE course_chapter ADD CONSTRAINT fk_course_chapter_course FOREIGN KEY (course_id) REFERENCES course(id);

-- 初始化默认数据：为系统预置基础角色和配置
INSERT INTO role (role_name, description) VALUES ('Super Admin', 'System super administrator with all permissions'); -- 超级管理员角色
INSERT INTO role (role_name, description) VALUES ('Registrar', 'User who can register and manage heritage data'); -- 登记者角色
INSERT INTO system_config (config_key, config_value, description) 
VALUES ('site_name', 'Qinghai Intangible Cultural Heritage Digital Museum', 'Website name'); -- 网站名称配置
