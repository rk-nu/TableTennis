CREATE SCHEMA `pingpong` ;


CREATE TABLE pingpong.`player` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`playerName` VARCHAR(50) NOT NULL,
	`win` INT DEFAULT '0',
	`loss` INT DEFAULT '0'
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


insert into pingpong.player  values(1,"Ram", 0 , 0);
insert into pingpong.player  values(2,"Bert", 3 , 1);
insert into pingpong.player  values(3,"Shital", 2 , 2);
insert into pingpong.player  values(4,"Emma", 1 , 0);
insert into pingpong.player  values(5,"Matt", 4 , 3);
