# Base de données Discovery - Mars 2016
use galaxia;
ALTER TABLE `user` ADD `lastImg` VARCHAR(255) NOT NULL AFTER `password`;
ALTER TABLE `user` ADD `lastImgGalaxie` VARCHAR(255) NOT NULL AFTER `lastImg`;
ALTER TABLE `user` ADD `lastImgDate` VARCHAR(255) NOT NULL AFTER `lastImgGalaxie`;
ALTER TABLE `user` ADD `lastImgPos` INT(4) NOT NULL AFTER `lastImgDate`;