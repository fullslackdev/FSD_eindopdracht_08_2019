DROP PROCEDURE IF EXISTS new_user;
DELIMITER $$
CREATE PROCEDURE new_user(
	IN group_name VARCHAR(50),
	IN user_username VARCHAR(40),
	IN user_password VARCHAR(200),
	IN info_firstname VARCHAR(50),
	IN info_lastname VARCHAR(50),
	IN info_country CHAR(2),
	IN info_email VARCHAR(100),
	IN info_validation VARCHAR(100),
	OUT success BOOLEAN)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK; -- rollback any error in the transaction
		SET success = FALSE;
		-- RESIGNAL; -- use for debug only, else output variable will not be set correctly
	END;
	
	START TRANSACTION;	
		SET @GroupID = (SELECT id FROM `group` WHERE `name` = group_name);
		INSERT INTO user (group_id, username, password, active)
			VALUES (@GroupID, user_username, user_password, 1);
		SET @UserID = LAST_INSERT_ID();
		INSERT INTO user_info (user_id, firstname, lastname, country, email, `validation`)
			VALUES (@UserID, info_firstname, info_lastname, info_country, info_email, info_validation);
		SET success = TRUE;
	COMMIT; -- if either inserts fails then this will not be executed
END$$
DELIMITER ;