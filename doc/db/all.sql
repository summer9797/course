insert into test (id,name) values (2 , 'summer')

create table `chapter` (
    `id` char(8) not null comment 'ID',
    `course_id` char(8) comment '课程ID',
    `name` varchar(50) comment '课程名',
    primary key(`id`)
)engine=innodb default charset=utf8mb4 comment='大章';
