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
