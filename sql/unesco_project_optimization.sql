-- --------------------------------------------------------
-- 非遗项目表结构优化：区分UNESCO名录项目、子项目和普通项目
-- --------------------------------------------------------

-- --------------------------------------------------------
-- 1. 修改heritage_project表，添加项目层级相关字段
-- --------------------------------------------------------
ALTER TABLE heritage_project
    -- 添加项目层级字段
    ADD COLUMN project_level TINYINT COMMENT '项目层级：1-普通项目，2-UNESCO级别项目，3-UNESCO子项目' AFTER declaration_level,
    
    -- 添加父项目ID字段，用于关联子项目到父项目
    ADD COLUMN parent_project_id BIGINT COMMENT '父项目ID，用于子项目关联到父项目' AFTER project_level,
    
    -- 添加是否有子项目字段
    ADD COLUMN has_sub_projects TINYINT DEFAULT 0 COMMENT '是否有子项目：0-否，1-是' AFTER parent_project_id,
    
    -- 添加索引
    ADD INDEX idx_project_level (project_level) COMMENT '项目层级索引',
    ADD INDEX idx_parent_project_id (parent_project_id) COMMENT '父项目ID索引',
    ADD INDEX idx_has_sub_projects (has_sub_projects) COMMENT '是否有子项目索引',
    
    -- 添加外键约束（自引用）
    ADD CONSTRAINT fk_parent_project FOREIGN KEY (parent_project_id) REFERENCES heritage_project(id) ON DELETE SET NULL;

-- --------------------------------------------------------
-- 2. 修改unesco_heritage表，添加名录类型和子项目标识
-- --------------------------------------------------------
ALTER TABLE unesco_heritage
    -- 添加UNESCO名录类型字段
    ADD COLUMN unesco_list_type TINYINT COMMENT 'UNESCO名录类型：1-人类非物质文化遗产代表作名录，2-急需保护的非物质文化遗产名录，3-非物质文化遗产优秀实践名册' AFTER unesco_category,
    
    -- 添加是否有子项目字段
    ADD COLUMN has_sub_projects TINYINT DEFAULT 0 COMMENT '是否有子项目：0-否，1-是' AFTER unesco_description,
    
    -- 添加索引
    ADD INDEX idx_unesco_list_type (unesco_list_type) COMMENT 'UNESCO名录类型索引',
    ADD INDEX idx_has_sub_projects (has_sub_projects) COMMENT '是否有子项目索引';

-- --------------------------------------------------------
-- 3. 创建项目关系表，用于管理项目间的复杂关系
-- --------------------------------------------------------
CREATE TABLE project_relationship (
    -- 基本信息
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '关系唯一标识，自增主键',
    parent_project_id BIGINT NOT NULL COMMENT '父项目ID，外键关联heritage_project表',
    child_project_id BIGINT NOT NULL COMMENT '子项目ID，外键关联heritage_project表',
    
    -- 关系属性
    relationship_type TINYINT NOT NULL DEFAULT 1 COMMENT '关系类型：1-UNESCO项目与子项目，2-项目组合关系，3-项目派生关系，4-其他关系',
    relationship_desc VARCHAR(255) COMMENT '关系描述',
    
    -- 状态信息
    status TINYINT DEFAULT 1 COMMENT '状态：1-有效，0-无效',
    
    -- 审计字段
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    created_by BIGINT COMMENT '创建人ID',
    updated_by BIGINT COMMENT '更新人ID',
    del_flag TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    
    -- 外键约束
    FOREIGN KEY (parent_project_id) REFERENCES heritage_project(id) ON DELETE CASCADE,
    FOREIGN KEY (child_project_id) REFERENCES heritage_project(id) ON DELETE CASCADE,
    
    -- 索引
    INDEX idx_parent_project_id (parent_project_id) COMMENT '父项目ID索引',
    INDEX idx_child_project_id (child_project_id) COMMENT '子项目ID索引',
    INDEX idx_relationship_type (relationship_type) COMMENT '关系类型索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引',
    
    -- 唯一约束，确保同一对父子项目关系不会重复
    UNIQUE KEY uk_parent_child (parent_project_id, child_project_id)
) COMMENT '项目关系表，用于管理项目间的复杂关系';

-- --------------------------------------------------------
-- 4. 示例查询：获取不同类型的项目
-- --------------------------------------------------------

-- 查询所有UNESCO级别项目
SELECT hp.*, uh.unesco_category, uh.unesco_year, uh.unesco_list_type
FROM heritage_project hp
INNER JOIN unesco_heritage uh ON hp.unesco_id = uh.id
WHERE hp.project_level = 2;

-- 查询所有UNESCO子项目
SELECT hp.*, parent.project_name as parent_project_name
FROM heritage_project hp
INNER JOIN heritage_project parent ON hp.parent_project_id = parent.id
WHERE hp.project_level = 3;

-- 查询某个UNESCO项目的所有子项目
SELECT child.*
FROM heritage_project parent
INNER JOIN project_relationship pr ON parent.id = pr.parent_project_id
INNER JOIN heritage_project child ON pr.child_project_id = child.id
WHERE parent.id = [UNESCO项目ID] AND pr.relationship_type = 1;

-- 查询所有普通项目（非UNESCO级别且非子项目）
SELECT *
FROM heritage_project
WHERE project_level = 1 OR project_level IS NULL;