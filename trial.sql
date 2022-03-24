CREATE database input1;

USE input1;

CREATE TABLE `basketballteams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `height` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`)
);

INSERT INTO `basketballteams` (name, height, age) VALUES ('Alice', 171, 18);
INSERT INTO `basketballteams` (name, height, age) VALUES ('Bob', 180, 17);
INSERT INTO `basketballteams` (name, height, age) VALUES ('Carol', 183, 19);
INSERT INTO `basketballteams` (name, height, age) VALUES ('Dave', 167, 21);
INSERT INTO `basketballteams` (name, height, age) VALUES ('Ellen', 177, 20);
INSERT INTO `basketballteams` (name, height, age) VALUES ('Frank', 174, 20);
INSERT INTO `basketballteams` (name, height, age) VALUES ('Masutaka', 230, 89);

CREATE TABLE `allstars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `height` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`)
);
