	ALTER TABLE `spmsdb`.`MEMBERS` 
	ADD COLUMN `EMAIL` VARCHAR(45) NULL AFTER `PWD`,
	ADD COLUMN `ADDRESS` VARCHAR(255) NULL AFTER `EMAIL`;