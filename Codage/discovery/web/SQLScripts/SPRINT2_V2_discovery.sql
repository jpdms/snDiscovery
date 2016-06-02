# Base de données Discovery - Mars 2016
use galaxia;
ALTER TABLE `user` ADD `mailconfirme` VARCHAR(255) NOT NULL AFTER `password`;
UPDATE `user` SET `mailconfirme` = 'ok' WHERE `user`.`pseudo` != 'xqfzdefq'