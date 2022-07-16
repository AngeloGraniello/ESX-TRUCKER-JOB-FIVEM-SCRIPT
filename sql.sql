USE `your-database-name`;

INSERT INTO `jobs` (`name`, `label`) VALUES
('trucker', 'Trucker');

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('trucker', 0, 'employee', 'Employee', 200, '{}', '{}');