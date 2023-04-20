CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` int(11) NOT NULL COMMENT '0=admin;1=teacher;2=student',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `user` (`account`, `password`, `username`, `phone`, `role`)
VALUES
  ('1000001','123456','admin','13145678901',0),
  ('2000001','1234567','teacher','13145678902',0),
  ('3000001','12345678','student','13145678903',0)