CREATE TABLE `Student` (
  `id` int PRIMARY KEY,
  `user_id` int NOT NULL,
  `credit` float
);

CREATE TABLE `Product` (
  `id` int PRIMARY KEY,
  `name` varchar(255),
  `price` float,
  `available` boolean
);

CREATE TABLE `Transaction` (
  `id` int PRIMARY KEY,
  `student_id` int,
  `product_id` int,
  `date` datetime
);

CREATE TABLE `auth_user` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(150) UNIQUE NOT NULL,
  `first_name` varchar(150),
  `last_name` varchar(150),
  `email` varchar(254) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` boolean NOT NULL DEFAULT false,
  `is_active` boolean NOT NULL DEFAULT true,
  `is_superuser` boolean NOT NULL DEFAULT false,
  `date_joined` datetime NOT NULL,
  `last_login` datetime
);

CREATE TABLE `auth_group` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(150) UNIQUE NOT NULL
);

CREATE TABLE `auth_user_groups` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
);

CREATE TABLE `auth_permission` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `codename` varchar(100) NOT NULL,
  `content_type_id` int NOT NULL
);

CREATE TABLE `auth_user_user_permissions` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
);

CREATE TABLE `auth_group_permissions` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
);

ALTER TABLE `Student` ADD FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `Transaction` ADD FOREIGN KEY (`student_id`) REFERENCES `Student` (`id`);

ALTER TABLE `Transaction` ADD FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`);

ALTER TABLE `auth_user_groups` ADD FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `auth_user_groups` ADD FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

ALTER TABLE `auth_user_user_permissions` ADD FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `auth_user_user_permissions` ADD FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

ALTER TABLE `auth_group_permissions` ADD FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

ALTER TABLE `auth_group_permissions` ADD FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

ALTER TABLE `auth_user` ADD FOREIGN KEY (`id`) REFERENCES `auth_user` (`username`);
