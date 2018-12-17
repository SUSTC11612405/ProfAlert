CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_creat_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prof_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `aptmt_prof_idx` (`prof_id`),
  KEY `appointment_student_idx` (`student_id`),
  CONSTRAINT `appointment_prof` FOREIGN KEY (`prof_id`) REFERENCES `prof_info` (`prof_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `appointment_student` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(30) NOT NULL,
  PRIMARY KEY (`department_id`)
)
CREATE TABLE `prof_info` (
  `prof_id` int(11) NOT NULL,
  `prof_name` varchar(20) NOT NULL,
  `prof_pic` varchar(100) NOT NULL,
  `prof_title` varchar(10) NOT NULL,
  `prof_email` varchar(30) NOT NULL,
  `prof_interest` text NOT NULL,
  `prof_search` text COMMENT 'search space',
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`prof_id`),
  KEY `department_id_idx` (`department_id`),
  CONSTRAINT `department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)
CREATE TABLE `student_info` (
  `student_id` int(11) NOT NULL,
  `student_name` varchar(20) NOT NULL,
  `student_sex` char(2) NOT NULL,
  `student_email` varchar(30) NOT NULL,
  `student_brief` text,
  PRIMARY KEY (`student_id`),
  KEY `student_user_id_idx` (`student_id`),
  CONSTRAINT `student_user_id` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) 
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password_hash` varchar(100) NOT NULL,
  `type` varchar(45) DEFAULT 'student',
  PRIMARY KEY (`id`)
)





INSERT INTO `prof_alert`.`prof_info` (`prof_id`, `prof_name`, `prof_pic`, `prof_title`, `prof_email`, `prof_interest`, `prof_search`, `department_id`) VALUES ('1', '张煜群', 'http://static.cse.sustc.edu.cn/upload/images/20170317/f08f2709a8253f993037fb40393163fc.jpg', '助理教授', 'zhangyq@sustc.edu.cn', '软件工程、服务计算', '软件工程、服务计算', '1');