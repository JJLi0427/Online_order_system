CREATE TABLE `Menu` (
  `dish_id` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`dish_id`) USING HASH,
  UNIQUE KEY `dish_name` (`dish_name`) USING HASH
);

CREATE TABLE `User` (
  `user_id` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `phone` bigint(11) NOT NULL,
  `table` int(2) DEFAULT NULL,
  `people` int(2) DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING HASH,
  KEY `phone` (`phone`) USING HASH
);

CREATE TABLE `Orders` (
  `order_id` bigint(12) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `prefer` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL,
  `dish_list` text NOT NULL,
  `user_id` int(8) unsigned NOT NULL,
  `complete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`) USING HASH,
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `Staff` (
  `staff_id` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(255) NOT NULL,
  `order_id` bigint(12) unsigned DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`staff_id`) USING HASH,
  UNIQUE KEY `order_id` (`order_id`) USING HASH,
  CONSTRAINT `Staff_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE VIEW OrderDetails AS
SELECT 
  Orders.order_id,
  Orders.prefer,
  Orders.time,
  Orders.dish_list,
  Orders.user_id,
  Orders.complete,
  User.phone,
  User.table
FROM 
  Orders
JOIN 
  User ON Orders.user_id = User.user_id;

DELIMITER //
CREATE PROCEDURE DeleteOldOrders()
BEGIN
    DELETE FROM Orders 
    WHERE `time` < DATE_SUB(NOW(), INTERVAL 3 MONTH);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER staff_name_before_insert
BEFORE INSERT ON Staff
FOR EACH ROW
BEGIN
  DECLARE original_name VARCHAR(255);
  DECLARE count_name INT;
  DECLARE new_name VARCHAR(255);

  SET original_name = NEW.staff_name;
  SET count_name = (SELECT COUNT(*) FROM Staff WHERE staff_name LIKE CONCAT(original_name, '%'));

  IF count_name > 0 THEN
    SET new_name = CONCAT(original_name, count_name);
    SET NEW.staff_name = new_name;
  END IF;
END;
//
DELIMITER ;