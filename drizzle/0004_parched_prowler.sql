CREATE TABLE `landingPageContentRevisions` (
	`id` int AUTO_INCREMENT NOT NULL,
	`contentId` int NOT NULL,
	`revision` int NOT NULL,
	`content` text NOT NULL,
	`savedBy` varchar(64),
	`createdAt` timestamp NOT NULL DEFAULT (now()),
	CONSTRAINT `landingPageContentRevisions_id` PRIMARY KEY(`id`)
);
