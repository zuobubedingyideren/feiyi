-- 青海非物质文化遗产数据库示例数据
USE heritage_management;


-- 首页管理模块示例数据
-- 1. Banner表数据
INSERT INTO banner (title, image_url, link_url, description, sort_order, created_by) VALUES
('青海非遗文化', '/static/banner/banner1.jpg', '/heritage/regong', '热贡艺术是青海省黄南藏族自治州的一种民间艺术的统称', 1, 1),
('唐卡艺术', '/static/banner/banner2.jpg', '/heritage/thangka', '唐卡是藏族文化中一种独特的绘画艺术形式', 2, 1),
('藏族歌舞', '/static/banner/banner3.jpg', '/heritage/dance', '藏族歌舞是藏族人民情感的重要表达方式', 3, 1),
('青海皮影', '/static/banner/banner4.jpg', '/heritage/shadow', '青海皮影戏是一种古老的民间艺术表演形式', 4, 1),
('格萨尔史诗', '/static/banner/banner5.jpg', '/heritage/gesar', '格萨尔史诗是世界上最长的史诗之一', 5, 1);

-- 2. 首页引言表数据
INSERT INTO home_introduction (title, content, created_by) VALUES
('青海非物质文化遗产数字博物馆', '青海非物质文化遗产数字博物馆致力于保护、传承和弘扬青海地区丰富多彩的非物质文化遗产。通过数字化手段，我们记录和展示了包括热贡艺术、唐卡、藏族歌舞、皮影戏、格萨尔史诗等在内的众多珍贵非遗项目，为公众提供了解青海文化瑰宝的窗口。本博物馆不仅是一个展示平台，更是连接过去与未来的桥梁，让传统文化在现代社会焕发新的生机与活力。', 1);

-- 3. 置顶项目表数据
INSERT INTO featured_project (project_id, cover_image, vertical_image, mask_effect, sort_order, created_by) VALUES
(1, '/static/featured/cover1.jpg', '/static/featured/vertical1.jpg', 'gradient', 1, 1),
(2, '/static/featured/cover2.jpg', '/static/featured/vertical2.jpg', 'gradient', 2, 1),
(3, '/static/featured/cover3.jpg', '/static/featured/vertical3.jpg', 'gradient', 3, 1);

-- 4. 页脚设置表数据
INSERT INTO footer_setting (tech_support_title, tech_support_content, copyright, created_by) VALUES
('技术支持', '青海省文化和旅游厅信息中心提供技术支持', '© 2023 青海非物质文化遗产数字博物馆 版权所有', 1);

-- 5. 友情链接表数据
INSERT INTO friendly_link (link_name, link_url, link_logo, sort_order, created_by) VALUES
('中国非物质文化遗产网', 'http://www.ihchina.cn/', '/static/links/ihchina.png', 1, 1),
('青海省文化和旅游厅', 'http://whly.qinghai.gov.cn/', '/static/links/qhwhj.png', 2, 1),
('中国文化遗产研究院', 'http://www.cach.org.cn/', '/static/links/cach.png', 3, 1),
('青海省博物馆', 'http://www.qhmuseum.cn/', '/static/links/qhmuseum.png', 4, 1),
('青海省图书馆', 'http://www.qhlib.org.cn/', '/static/links/qhlib.png', 5, 1);

-- 清单管理模块示例数据
-- 1. 非遗项目分类表数据
INSERT INTO heritage_category (category_name, parent_id, category_level, sort_order, created_by) VALUES
('传统技艺', 0, 1, 1, 1),
('传统美术', 0, 1, 2, 1),
('传统音乐', 0, 1, 3, 1),
('传统舞蹈', 0, 1, 4, 1),
('传统戏剧', 0, 1, 5, 1),
('传统体育、游艺与杂技', 0, 1, 6, 1),
('传统医药', 0, 1, 7, 1),
('民俗', 0, 1, 8, 1),
('唐卡', 2, 2, 1, 1),
('堆绣', 1, 2, 1, 1),
('藏族歌舞', 4, 2, 1, 1),
('皮影戏', 5, 2, 1, 1),
('藏医药', 7, 2, 1, 1);

-- 2. 非遗项目表数据
INSERT INTO heritage_project (project_name, project_code, category_id, declaration_area, declaration_level, declaration_batch, declaration_year, approval_number, approval_date, is_unesco, unesco_year, unesco_category, cover_image, project_desc, protection_status, historical_origin, cultural_space, inheritance_mode, social_value, protection_measures, view_count, created_by) VALUES
('热贡艺术', 'QH-2008-001', 2, '青海省黄南藏族自治州', 4, '第二批', 2008, '国发〔2008〕19号', '2008-06-07', 1, 2009, '人类非物质文化遗产代表作名录', '/static/projects/regong.jpg', '热贡艺术是青海省黄南藏族自治州的一种民间艺术的统称，包括唐卡、堆绣、壁画、雕塑等多种艺术形式。', '目前保护状况良好，已建立专门的保护中心和传承基地。', '热贡艺术起源于14世纪，由藏传佛教绘画发展而来，历史悠久。', '主要分布在青海省黄南藏族自治州同仁县的隆务河谷地区。', '以师徒传承为主，现已建立多个传承基地和培训中心。', '热贡艺术是藏族文化的重要组成部分，具有极高的艺术价值和文化价值。', '已建立专门的保护机构，制定了保护计划，并开展了数字化记录工作。', 1250, 1),
('唐卡艺术', 'QH-2008-002', 9, '青海省黄南藏族自治州', 4, '第二批', 2008, '国发〔2008〕19号', '2008-06-07', 0, NULL, NULL, '/static/projects/thangka.jpg', '唐卡是藏族文化中一种独特的绘画艺术形式，以宗教题材为主，用矿物颜料绘制在布上。', '保护状况良好，已有多个传承工作室和展览馆。', '唐卡艺术起源于公元7世纪，是藏传佛教艺术的重要组成部分。', '主要分布在青海、西藏、四川、甘肃等藏族聚居区。', '以家族传承和师徒传承相结合的方式进行传承。', '唐卡艺术不仅是宗教艺术，也是藏族历史文化的重要载体。', '已建立专门的保护机构，开展了系统的记录和研究工作。', 980, 1),
('藏族安多热巴舞', 'QH-2008-003', 11, '青海省海南藏族自治州', 4, '第二批', 2008, '国发〔2008〕19号', '2008-06-07', 0, NULL, NULL, '/static/projects/rebadance.jpg', '安多热巴舞是青海藏族地区流传的一种集体舞蹈，表演者围成圆圈，边唱边舞。', '保护状况良好，在本地仍广泛流传。', '安多热巴舞起源于古代藏族的祭祀活动，距今已有上千年历史。', '主要分布在青海省海南藏族自治州、果洛藏族自治州等地区。', '以社区传承为主，在节日和庆典活动中自然传承。', '安多热巴舞是藏族人民情感的重要表达方式，具有重要的文化价值。', '已开展了系统的记录工作，并在学校教育中加入相关内容。', 850, 1),
('青海皮影戏', 'QH-2008-004', 12, '青海省海东市', 4, '第三批', 2011, '国发〔2011〕33号', '2011-05-23', 0, NULL, NULL, '/static/projects/shadow.jpg', '青海皮影戏是一种古老的民间艺术表演形式，使用兽皮或纸板制作的人物剪影，在灯光照射下产生影像。', '保护状况一般，面临传承人老龄化和观众减少的问题。', '青海皮影戏起源于唐代，距今已有上千年历史。', '主要分布在青海省海东市乐都区和民和回族土族自治县。', '以家族传承为主，现在已建立了传承基地。', '青海皮影戏是研究古代社会生活和民间文化的重要资料。', '已开展了抢救性记录工作，并举办了培训班培养新一代传承人。', 520, 1),
('格萨尔史诗', 'QH-2006-001', 8, '青海省果洛藏族自治州', 4, '第一批', 2006, '国发〔2006〕18号', '2006-05-20', 1, 2009, '人类非物质文化遗产代表作名录', '/static/projects/gesar.jpg', '格萨尔史诗是世界上最长的史诗之一，讲述了藏族英雄格萨尔王的故事。', '保护状况良好，已建立专门的保护机构和数据库。', '格萨尔史诗形成于公元11世纪左右，经过千年口头传承和发展。', '主要分布在青海、西藏、四川、甘肃等藏族聚居区。', '以口头传承为主，现在也通过文字记录和数字化手段保存。', '格萨尔史诗是研究藏族历史文化的重要资料，具有极高的文学价值和历史价值。', '已开展了系统的记录和研究工作，并建立了专门的保护中心。', 1100, 1);

-- 3. 传承人表数据
INSERT INTO heritage_inheritor (inheritor_name, gender, birth_date, nation, native_place, id_card, contact_phone, address, project_id, inheritor_level, approval_number, approval_date, approval_batch, avatar, inheritor_desc, skill_desc, inheritance_mode, inheritance_achievement, created_by) VALUES
('才让多杰', 1, '1962-05-15', '藏族', '青海省黄南藏族自治州同仁县', '632321196205150012', '13909701234', '青海省黄南藏族自治州同仁县隆务镇', 1, 4, '文化部〔2008〕12号', '2008-06-07', '第二批', '/static/inheritors/cairang.jpg', '才让多杰是热贡艺术唐卡画派的代表性传承人，从事唐卡创作40余年。', '擅长勾线精细、色彩艳丽的热贡唐卡创作，作品多次获得国家级奖项。', '收徒传艺，已培养学生30余人，并在当地建立了传习所。', '创作唐卡作品200余幅，多次参加国内外展览，出版专著2部。', 1),
('尼玛旺堆', 1, '1965-08-23', '藏族', '青海省黄南藏族自治州同仁县', '632321196508230034', '13909702345', '青海省黄南藏族自治州同仁县隆务镇', 2, 4, '文化部〔2008〕12号', '2008-06-07', '第二批', '/static/inheritors/nima.jpg', '尼玛旺堆是唐卡艺术的代表性传承人，从事唐卡创作35余年。', '擅长新勉唐卡画派，色彩鲜艳，人物形象生动。', '以家族传承为主，同时在当地艺术学校任教。', '创作唐卡作品150余幅，作品被多家博物馆收藏。', 1),
('卓玛央金', 2, '1972-11-05', '藏族', '青海省海南藏族自治州共和县', '632521197211050028', '13909703456', '青海省海南藏族自治州共和县恰卜恰镇', 3, 3, '青海省文化厅〔2010〕45号', '2010-09-15', '第三批', '/static/inheritors/zhuoma.jpg', '卓玛央金是藏族安多热巴舞的代表性传承人，从事舞蹈表演和教学30余年。', '擅长安多地区特有的热巴舞表演技巧，动作舒展大方，节奏感强。', '在当地社区和学校开展教学活动，培养了大量年轻一代传承人。', '组建了热巴舞表演团队，多次参加国内外文化交流活动。', 1),
('马福祥', 1, '1955-02-18', '回族', '青海省海东市乐都区', '632123195502180056', '13909704567', '青海省海东市乐都区碾伯镇', 4, 3, '青海省文化厅〔2012〕38号', '2012-07-20', '第四批', '/static/inheritors/mafuxiang.jpg', '马福祥是青海皮影戏的代表性传承人，从事皮影戏表演和制作50余年。', '擅长皮影人物制作和多种角色的配音表演，保留了传统的表演曲目。', '以家族传承为主，已将技艺传授给子女和徒弟。', '保存了上百个传统皮影戏剧目，制作了数百个皮影人物。', 1),
('扎西尼玛', 1, '1950-04-10', '藏族', '青海省果洛藏族自治州玛沁县', '632621195004100078', '13909705678', '青海省果洛藏族自治州玛沁县大武镇', 5, 4, '文化部〔2006〕15号', '2006-05-20', '第一批', '/static/inheritors/zhaxi.jpg', '扎西尼玛是格萨尔史诗的代表性传承人，被称为"活着的格萨尔词典"。', '能够完整演唱格萨尔史诗多个章节，记忆力惊人，表演风格独特。', '通过口头传授和现代录音录像手段保存和传承。', '已录制格萨尔史诗音频资料上百小时，出版整理作品多部。', 1);

-- 资源管理模块示例数据
-- 1. 影集表数据
INSERT INTO photo_album (album_name, album_year, photographer, photographer_bio, album_desc, cover_image, view_count, created_by) VALUES
('热贡艺术影像志', 2020, '李明', '李明，中国摄影家协会会员，专注于非物质文化遗产摄影20年。', '本影集记录了青海省黄南藏族自治州热贡艺术的创作过程和代表性作品。', '/static/albums/regong_cover.jpg', 560, 1),
('唐卡艺术之美', 2021, '王华', '王华，青海省摄影家协会副主席，曾多次获得国家级摄影奖项。', '本影集展示了青海地区唐卡艺术的精美作品和创作场景。', '/static/albums/thangka_cover.jpg', 480, 1),
('藏族传统歌舞', 2019, '张艺', '张艺，民族文化摄影师，致力于记录少数民族传统文化。', '本影集记录了青海藏族地区传统歌舞表演和节庆活动。', '/static/albums/dance_cover.jpg', 320, 1),
('青海皮影艺术', 2022, '赵强', '赵强，纪实摄影师，专注于传统艺术记录。', '本影集全面记录了青海皮影戏的表演过程和艺人生活。', '/static/albums/shadow_cover.jpg', 280, 1),
('格萨尔传承人影像', 2018, '陈志', '陈志，人文纪实摄影师，多次深入藏区进行拍摄。', '本影集记录了格萨尔史诗传承人的生活和表演场景。', '/static/albums/gesar_cover.jpg', 420, 1);

-- 2. 照片表数据
INSERT INTO photo (album_id, photo_title, photo_url, photo_desc, shooting_time, shooting_location, watermark_url, sort_order, created_by) VALUES
(1, '唐卡创作现场', '/static/photos/regong1.jpg', '热贡艺术传承人才让多杰在创作唐卡', '2020-05-10 10:30:00', '青海省黄南藏族自治州同仁县', '/static/watermarks/museum.png', 1, 1),
(1, '堆绣工艺展示', '/static/photos/regong2.jpg', '热贡艺术堆绣作品细节展示', '2020-05-11 14:20:00', '青海省黄南藏族自治州同仁县', '/static/watermarks/museum.png', 2, 1),
(1, '壁画创作', '/static/photos/regong3.jpg', '艺人在寺院创作壁画', '2020-05-12 09:45:00', '青海省黄南藏族自治州同仁县热贡艺术博物馆', '/static/watermarks/museum.png', 3, 1),
(2, '唐卡大师作品', '/static/photos/thangka1.jpg', '国家级传承人尼玛旺堆的唐卡作品', '2021-06-20 11:15:00', '青海省黄南藏族自治州同仁县隆务寺', '/static/watermarks/museum.png', 1, 1),
(2, '唐卡颜料制作', '/static/photos/thangka2.jpg', '传统矿物颜料的制作过程', '2021-06-21 15:30:00', '青海省黄南藏族自治州同仁县', '/static/watermarks/museum.png', 2, 1),
(2, '唐卡展览现场', '/static/photos/thangka3.jpg', '青海省博物馆唐卡艺术展览', '2021-06-22 10:00:00', '青海省西宁市青海省博物馆', '/static/watermarks/museum.png', 3, 1),
(3, '安多热巴舞表演', '/static/photos/dance1.jpg', '藏族安多热巴舞集体表演场景', '2019-08-15 19:30:00', '青海省海南藏族自治州共和县', '/static/watermarks/museum.png', 1, 1),
(3, '藏族服饰展示', '/static/photos/dance2.jpg', '表演者身着传统藏族服饰', '2019-08-16 16:45:00', '青海省海南藏族自治州共和县', '/static/watermarks/museum.png', 2, 1),
(3, '节日庆典舞蹈', '/static/photos/dance3.jpg', '藏历新年庆典上的传统舞蹈表演', '2019-08-17 20:00:00', '青海省海南藏族自治州贵德县', '/static/watermarks/museum.png', 3, 1),
(4, '皮影戏表演', '/static/photos/shadow1.jpg', '马福祥在表演传统皮影戏', '2022-03-05 19:00:00', '青海省海东市乐都区', '/static/watermarks/museum.png', 1, 1),
(4, '皮影制作工艺', '/static/photos/shadow2.jpg', '传统皮影人物的制作过程', '2022-03-06 14:30:00', '青海省海东市乐都区', '/static/watermarks/museum.png', 2, 1),
(4, '皮影戏道具', '/static/photos/shadow3.jpg', '各类皮影戏道具和人物展示', '2022-03-07 10:15:00', '青海省海东市乐都区非遗展示中心', '/static/watermarks/museum.png', 3, 1),
(5, '格萨尔传承人', '/static/photos/gesar1.jpg', '国家级传承人扎西尼玛在演唱格萨尔史诗', '2018-10-10 15:00:00', '青海省果洛藏族自治州玛沁县', '/static/watermarks/museum.png', 1, 1),
(5, '史诗记录工作', '/static/photos/gesar2.jpg', '研究人员对格萨尔史诗进行录音记录', '2018-10-11 09:30:00', '青海省果洛藏族自治州玛沁县', '/static/watermarks/museum.png', 2, 1),
(5, '格萨尔文化展示', '/static/photos/gesar3.jpg', '格萨尔文化展览现场', '2018-10-12 14:00:00', '青海省西宁市青海民族大学', '/static/watermarks/museum.png', 3, 1);

-- 3. 音乐表数据
INSERT INTO music (music_title, music_url, cover_image, artist, album, duration, music_desc, related_project_id, play_count, created_by) VALUES
('藏族安多民歌《拉伊》', '/static/music/layi.mp3', '/static/music/covers/layi.jpg', '卓玛央金', '藏族传统音乐集', '05:30', '《拉伊》是青海藏族地区流传的一种传统民歌，表达对家乡和亲人的思念之情。', 3, 320, 1),
('格萨尔王传奇', '/static/music/gesar.mp3', '/static/music/covers/gesar.jpg', '扎西尼玛', '格萨尔史诗选段', '12:45', '格萨尔王传奇是格萨尔史诗中的经典选段，讲述了英雄降生的故事。', 5, 280, 1),
('热贡艺术颂', '/static/music/regong.mp3', '/static/music/covers/regong.jpg', '才让多杰', '非遗之声', '06:20', '这是一首赞美热贡艺术的现代创作歌曲，由热贡艺术传承人演唱。', 1, 210, 1),
('唐卡祈福曲', '/static/music/thangka.mp3', '/static/music/covers/thangka.jpg', '尼玛旺堆', '藏传佛教音乐集', '08:15', '这是创作唐卡时常听的传统祈福音乐，有助于艺术创作的专注和虔诚。', 2, 180, 1),
('皮影戏曲牌', '/static/music/shadow.mp3', '/static/music/covers/shadow.jpg', '马福祥', '青海皮影音乐集', '04:50', '这是青海皮影戏表演中使用的传统曲牌，具有鲜明的地方特色。', 4, 150, 1);

-- 4. 视频表数据
INSERT INTO video (video_title, video_url, cover_image, director, duration, video_desc, related_project_id, play_count, created_by) VALUES
('热贡艺术传承纪实', '/static/videos/regong.mp4', '/static/videos/covers/regong.jpg', '张明', '25:30', '本纪录片全面记录了热贡艺术的历史、工艺特点和当代传承情况。', 1, 480, 1),
('唐卡艺术的前世今生', '/static/videos/thangka.mp4', '/static/videos/covers/thangka.jpg', '李红', '30:15', '本纪录片详细介绍了唐卡艺术的历史渊源、绘制工艺和文化内涵。', 2, 420, 1),
('藏族安多热巴舞传习实录', '/static/videos/dance.mp4', '/static/videos/covers/dance.jpg', '王刚', '18:45', '本视频记录了藏族安多热巴舞的教学和传承过程。', 3, 350, 1),
('青海皮影戏表演艺术', '/static/videos/shadow.mp4', '/static/videos/covers/shadow.jpg', '赵亮', '22:10', '本纪录片展示了青海皮影戏的表演技巧和艺术特色。', 4, 280, 1),
('格萨尔史诗传唱者', '/static/videos/gesar.mp4', '/static/videos/covers/gesar.jpg', '陈强', '35:20', '本纪录片记录了格萨尔史诗传承人的生活和艺术实践。', 5, 520, 1);

-- 学术管理模块示例数据
-- 1. 学术文章表数据
INSERT INTO article (title, author, publish_date, source, content, category, featured, view_count, display_order, created_by) VALUES
('热贡艺术的历史渊源与艺术特色', '李文博', '2021-05-15', '青海民族研究', '热贡艺术是青海省黄南藏族自治州的一种民间艺术的统称，包括唐卡、堆绣、壁画、雕塑等多种艺术形式。本文从历史渊源、艺术特色、文化内涵等方面对热贡艺术进行了全面研究...[此处省略详细内容]', 1, 1, 580, 1, 1),
('唐卡艺术的传承与创新', '张学明', '2021-08-20', '中国艺术研究院学报', '唐卡是藏族文化中一种独特的绘画艺术形式，以宗教题材为主，用矿物颜料绘制在布上。本文探讨了唐卡艺术在当代社会的传承困境和创新路径...[此处省略详细内容]', 1, 1, 520, 2, 1),
('藏族安多热巴舞的文化内涵', '王民', '2022-03-10', '民族艺术研究', '安多热巴舞是青海藏族地区流传的一种集体舞蹈，表演者围成圆圈，边唱边舞。本文分析了安多热巴舞的文化内涵和社会功能...[此处省略详细内容]', 2, 0, 320, 3, 1),
('青海皮影戏的保护与传承', '赵文华', '2022-06-05', '非物质文化遗产研究', '青海皮影戏是一种古老的民间艺术表演形式，使用兽皮或纸板制作的人物剪影，在灯光照射下产生影像。本文探讨了青海皮影戏面临的传承困境和保护对策...[此处省略详细内容]', 2, 0, 280, 4, 1),
('格萨尔史诗的文学价值与历史价值', '陈学文', '2021-12-15', '民族文学研究', '格萨尔史诗是世界上最长的史诗之一，讲述了藏族英雄格萨尔王的故事。本文从文学价值和历史价值两个方面对格萨尔史诗进行了深入研究...[此处省略详细内容]', 1, 1, 620, 5, 1);

-- 2. 访谈表数据
INSERT INTO interview (title, interviewee, avatar_url, short_bio, interview_date, content, featured, view_count, display_order, created_by) VALUES
('对话热贡艺术传承人才让多杰', '才让多杰', '/static/interviews/cairang.jpg', '才让多杰是热贡艺术唐卡画派的代表性传承人，从事唐卡创作40余年。', '2021-06-10', '问：请您介绍一下热贡艺术的特点和魅力。\n答：热贡艺术最大的特点是融合了藏传佛教艺术和民间艺术的元素，形成了独特的艺术风格...[此处省略详细内容]', 1, 420, 1, 1),
('唐卡艺术的传承与挑战——访尼玛旺堆', '尼玛旺堆', '/static/interviews/nima.jpg', '尼玛旺堆是唐卡艺术的代表性传承人，从事唐卡创作35余年。', '2021-09-15', '问：您是如何学习唐卡艺术的？\n答：我从12岁开始学习唐卡绘制，最初是跟随父亲学习，后来又拜师学艺...[此处省略详细内容]', 1, 380, 2, 1),
('藏族安多热巴舞的魅力——访卓玛央金', '卓玛央金', '/static/interviews/zhuoma.jpg', '卓玛央金是藏族安多热巴舞的代表性传承人，从事舞蹈表演和教学30余年。', '2022-04-20', '问：安多热巴舞在藏族文化中有什么特殊意义？\n答：安多热巴舞是藏族人民情感的重要表达方式，也是社区凝聚力的重要体现...[此处省略详细内容]', 0, 260, 3, 1),
('皮影戏艺人的坚守——访马福祥', '马福祥', '/static/interviews/mafuxiang.jpg', '马福祥是青海皮影戏的代表性传承人，从事皮影戏表演和制作50余年。', '2022-07-12', '问：您是如何坚持皮影戏艺术传承的？\n答：现在观众越来越少，但我觉得这是祖辈传下来的宝贵财富，必须坚持下去...[此处省略详细内容]', 0, 220, 4, 1),
('活着的格萨尔词典——访扎西尼玛', '扎西尼玛', '/static/interviews/zhaxi.jpg', '扎西尼玛是格萨尔史诗的代表性传承人，被称为"活着的格萨尔词典"。', '2021-11-25', '问：您是如何记忆如此浩瀚的格萨尔史诗的？\n答：这是一种特殊的天赋，我们称为"降神"，在特定的状态下，这些内容会自然而然地涌现出来...[此处省略详细内容]', 1, 480, 5, 1);

-- 3. 课程表数据
INSERT INTO course (course_name, instructor, cover_image, description, course_duration, related_project_id, featured, view_count, display_order, created_by) VALUES
('热贡唐卡基础技法', '才让多杰', '/static/courses/regong.jpg', '本课程介绍热贡唐卡的基础绘制技法，包括构图、线描、上色等环节。', '10课时，共20小时', 1, 1, 350, 1, 1),
('唐卡颜料制作与应用', '尼玛旺堆', '/static/courses/thangka.jpg', '本课程详细讲解唐卡颜料的传统制作方法和使用技巧。', '8课时，共16小时', 2, 1, 320, 2, 1),
('藏族安多热巴舞入门', '卓玛央金', '/static/courses/dance.jpg', '本课程教授藏族安多热巴舞的基本舞步和表演技巧。', '12课时，共18小时', 3, 0, 280, 3, 1),
-- 继续课程章节表数据
INSERT INTO course_chapter (course_id, chapter_title, chapter_content, video_url, chapter_order, created_by) VALUES
(1, '第一章：唐卡绘制工具介绍', '本章介绍唐卡绘制所需的各种工具，包括画笔、颜料、画布等。', '/static/videos/course1_chapter1.mp4', 1, 1),
(1, '第二章：构图与比例', '本章讲解唐卡构图的基本原理和人物比例的掌握方法。', '/static/videos/course1_chapter2.mp4', 2, 1),
(1, '第三章：线描技法', '本章详细演示唐卡线描的各种技法和要点。', '/static/videos/course1_chapter3.mp4', 3, 1),
(1, '第四章：色彩运用', '本章介绍唐卡色彩的搭配原理和上色技巧。', '/static/videos/course1_chapter4.mp4', 4, 1),
(2, '第一章：传统颜料的种类', '本章介绍唐卡绘制中使用的各种传统颜料及其特性。', '/static/videos/course2_chapter1.mp4', 1, 1),
(2, '第二章：矿物颜料的制作', '本章演示如何制作和处理矿物颜料。', '/static/videos/course2_chapter2.mp4', 2, 1),
(2, '第三章：植物颜料的提取', '本章讲解植物颜料的提取和加工方法。', '/static/videos/course2_chapter3.mp4', 3, 1),
(3, '第一章：热巴舞的历史渊源', '本章介绍藏族安多热巴舞的历史发展和文化背景。', '/static/videos/course3_chapter1.mp4', 1, 1),
(3, '第二章：基本舞步练习', '本章教授热巴舞的基本舞步和动作要领。', '/static/videos/course3_chapter2.mp4', 2, 1),
(3, '第三章：队形变化与配合', '本章讲解热巴舞的队形变化和团体配合技巧。', '/static/videos/course3_chapter3.mp4', 3, 1);

-- 资源管理模块示例数据（继续）
-- 1. 影集表数据
INSERT INTO photo_album (album_name, album_year, photographer, photographer_bio, album_desc, cover_image, view_count, created_by) VALUES
('热贡艺术精品集', '2022', '李明华', '专业摄影师，从事文化遗产摄影工作15年', '收录了热贡艺术的精品唐卡、堆绣、雕塑等作品', '/static/albums/regong_album.jpg', 1200, 1),
('青海非遗传承人风采', '2021', '王建国', '纪实摄影师，专注于民族文化记录', '记录了青海各地非遗传承人的工作和生活状态', '/static/albums/inheritors_album.jpg', 980, 1),
('藏族节庆活动纪实', '2023', '张雪梅', '民俗摄影师，长期关注藏族文化', '拍摄了藏族各种传统节庆活动的精彩瞬间', '/static/albums/festivals_album.jpg', 850, 1),
('青海皮影戏剧照集', '2020', '马志强', '戏剧摄影师，专门拍摄传统戏剧', '收录了青海皮影戏的经典剧目和表演场景', '/static/albums/shadow_album.jpg', 620, 1),
('格萨尔史诗插图集', '2019', '扎西达杰', '藏族画家兼摄影师', '为格萨尔史诗创作的插图和相关文物照片', '/static/albums/gesar_album.jpg', 750, 1);

-- 2. 照片表数据
INSERT INTO photo (album_id, photo_url, photo_title, photo_desc, photographer, photo_date, view_count, created_by) VALUES
-- 热贡艺术精品集
(1, '/static/photos/regong/thangka1.jpg', '释迦牟尼佛唐卡', '精美的释迦牟尼佛唐卡，色彩鲜艳，线条流畅', '李明华', '2022-05-15', 320, 1),
(1, '/static/photos/regong/thangka2.jpg', '观音菩萨唐卡', '慈悲的观音菩萨形象，工艺精湛', '李明华', '2022-05-16', 280, 1),
(1, '/static/photos/regong/duixiu1.jpg', '堆绣作品《莲花生大师》', '立体感强烈的堆绣作品，层次丰富', '李明华', '2022-06-10', 250, 1),
(1, '/static/photos/regong/sculpture1.jpg', '木雕佛像', '精雕细琢的木雕佛像，神态庄严', '李明华', '2022-06-12', 200, 1),
-- 传承人风采
(2, '/static/photos/inheritors/cairang_work.jpg', '才让多杰在创作唐卡', '才让多杰正在专心致志地绘制唐卡', '王建国', '2021-08-20', 450, 1),
(2, '/static/photos/inheritors/nima_teach.jpg', '尼玛旺堆教授学生', '尼玛旺堆在传习所指导学生学习唐卡技艺', '王建国', '2021-08-22', 380, 1),
(2, '/static/photos/inheritors/zhuoma_dance.jpg', '卓玛央金表演热巴舞', '卓玛央金在节庆活动中表演热巴舞', '王建国', '2021-09-15', 350, 1),
(2, '/static/photos/inheritors/mafuxiang_shadow.jpg', '马福祥制作皮影', '马福祥在工作室制作皮影人物', '王建国', '2021-10-08', 280, 1),
-- 节庆活动
(3, '/static/photos/festivals/losar1.jpg', '藏历新年庆祝活动', '藏族同胞欢度藏历新年的热闹场面', '张雪梅', '2023-02-21', 520, 1),
(3, '/static/photos/festivals/shoton1.jpg', '雪顿节晒佛仪式', '雪顿节期间的传统晒佛仪式', '张雪梅', '2023-08-16', 480, 1),
(3, '/static/photos/festivals/dance_group.jpg', '集体热巴舞表演', '村民集体表演热巴舞的壮观场面', '张雪梅', '2023-07-10', 420, 1),
-- 皮影戏剧照
(4, '/static/photos/shadow/performance1.jpg', '《白蛇传》演现场', '青海皮影戏《白蛇传》的精彩演出', '马志强', '2020-11-15', 180, 1),
(4, '/static/photos/shadow/puppets1.jpg', '皮影人物展示', '精美的皮影人物造型展示', '马志强', '2020-11-16', 160, 1),
-- 格萨尔插图
(5, '/static/photos/gesar/illustration1.jpg', '格萨尔王出征图', '描绘格萨尔王出征场面的插图', '扎西达杰', '2019-09-20', 300, 1),
(5, '/static/photos/gesar/manuscript1.jpg', '格萨尔史诗手稿', '珍贵的格萨尔史诗藏文手稿', '扎西达杰', '2019-09-22', 280, 1);

-- 3. 音乐表数据
INSERT INTO music (music_title, artist, album_name, music_url, cover_image, duration, music_desc, related_project_id, view_count, created_by) VALUES
('热贡艺术赞歌', '才让多杰', '热贡之声', '/static/music/regong_praise.mp3', '/static/music/covers/regong_praise.jpg', '00:04:32', '赞美热贡艺术的传统歌曲，由传承人才让多杰演唱', 1, 680, 1),
('唐卡绘制工作歌', '尼玛旺堆', '画师心声', '/static/music/thangka_work.mp3', '/static/music/covers/thangka_work.jpg', '00:03:45', '唐卡画师在工作时常唱的传统歌曲', 2, 520, 1),
('安多热巴舞曲', '卓玛央金', '草原之舞', '/static/music/reba_dance.mp3', '/static/music/covers/reba_dance.jpg', '00:05:18', '配合安多热巴舞表演的传统音乐', 3, 750, 1),
('皮影戏配乐《白蛇传》', '马福祥', '皮影戏音乐集', '/static/music/shadow_baishe.mp3', '/static/music/covers/shadow_music.jpg', '00:06:20', '青海皮影戏《白蛇传》的传统配乐', 4, 420, 1),
('格萨尔史诗说唱', '扎西尼玛', '英雄史诗', '/static/music/gesar_epic.mp3', '/static/music/covers/gesar_epic.jpg', '00:12:35', '格萨尔史诗的传统说唱片段', 5, 890, 1),
('藏族民歌《阿妈拉》', '德吉措', '高原之声', '/static/music/ama_la.mp3', '/static/music/covers/ama_la.jpg', '00:04:15', 'raditional藏族民歌，表达对母亲的思念', NULL, 650, 1),
('青海花儿《上去高山望平川》', '韩起祥', '花儿集锦', '/static/music/huaer_gaoshang.mp3', '/static/music/covers/huaer.jpg', '00:03:52', '青海地区流传的经典花儿曲目', NULL, 580, 1);

-- 4. 视频表数据
INSERT INTO video (video_title, director, video_url, cover_image, duration, video_desc, related_project_id, view_count, created_by) VALUES
('热贡艺术纪录片', '李导演', '/static/videos/regong_documentary.mp4', '/static/videos/covers/regong_doc.jpg', '00:28:45', '全面介绍热贡艺术历史、技艺和传承的纪录片', 1, 1250, 1),
('唐卡绘制技艺展示', '王导演', '/static/videos/thangka_skills.mp4', '/static/videos/covers/thangka_skills.jpg', '00:15:30', '详细展示唐卡绘制的各个步骤和技巧', 2, 980, 1),
('安多热巴舞表演', '张导演', '/static/videos/reba_performance.mp4', '/static/videos/covers/reba_perf.jpg', '00:08:20', '精彩的安多热巴舞表演视频', 3, 850, 1),
('青海皮影戏《梁祝》', '马导演', '/static/videos/shadow_liangzhu.mp4', '/static/videos/covers/shadow_lz.jpg', '00:45:12', '青海皮影戏经典剧目《梁祝》完整演出', 4, 620, 1),
('格萨尔史诗说唱表演', '扎导演', '/static/videos/gesar_performance.mp4', '/static/videos/covers/gesar_perf.jpg', '00:35:18', '格萨尔史诗传承人的精彩说唱表演', 5, 1100, 1),
('青海非遗保护纪实', '陈导演', '/static/videos/heritage_protection.mp4', '/static/videos/covers/protection.jpg', '00:22:15', '记录青海非遗保护工作的纪实片', NULL, 780, 1);

-- 系统配置模块补充数据
-- 水印设置表补充数据
INSERT INTO watermark_setting (watermark_text, watermark_image, position, opacity, font_size, font_color, created_by) VALUES
('青海非遗数字博物馆', '/static/watermark/logo.png', 'bottom-right', 0.6, 14, '#FFFFFF', 1),
('版权所有 © 2023', NULL, 'bottom-left', 0.8, 12, '#000000', 1);

-- 系统配置表补充数据
INSERT INTO system_config (config_key, config_value, config_desc, created_by) VALUES
('site_logo', '/static/images/site_logo.png', '网站Logo图片路径', 1),
('site_favicon', '/static/images/favicon.ico', '网站图标路径', 1),
('contact_email', 'contact@qhheritage.cn', '联系邮箱', 1),
('contact_phone', '0971-1234567', '联系电话', 1),
('contact_address', '青海省西宁市城中区南关街1号', '联系地址', 1),
('max_upload_size', '10485760', '最大上传文件大小（字节）', 1),
('allowed_file_types', 'jpg,jpeg,png,gif,mp3,mp4,pdf,doc,docx', '允许上传的文件类型', 1),
('page_size', '20', '分页大小', 1),
('cache_expire_time', '3600', '缓存过期时间（秒）', 1),
('backup_frequency', '7', '数据备份频率（天）', 1);

-- 更新统计数据
-- 更新项目浏览量
UPDATE heritage_project SET view_count = view_count + FLOOR(RAND() * 100) WHERE id <= 5;

-- 更新传承人信息的浏览量
UPDATE heritage_inheritor SET view_count = FLOOR(RAND() * 500) + 100 WHERE id <= 5;

-- 添加一些操作日志
INSERT INTO operation_log (user_id, username, operation_module, operation_type, operation_desc, operation_url, operation_method, operation_param, operation_result, operation_ip) VALUES
(2, 'editor', '影集管理', '新增', '新增影集：热贡艺术精品集', '/api/resource/album', 'POST', '{"album_name":"热贡艺术精品集"}', '{"code":200,"msg":"操作成功"}', '192.168.1.101'),
(3, 'operator', '音乐管理', '新增', '新增音乐：热贡艺术赞歌', '/api/resource/music', 'POST', '{"music_title":"热贡艺术赞歌"}', '{"code":200,"msg":"操作成功"}', '192.168.1.102'),
(2, 'editor', '视频管理', '新增', '新增视频：热贡艺术纪录片', '/api/resource/video', 'POST', '{"video_title":"热贡艺术纪录片"}', '{"code":200,"msg":"操作成功"}', '192.168.1.101'),
(1, 'admin', '系统配置', '修改', '修改系统配置：网站Logo', '/api/config/system', 'PUT', '{"config_key":"site_logo"}', '{"code":200,"msg":"操作成功"}', '192.168.1.100'),
(4, 'analyst', '数据统计', '查询', '查询项目浏览统计', '/api/statistics/project', 'GET', '{}', '{"code":200,"data":[]}', '192.168.1.103');

-- 添加一些登录日志
INSERT INTO login_log (user_id, username, login_ip, login_location, browser, os, status, msg) VALUES
(2, 'editor', '192.168.1.101', '青海省西宁市', 'Chrome', 'Windows 11', 0, '登录成功'),
(3, 'operator', '192.168.1.102', '青海省西宁市', 'Firefox', 'Ubuntu', 0, '登录成功'),
(4, 'analyst', '192.168.1.103', '青海省西宁市', 'Safari', 'macOS', 0, '登录成功'),
(5, 'visitor', '192.168.1.104', '青海省海东市', 'Chrome', 'Android', 0, '登录成功'),
(1, 'admin', '192.168.1.100', '青海省西宁市', 'Edge', 'Windows 11', 0, '登录成功');

-- 提交事务
COMMIT;

-- 查询验证数据
SELECT '用户表' as table_name, COUNT(*) as record_count FROM user
UNION ALL
SELECT '角色表', COUNT(*) FROM role
UNION ALL
SELECT '权限表', COUNT(*) FROM permission
UNION ALL
SELECT '非遗项目表', COUNT(*) FROM heritage_project
UNION ALL
SELECT '传承人表', COUNT(*) FROM heritage_inheritor
UNION ALL
SELECT 'Banner表', COUNT(*) FROM banner
UNION ALL
SELECT '影集表', COUNT(*) FROM photo_album
UNION ALL
SELECT '照片表', COUNT(*) FROM photo
UNION ALL
SELECT '音乐表', COUNT(*) FROM music
UNION ALL
SELECT '视频表', COUNT(*) FROM video
UNION ALL
SELECT '文章表', COUNT(*) FROM article
UNION ALL
SELECT '访谈表', COUNT(*) FROM interview
UNION ALL
SELECT '课程表', COUNT(*) FROM course
UNION ALL
SELECT '课程章节表', COUNT(*) FROM course_chapter;