insert into test (id,name) values (2 , 'summer');


drop table if exists `chapter`;
create table `chapter` (
    `id` char(8) not null comment 'ID',
    `course_id` char(8) comment '课程ID',
    `name` varchar(50) comment '名称',
    primary key(`id`)
)engine=innodb default charset=utf8mb4 comment='大章';


insert into chapter values ('00000000','00000001','测试第一章');
insert into chapter values ('00000001','00000001','测试第一章');
insert into chapter values ('00000003','00000001','测试第一章');
insert into chapter values ('00000004','00000001','测试第一章');
insert into chapter values ('00000005','00000001','测试第一章');
insert into chapter values ('00000006','00000001','测试第一章');
insert into chapter values ('00000007','00000001','测试第一章');
insert into chapter values ('00000008','00000001','测试第一章');
insert into chapter values ('00000009','00000001','测试第一章');
insert into chapter values ('00000010','00000001','测试第一章');
insert into chapter values ('00000011','00000001','测试第一章');
insert into chapter values ('00000012','00000001','测试第一章');


drop table if exists `section`;
create table `section` (
    `id` char(8) not null default '' comment 'ID',
    `title` varchar(50) not null comment '标题',
    `course_id` char(8) comment '课程|course.id',
    `chapter_id` char(8) comment '大章|chapter.id',
    `video` char(200) comment '视频',
    `time` int comment '时长|单位秒',
    `charge` char(1) comment '收费|C 收费;F 免费',
    `sort` int comment '顺序',
    `created_at` DATETIME(3) comment '创建时间',
    `updated_at` datetime(3) comment '修改时间',
    primary key (`id`)
)engine=innodb default charset=utf8mb4 comment='小节';

insert into `section` (id, title, course_id, chapter_id, video, time, charge, sort, created_at, updated_at)
values ('00000001','测试小节01','00000001','00000000','',500,'F',1,now(),now());
