CREATE TABLE `releaseControls` (
	`id` int AUTO_INCREMENT NOT NULL,
	`name` varchar(120) NOT NULL,
	`cronExpression` varchar(40) NOT NULL DEFAULT '0 0 8 * * 5',
	`enabled` int NOT NULL DEFAULT 1,
	`scheduleCronTaskUid` varchar(65),
	`createdAt` timestamp NOT NULL DEFAULT (now()),
	`updatedAt` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `releaseControls_id` PRIMARY KEY(`id`),
	CONSTRAINT `releaseControls_name_unique` UNIQUE(`name`)
);
