/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  kirill
 * Created: Dec 27, 2016
 */

drop database if exists familyfinance;

create database familyfinance;

create table familyfinance.users (

    username varchar(255) not null,
    password varchar(255) default null,

	primary key (username)
);


CREATE TABLE familyfinance.groups 
(
   ID int NOT NULL AUTO_INCREMENT,
   NAME varchar(50) NOT NULL,
   DESCRIPTION varchar(300),
   
   primary key (ID)
)
;

CREATE TABLE familyfinance.groups_users 
(
  GROUPS_ID int NOT NULL,
  user_name varchar(45) NOT NULL
);



ALTER TABLE familyfinance.groups_users
ADD CONSTRAINT FK_users_groups_users
FOREIGN KEY (user_name)
REFERENCES familyfinance.users(username)
;

ALTER TABLE familyfinance.groups_users
ADD CONSTRAINT FK_groups_groups_users
FOREIGN KEY (GROUPS_ID)
REFERENCES familyfinance.groups(ID)
;
CREATE INDEX SQL_PERSONGROUPS_USERNAME_INDEX ON familyfinance.users(username)
;
CREATE INDEX SQL_PERSONGROUPS_ID_INDEX ON familyfinance.groups(ID)
;


-- create users groups

INSERT INTO familyfinance.users VALUES ('admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');
-- 'jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=');
INSERT INTO familyfinance.users VALUES ('test', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08');
-- 'n4bQgYhMfWWaL+qgxVrQFaO/TxsrC4Is0V1sFbDwCgg=');
INSERT INTO familyfinance.users VALUES ('keks', '131a2649814b20a0508fcf0d46dd42b4f4260c888f3847f646b0011ea6ad6899');
-- 'jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=');

-- create groups
insert into familyfinance.groups (NAME, DESCRIPTION) values ('admin', 'admins group');
insert into familyfinance.groups (NAME, DESCRIPTION) values ('user', 'users group');

-- insert users and groups in same table
insert into familyfinance.groups_users values (1, 'admin');
insert into familyfinance.groups_users values (2, 'test');
insert into familyfinance.groups_users values (2, 'keks');

-- //////////////////////////////////////////////////////

drop database if exists familyfinance;

create database familyfinance;

create table familyfinance.users (
    username varchar(255) not null,
    password varchar(255) default null,

	primary key (username)
);

create table familyfinance.groups (
	
    groupname varchar(255) not null,
    description varchar(255) default null
    
        primary key (groupname)
);

create table familyfinance.users_groups (
	
    groupname varchar(255) not null,
    username varchar(255) not null
    
);


create index u_g_u_FK ON familyfinance.groups(username ASC);
create index u_g_g_FK ON familyfinance.groups(username ASC);

ALTER TABLE familyfinance.users_groups
ADD CONSTRAINT FK_users_groups_users
FOREIGN KEY (username)
REFERENCES familyfinance.users(username)
;

ALTER TABLE familyfinance.users_groups
ADD CONSTRAINT FK_users_groups_groups
FOREIGN KEY (groupname)
REFERENCES familyfinance.groups(groupname)
;


INSERT INTO familyfinance.users VALUES ('admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');
-- 'jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=');
INSERT INTO familyfinance.users VALUES ('test', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08');
-- 'n4bQgYhMfWWaL+qgxVrQFaO/TxsrC4Is0V1sFbDwCgg=');
INSERT INTO familyfinance.users VALUES ('keks', '131a2649814b20a0508fcf0d46dd42b4f4260c888f3847f646b0011ea6ad6899');
-- 'jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=');

-- create groups
insert into familyfinance.groups (NAME, DESCRIPTION) values ('admin', 'admins group');
insert into familyfinance.groups (NAME, DESCRIPTION) values ('user', 'users group');

-- insert users and groups in same table
insert into familyfinance.groups_users values (1, 'admin');
insert into familyfinance.groups_users values (2, 'test');
insert into familyfinance.groups_users values (2, 'keks');