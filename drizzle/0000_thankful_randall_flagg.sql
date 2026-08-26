CREATE TABLE `editionSources` (
	`id` int AUTO_INCREMENT NOT NULL,
	`editionId` int NOT NULL,
	`title` varchar(240) NOT NULL,
	`url` text NOT NULL,
	`publisher` varchar(180),
	`accessedAt` timestamp NOT NULL DEFAULT (now()),
	`note` text,
	CONSTRAINT `editionSources_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `editions` (
	`id` int AUTO_INCREMENT NOT NULL,
	`issueNumber` int NOT NULL,
	`slug` varchar(160) NOT NULL,
	`title` varchar(220) NOT NULL,
	`subtitle` text NOT NULL,
	`status` enum('draft','scheduled','published','archived') NOT NULL DEFAULT 'draft',
	`releaseAt` timestamp,
	`publishedAt` timestamp,
	`previewUrl` text,
	`completeUrl` text,
	`previewPages` int,
	`completePages` int,
	`masthead` varchar(120) NOT NULL DEFAULT 'CAREER WEEKLY · A SIGNRL PUBLICATION',
	`summary` text NOT NULL,
	`scheduleCronTaskUid` varchar(65),
	`createdAt` timestamp NOT NULL DEFAULT (now()),
	`updatedAt` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `editions_id` PRIMARY KEY(`id`),
	CONSTRAINT `editions_issueNumber_unique` UNIQUE(`issueNumber`),
	CONSTRAINT `editions_slug_unique` UNIQUE(`slug`)
);
--> statement-breakpoint
CREATE TABLE `users` (
	`id` int AUTO_INCREMENT NOT NULL,
	`openId` varchar(64) NOT NULL,
	`name` text,
	`email` varchar(320),
	`loginMethod` varchar(64),
	`role` enum('user','admin') NOT NULL DEFAULT 'user',
	`createdAt` timestamp NOT NULL DEFAULT (now()),
	`updatedAt` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	`lastSignedIn` timestamp NOT NULL DEFAULT (now()),
	CONSTRAINT `users_id` PRIMARY KEY(`id`),
	CONSTRAINT `users_openId_unique` UNIQUE(`openId`)
);
