CREATE TABLE `landingPageContent` (
	`id` int AUTO_INCREMENT NOT NULL,
	`contentKey` varchar(120) NOT NULL,
	`draftContent` text NOT NULL,
	`publishedContent` text NOT NULL,
	`revision` int NOT NULL DEFAULT 1,
	`updatedBy` varchar(64),
	`createdAt` timestamp NOT NULL DEFAULT (now()),
	`updatedAt` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `landingPageContent_id` PRIMARY KEY(`id`),
	CONSTRAINT `landingPageContent_contentKey_unique` UNIQUE(`contentKey`)
);
