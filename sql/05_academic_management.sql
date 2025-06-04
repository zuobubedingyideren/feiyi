-- --------------------------------------------------------
-- 学术管理模块优化版：学术文章、访谈、课程等与项目的关联
-- 支持一个项目对应多个学术资源的关系
-- --------------------------------------------------------
USE heritage_management;

-- --------------------------------------------------------
-- 学术文章表：管理学术文章信息
-- --------------------------------------------------------
CREATE TABLE article (
    -- 基本信息
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '文章唯一标识，自增主键',
    title VARCHAR(255) NOT NULL COMMENT '文章标题',
    subtitle VARCHAR(255) COMMENT '文章副标题',
    author VARCHAR(100) COMMENT '作者',
    co_authors TEXT COMMENT '合作作者，多个作者用逗号分隔',
    
    -- 文章内容
    abstract TEXT COMMENT '摘要',
    content LONGTEXT COMMENT '文章内容',
    keywords VARCHAR(500) COMMENT '关键词，多个关键词用逗号分隔',
    
    -- 发表信息
    journal_name VARCHAR(200) COMMENT '期刊名称',
    journal_issue VARCHAR(50) COMMENT '期刊期号',
    publication_date DATE COMMENT '发表日期',
    doi VARCHAR(100) COMMENT 'DOI号',
    issn VARCHAR(20) COMMENT 'ISSN号',
    page_range VARCHAR(50) COMMENT '页码范围',
    source VARCHAR(100) COMMENT '文章来源',
    
    -- 分类信息
    article_type TINYINT DEFAULT 1 COMMENT '文章类型：1-学术论文，2-研究报告，3-调研文章，4-其他',
    research_field VARCHAR(100) COMMENT '研究领域',
    academic_level TINYINT COMMENT '学术级别：1-核心期刊，2-普通期刊，3-会议论文，4-其他',
    
    -- 引用信息
    citation_count INT DEFAULT 0 COMMENT '引用次数',
    download_count INT DEFAULT 0 COMMENT '下载次数',
    view_count INT DEFAULT 0 COMMENT '浏览次数',
    
    -- 文件信息
    file_url VARCHAR(500) COMMENT '文件URL',
    file_size BIGINT COMMENT '文件大小（字节）',
    file_format VARCHAR(20) COMMENT '文件格式：pdf, doc, docx等',
    
    -- 状态信息
    status TINYINT DEFAULT 1 COMMENT '状态：1-已发表，2-待发表，3-草稿，0-隐藏',
    is_open_access TINYINT DEFAULT 0 COMMENT '是否开放获取：1-是，0-否',
    featured TINYINT DEFAULT 0 COMMENT '是否推荐：1-推荐，0-不推荐',
    display_order INT DEFAULT 0 COMMENT '显示顺序',
    
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
    INDEX idx_author (author) COMMENT '作者索引',
    INDEX idx_journal_name (journal_name) COMMENT '期刊名称索引',
    INDEX idx_publication_date (publication_date) COMMENT '发表日期索引',
    INDEX idx_article_type (article_type) COMMENT '文章类型索引',
    INDEX idx_research_field (research_field) COMMENT '研究领域索引',
    INDEX idx_academic_level (academic_level) COMMENT '学术级别索引',
    INDEX idx_featured (featured) COMMENT '推荐索引',
    INDEX idx_display_order (display_order) COMMENT '显示顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '学术文章表，管理学术文章信息';

-- --------------------------------------------------------
-- 访谈表：管理访谈信息
-- --------------------------------------------------------
CREATE TABLE interview (
    -- 基本信息
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '访谈唯一标识，自增主键',
    title VARCHAR(255) NOT NULL COMMENT '访谈标题',
    interviewee VARCHAR(100) COMMENT '受访者',
    interviewer VARCHAR(100) COMMENT '访谈者',
    avatar_url VARCHAR(255) COMMENT '受访者头像',
    short_bio VARCHAR(300) COMMENT '受访者简介',
    
    -- 访谈内容
    interview_desc TEXT COMMENT '访谈描述',
    content LONGTEXT COMMENT '访谈内容',
    summary TEXT COMMENT '访谈总结',
    key_points TEXT COMMENT '关键要点',
    
    -- 访谈信息
    interview_date DATE COMMENT '访谈日期',
    interview_location VARCHAR(200) COMMENT '访谈地点',
    interview_duration INT COMMENT '访谈时长（分钟）',
    interview_language VARCHAR(50) COMMENT '访谈语言',
    
    -- 访谈类型
    interview_type TINYINT DEFAULT 1 COMMENT '访谈类型：1-深度访谈，2-结构化访谈，3-半结构化访谈，4-其他',
    interview_method TINYINT DEFAULT 1 COMMENT '访谈方式：1-面对面，2-电话，3-视频，4-其他',
    
    -- 媒体文件
    audio_url VARCHAR(500) COMMENT '音频文件URL',
    video_url VARCHAR(500) COMMENT '视频文件URL',
    transcript_url VARCHAR(500) COMMENT '文字稿URL',
    
    -- 统计信息
    view_count INT DEFAULT 0 COMMENT '浏览次数',
    download_count INT DEFAULT 0 COMMENT '下载次数',
    featured TINYINT DEFAULT 0 COMMENT '是否推荐：1-推荐，0-不推荐',
    display_order INT DEFAULT 0 COMMENT '显示顺序',
    
    -- 状态信息
    status TINYINT DEFAULT 1 COMMENT '状态：1-已完成，2-进行中，3-计划中，0-隐藏',
    
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
    INDEX idx_interviewee (interviewee) COMMENT '受访者索引',
    INDEX idx_interviewer (interviewer) COMMENT '访谈者索引',
    INDEX idx_interview_date (interview_date) COMMENT '访谈日期索引',
    INDEX idx_interview_type (interview_type) COMMENT '访谈类型索引',
    INDEX idx_featured (featured) COMMENT '推荐索引',
    INDEX idx_display_order (display_order) COMMENT '显示顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '访谈表，管理访谈信息';

-- --------------------------------------------------------
-- 课程表：管理课程信息
-- --------------------------------------------------------
CREATE TABLE course (
    -- 基本信息
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '课程唯一标识，自增主键',
    course_name VARCHAR(200) NOT NULL COMMENT '课程名称',
    course_code VARCHAR(50) COMMENT '课程编号',
    instructor VARCHAR(100) COMMENT '授课教师',
    co_instructors TEXT COMMENT '协同教师，多个教师用逗号分隔',
    cover_image VARCHAR(255) COMMENT '课程封面图片',
    
    -- 课程内容
    course_desc TEXT COMMENT '课程描述',
    course_objectives TEXT COMMENT '课程目标',
    course_outline LONGTEXT COMMENT '课程大纲',
    prerequisites VARCHAR(500) COMMENT '先修课程',
    
    -- 课程信息
    course_type TINYINT DEFAULT 1 COMMENT '课程类型：1-理论课，2-实践课，3-理论+实践，4-其他',
    course_level TINYINT DEFAULT 1 COMMENT '课程级别：1-入门，2-中级，3-高级，4-专家',
    credit_hours DECIMAL(3,1) COMMENT '学分',
    total_hours INT COMMENT '总学时',
    course_duration VARCHAR(50) COMMENT '课程时长',
    
    -- 开课信息
    semester VARCHAR(50) COMMENT '开课学期',
    academic_year VARCHAR(20) COMMENT '学年',
    start_date DATE COMMENT '开课日期',
    end_date DATE COMMENT '结课日期',
    class_schedule VARCHAR(200) COMMENT '上课时间安排',
    classroom VARCHAR(100) COMMENT '教室',
    
    -- 招生信息
    max_students INT COMMENT '最大招生人数',
    enrolled_students INT DEFAULT 0 COMMENT '已报名人数',
    tuition_fee DECIMAL(10,2) COMMENT '学费',
    
    -- 课程资源
    syllabus_url VARCHAR(500) COMMENT '教学大纲URL',
    materials_url VARCHAR(500) COMMENT '教学材料URL',
    video_url VARCHAR(500) COMMENT '课程视频URL',
    
    -- 统计信息
    view_count INT DEFAULT 0 COMMENT '浏览次数',
    enrollment_count INT DEFAULT 0 COMMENT '累计报名人数',
    completion_rate DECIMAL(5,2) COMMENT '完成率（百分比）',
    featured TINYINT DEFAULT 0 COMMENT '是否推荐：1-推荐，0-不推荐',
    display_order INT DEFAULT 0 COMMENT '显示顺序',
    
    -- 状态信息
    status TINYINT DEFAULT 1 COMMENT '状态：1-开放报名，2-进行中，3-已结束，4-暂停，0-隐藏',
    
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
    INDEX idx_course_name (course_name) COMMENT '课程名称索引',
    INDEX idx_course_code (course_code) COMMENT '课程编号索引',
    INDEX idx_instructor (instructor) COMMENT '授课教师索引',
    INDEX idx_course_type (course_type) COMMENT '课程类型索引',
    INDEX idx_course_level (course_level) COMMENT '课程级别索引',
    INDEX idx_semester (semester) COMMENT '开课学期索引',
    INDEX idx_start_date (start_date) COMMENT '开课日期索引',
    INDEX idx_featured (featured) COMMENT '推荐索引',
    INDEX idx_display_order (display_order) COMMENT '显示顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '课程表，管理课程信息';

-- --------------------------------------------------------
-- 课程章节表：管理课程下的章节内容
-- --------------------------------------------------------
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
    del_flag TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    remark VARCHAR(255) COMMENT '备注',
    
    -- 外键约束
    FOREIGN KEY (course_id) REFERENCES course(id) ON DELETE CASCADE,
    
    INDEX idx_course_id (course_id) COMMENT '所属课程ID索引',
    INDEX idx_chapter_order (chapter_order) COMMENT '章节顺序索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '课程章节表，管理课程下的章节内容';
