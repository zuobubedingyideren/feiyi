-- 外键约束：保证数据表之间的关联完整性
USE heritage_management;


-- 首页管理模块外键
ALTER TABLE featured_project ADD CONSTRAINT fk_featured_project_project FOREIGN KEY (project_id) REFERENCES heritage_project(id);
ALTER TABLE top_project ADD CONSTRAINT fk_top_project_project FOREIGN KEY (project_id) REFERENCES heritage_project(id);

-- 清单管理模块外键
ALTER TABLE heritage_project ADD CONSTRAINT fk_heritage_project_category FOREIGN KEY (category_id) REFERENCES heritage_category(id);
ALTER TABLE heritage_inheritor ADD CONSTRAINT fk_heritage_inheritor_project FOREIGN KEY (project_id) REFERENCES heritage_project(id);

-- 资源管理模块外键
ALTER TABLE photo ADD CONSTRAINT fk_photo_album FOREIGN KEY (album_id) REFERENCES photo_album(id);

-- 学术管理模块外键
ALTER TABLE course_chapter ADD CONSTRAINT fk_chapter_course FOREIGN KEY (course_id) REFERENCES course(id);



-- 项目图片关联表外键
ALTER TABLE project_photo_relation ADD CONSTRAINT fk_project_photo_project FOREIGN KEY (project_id) REFERENCES heritage_project(id);
ALTER TABLE project_photo_relation ADD CONSTRAINT fk_project_photo_photo FOREIGN KEY (photo_id) REFERENCES photo(id);

-- 项目学术文章关联表外键
ALTER TABLE project_article_relation ADD CONSTRAINT fk_project_article_project FOREIGN KEY (project_id) REFERENCES heritage_project(id);
ALTER TABLE project_article_relation ADD CONSTRAINT fk_project_article_article FOREIGN KEY (article_id) REFERENCES article(id);

