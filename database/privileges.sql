SHOW GRANTS;

-- create users
CREATE USER 'login_read_user'@'localhost' IDENTIFIED BY 'rQbh2Umm4UqKk9X9';
CREATE USER 'login_info_rw_user'@'localhost' IDENTIFIED BY 'lQHt5dc4iFgqZyPm';
CREATE USER 'login_rw_user'@'localhost' IDENTIFIED BY 'Fl6QN2inUCTP3vzR';
CREATE USER 'login_del_user'@'localhost' IDENTIFIED BY 'YqJmhAw3pKDXqLAo';
CREATE USER 'login_new_user'@'localhost' IDENTIFIED BY 'lQDTy6Nnq6N4YQaa';

-- create roles
CREATE ROLE 'login_read', 'login_write',	'login_delete', 'login_info_read',
	'login_info_write', 'login_execute';
-- create role collections
CREATE ROLE 'login_rw', 'login_rd', 'login_info_rw', 'login_rwx';
	
-- drop roles
DROP ROLE 'login_read', 'login_write',	'login_delete', 'login_info_read',
	'login_info_write', 'login_execute';
DROP ROLE 'login_rw', 'login_rd', 'login_info_rw', 'login_rwx';

-- give permissions to roles
GRANT SELECT ON djdon_login.user TO 'login_read';
GRANT SELECT ON djdon_login.user_info TO 'login_read';
GRANT SELECT ON djdon_login.`group` TO 'login_read';

GRANT INSERT, UPDATE ON djdon_login.user TO 'login_write';
GRANT INSERT, UPDATE ON djdon_login.user_info TO 'login_write';

GRANT DELETE ON djdon_login.user TO 'login_delete';
GRANT DELETE ON djdon_login.user_info TO 'login_delete';

GRANT SELECT ON djdon_login.login_info TO 'login_info_read';
GRANT INSERT ON djdon_login.login_info TO 'login_info_write';

GRANT EXECUTE ON PROCEDURE djdon_login.new_user TO 'login_execute';

-- link roles to role collections
GRANT 'login_read' TO 'login_rw', 'login_rd', 'login_rwx';
GRANT 'login_write' TO 'login_rw';
GRANT 'login_delete' TO 'login_rd';
GRANT 'login_info_read' TO 'login_info_rw';
GRANT 'login_info_write' TO 'login_info_rw';
GRANT 'login_execute' TO 'login_rwx';

-- link users to roles
GRANT 'login_read' TO 'login_read_user'@'localhost';
GRANT 'login_rw' TO 'login_rw_user'@'localhost';
GRANT 'login_rd' TO 'login_del_user'@'localhost';
GRANT 'login_info_rw' TO 'login_info_rw_user'@'localhost';
GRANT 'login_rwx' TO 'login_new_user'@'localhost';


-- to activate roles when connecting
SET DEFAULT ROLE 'login_read' FOR 'login_read_user'@'localhost';
SET DEFAULT ROLE 'login_rw' FOR 'login_rw_user'@'localhost';
SET DEFAULT ROLE 'login_rd' FOR 'login_del_user'@'localhost';
SET DEFAULT ROLE 'login_info_rw' FOR 'login_info_rw_user'@'localhost';
SET DEFAULT ROLE 'login_rwx' FOR 'login_new_user'@'localhost';


FLUSH PRIVILEGES;