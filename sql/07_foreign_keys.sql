-- 外键约束：保证数据表之间的关联完整性
USE qheritage_management;

-- 用户-角色外键
ALTER TABLE user ADD CONSTRAINT fk_user_role FOREIGN KEY (role_id) REFERENCES role(id);

-- 角色权限关联表外键
ALTER TABLE role_permission ADD CONSTRAINT fk_role_permission_role FOREIGN KEY (role_id) REFERENCES role(id);
ALTER TABLE role_permission ADD CONSTRAINT fk_role_permission_permission FOREIGN KEY (permission_id) REFERENCES permission(id);

-- 首页管理模块外键
ALTER TABLE featured_project ADD CONSTRAINT fk_featured_project_project FOREIGN KEY (project_id) REFERENCES heritage_project(id);

-- 清单管理模块外键
ALTER TABLE heritage_project ADD CONSTRAINT fk_heritage_project_category FOREIGN KEY (category_id) REFERENCES heritage_category(id);
ALTER TABLE heritage_inheritor ADD CONSTRAINT fk_heritage_inheritor_project FOREIGN KEY (project_id) REFERENCES heritage_project(id);

-- 资源管理模块外键
ALTER TABLE photo ADD CONSTRAINT fk_photo_album FOREIGN KEY (album_id) REFERENCES photo_album(id);
ALTER TABLE music ADD CONSTRAINT fk_music_project FOREIGN KEY (related_project_id) REFERENCES heritage_project(id);
ALTER TABLE video ADD CONSTRAINT fk_video_project FOREIGN KEY (related_project_id) REFERENCES heritage_project(id);

-- 学术管理模块外键
ALTER TABLE course ADD CONSTRAINT fk_course_project FOREIGN KEY (related_project_id) REFERENCES heritage_project(id);
ALTER TABLE course_chapter ADD CONSTRAINT fk_course_chapter_course FOREIGN KEY (course_id) REFERENCES course(id);