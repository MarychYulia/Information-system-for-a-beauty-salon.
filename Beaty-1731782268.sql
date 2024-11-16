CREATE TABLE IF NOT EXISTS `Customer` (
	`customer_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`name` varchar(255) NOT NULL,
	`phone` int NOT NULL,
	`email` varchar(255) NOT NULL,
	PRIMARY KEY (`customer_id`)
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
	`customer_id` int NOT NULL,
	`service_id` int NOT NULL,
	`employee_id` int NOT NULL,
	`datetime` datetime NOT NULL,
	`status` varchar(255) NOT NULL,
	PRIMARY KEY (`appointment_id`)
);




ALTER TABLE `Appointment` ADD CONSTRAINT `Appointment_fk1` FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`customer_id`);

ALTER TABLE `Appointment` ADD CONSTRAINT `Appointment_fk2` FOREIGN KEY (`service_id`) REFERENCES `Service`(`service_id`);

ALTER TABLE `Appointment` ADD CONSTRAINT `Appointment_fk3` FOREIGN KEY (`employee_id`) REFERENCES `Employee`(`employee_id`);