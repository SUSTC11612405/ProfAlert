CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_creat_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prof_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `prof_id_idx` (`prof_id`),
  KEY `student_id_idx` (`student_id`),
  CONSTRAINT `prof_id` FOREIGN KEY (`prof_id`) REFERENCES `prof_info` (`prof_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(30) NOT NULL,
  PRIMARY KEY (`department_id`)
)
CREATE TABLE `prof_info` (
  `prof_id` int(11) NOT NULL AUTO_INCREMENT,
  `prof_name` varchar(20) NOT NULL,
  `prof_pic` varchar(100) DEFAULT NULL,
  `prof_title` varchar(10) DEFAULT NULL,
  `prof_email` varchar(30) NOT NULL,
  `prof_interest` text,
  `department_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`prof_id`),
  KEY `department_id_idx` (`department_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(20) NOT NULL,
  `student_sex` char(2) NOT NULL,
  `student_email` varchar(30) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `student_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password_hash` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
)