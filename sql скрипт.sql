CREATE TABLE IF NOT EXISTS `Client` (
	`client_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`name` varchar(255) NOT NULL,
	`phone` int NOT NULL,
	`email` varchar(255) NOT NULL,
	`birth_date` date NOT NULL,
	PRIMARY KEY (`client_id`)
);

CREATE TABLE IF NOT EXISTS `Employee` (
	`employee_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`name` varchar(255) NOT NULL,
	`specialization` varchar(255) NOT NULL,
	`schedule` datetime NOT NULL,
	PRIMARY KEY (`employee_id`)
);

CREATE TABLE IF NOT EXISTS `Service` (
	`service_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`name` int NOT NULL,
	`duration` int NOT NULL,
	`price` float NOT NULL,
	PRIMARY KEY (`service_id`)
);

CREATE TABLE IF NOT EXISTS `Appointment` (
	`appointment_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`client_id` int NOT NULL,
	`service_id` int NOT NULL,
	`employee_id` int NOT NULL,
	`datetime` datetime NOT NULL,
	`status` varchar(255) NOT NULL,
	PRIMARY KEY (`appointment_id`)
);

CREATE TABLE IF NOT EXISTS `Payments` (
	`payment_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`amount` decimal(10,0) NOT NULL,
	`appointment_id` int NOT NULL UNIQUE,
	`payment_method` int NOT NULL,
	`patment_date` date NOT NULL,
	PRIMARY KEY (`payment_id`)
);

CREATE TABLE IF NOT EXISTS `Admin_users` (
	`admin_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`username` varchar(255) NOT NULL UNIQUE,
	`password_hash` varchar(255) NOT NULL,
	`role` int NOT NULL,
	PRIMARY KEY (`admin_id`)
);

CREATE TABLE IF NOT EXISTS `reviews` (
	`review_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`client_id` int NOT NULL,
	`employee` int NOT NULL,
	`service_id` int NOT NULL,
	`rating` int NOT NULL,
	`comment_text` varchar(255) NOT NULL,
	`review_date` date NOT NULL,
	PRIMARY KEY (`review_id`)
);




ALTER TABLE `Appointment` ADD CONSTRAINT `Appointment_fk1` FOREIGN KEY (`client_id`) REFERENCES `Client`(`client_id`);

ALTER TABLE `Appointment` ADD CONSTRAINT `Appointment_fk2` FOREIGN KEY (`service_id`) REFERENCES `Service`(`service_id`);

ALTER TABLE `Appointment` ADD CONSTRAINT `Appointment_fk3` FOREIGN KEY (`employee_id`) REFERENCES `Employee`(`employee_id`);
ALTER TABLE `Payments` ADD CONSTRAINT `Payments_fk2` FOREIGN KEY (`appointment_id`) REFERENCES `Appointment`(`appointment_id`);

ALTER TABLE `reviews` ADD CONSTRAINT `reviews_fk1` FOREIGN KEY (`client_id`) REFERENCES `Client`(`client_id`);

ALTER TABLE `reviews` ADD CONSTRAINT `reviews_fk2` FOREIGN KEY (`employee`) REFERENCES `Employee`(`employee_id`);

ALTER TABLE `reviews` ADD CONSTRAINT `reviews_fk3` FOREIGN KEY (`service_id`) REFERENCES `Service`(`service_id`);