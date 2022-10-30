-- drop database if exists roofBlanket;

-- create database if not exists roofBlanket;

-- use roofBlanket;

drop table if exists homelessCollection;
CREATE TABLE if not exists `homelessCollection` (
    `id` int(11) NOT NULL,
    `name` varchar(256) NOT NULL,
    `age` int(11) NOT NULL,
    `gender` varchar(1) NOT NULL,
    `contact` int(8),
    `location` varchar(256) NOT NULL, 
    `special_needs` BOOLEAN NOT NULL,  
    `duration` int(12) NOT NULL,
    `description` varchar(1000) NOT NULL,
    `photo_url` varchar(1000) NOT NULL,
    `employment` BOOLEAN NOT NULL,
    `education` varchar(100),
    `skills` varchar(1000),
    `employment_desc` varchar(1000),
    `completed` BOOLEAN NOT NULL,
    `time_created` DATETIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dummy Data for Homeless People
insert into homelessCollection values (1001,'Darren Kim',47,'M',null,'Singapore Management University',0,6,'Wears a striped shirt and carries a newspaper and red trolley around. Can be seen in the stretch in basement to LKC','http://localhost/krazypeople/photos/men/man2.jpg',1,'','','',0,'2022-10-29 15:00:00');
insert into homelessCollection values (1002,'Geneva Tan',32,'F',null,'Ngee Ann City',1,4,'She likes to sing a lot', 'http://localhost/krazypeople/photos/men/man2.jpg',1,'','','',1,'2022-10-29 15:20:00');
insert into homelessCollection values (1003,'Ronald McDonald',30,'M',null,'Rochor Road',0,5,'Very nice guy, will take the intiative to talk to you when you are near him', 'http://localhost/krazypeople/photos/men/man2.jpg',1,'','','',0,'2022-10-29 15:40:00');
insert into homelessCollection values (1004,'Kentucky Lim',52,'M',null,'Changi Beach',0,3,'He is a very nice man. I interacted with him but he takes awhile to reply. He keeps smiling and i believe he carries around a lanyard saying that he has special needs.','http://localhost/krazypeople/photos/men/man2.jpg',1,'','','',0,'2022-10-29 16:00:00');
insert into homelessCollection values (1005,'Angeline Tan',45,'F',null,'National University of Singapore',1,8,'She is seen frequently at the outside the science faculty wearing grey shirt with a trolley','http://localhost/krazypeople/photos/men/man2.jpg',1,'','','',1,'2022-10-29 16:20:00');
insert into homelessCollection values (1006,'Arnold Chen',35,'M',null,'Bedok North Street 4',0,11,'He is always at the void deck with a white singlet','http://localhost/krazypeople/photos/men/man2.jpg',1,'','','',1,'2022-10-29 16:40:00');

drop table if exists usersCollection;
CREATE TABLE if not exists `usersCollection` (
    `id` int(11) NOT NULL,
    `username` varchar(30) NOT NULL,
    `password` varchar(30) NOT NULL,
    `email` varchar(256) NOT NULL,
    `name` varchar(256) NOT NULL,
    `contact` int(8),
    `address` varchar(256),
    `housing_type` varchar(256),
    `num_homeless_attached` int(8),
    `num_homeless_helped` int(8),
    `employer_status` BOOLEAN, # 0 for normal users, 1 for goodwill hosts, 3 for employer,
    `time_created` DATETIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into usersCollection values(10001, 'charliemike9021', 'armyboyz21', 'cahr@gmail.com', 'Charlie', '98765432', 'yishun', '1 room HDB', '0', '2', 3,'2022-10-29 17:00:00');
insert into usersCollection values(10005,  'weiweiwei1001z' ,'purplec0W', 'wei@gmail.com', 'Wei Wei', '92837465', 'Orchard', '5 room HDB', '1', '0', 0,'2022-10-29 17:20:00');
insert into usersCollection values(20001, 'sl3episg00dd' ,'bambii00!', 'sleep@gmail.com', 'Good Sleep', '87456376', 'Bugis', '4 room HDB', '1', '1', 0,'2022-10-29 17:40:00');
insert into usersCollection values(20005,  'slayslayslay29','OslayMG', 'slay@gmail.com', 'Slay Slay', '96775883', 'Jurong', '4 room HDB', '0', '1', 1,'2022-10-29 18:00:00');
insert into usersCollection values(20006, 'lim', 'lim', 'lim@lim.com', 'lim', null, '', '', null, null, 0,'2022-10-29 19:00:00');

# homelessCollection (id, name, age, gender, contact, location, special_needs, duration, description, photo_url, employment, education, skills, employment_desc, completed)
# usersCollection (id, username, password, email, name, contact, address, housing_type, num_homeless_attached, num_homeless_helped, employer_status)

drop table if exists chatCollection;
CREATE TABLE if not exists `chatCollection` (
    `sender_id` int(11) NOT NULL,
    `receiver_id` int(11) NOT NULL,
    `message` varchar(1000) NOT NULL,
    `sent_datetime` DATETIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into chatCollection values(10001, 10005, "Hello, I would like to interview the individual under your care for a job.", '2022-10-29 17:00:00');
insert into chatCollection values(10005, 10001, "Hi, sure thing, send me your company location and I'll let him know.", '2022-10-29 17:05:00');
insert into chatCollection values(10001, 10005, "Great! The interview will be on 1 November 2022 at SMU.", '2022-10-29 17:07:00');
insert into chatCollection values(10005, 10001, "He'll be there!", '2022-10-29 17:15:00');