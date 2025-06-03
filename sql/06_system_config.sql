-- 系统配置：水印设置、系统参数等
USE heritage_management;

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
    del_flag TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    remark VARCHAR(255) COMMENT '备注',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
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
    del_flag TINYINT DEFAULT 0 COMMENT '逻辑删除标志：0-未删除，1-已删除',
    deleted_at DATETIME COMMENT '删除时间',
    deleted_by BIGINT COMMENT '删除人ID',
    remark VARCHAR(255) COMMENT '备注',
    INDEX idx_config_key (config_key) COMMENT '配置项键名索引',
    INDEX idx_status (status) COMMENT '状态索引',
    INDEX idx_del_flag (del_flag) COMMENT '删除状态索引'
) COMMENT '系统配置表，管理全局系统参数';