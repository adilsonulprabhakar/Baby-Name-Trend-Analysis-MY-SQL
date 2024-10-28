DROP SCHEMA IF EXISTS baby_names_db;
CREATE SCHEMA baby_names_db;
USE baby_names_db;

--
-- Table structure for table `names`
--

CREATE TABLE names (
  State CHAR(2),
  Gender CHAR(1),
  Year INT,
  Name VARCHAR(45),
  Births INT);

--
-- Table structure for table `regions`
--

CREATE TABLE regions (
  State CHAR(2),
  Region VARCHAR(45));

--
-- Insert data into table names
--

/* Launch mysql in your Terminal (Mac) / Command Prompt (PC)
Update root with your username and password (root is the default username without a password)
Update '/Users/alice/Desktop/names_data.csv' with the location of the names_data.csv on your computer

> mysql -u root

> USE baby_names_db;

> LOAD DATA LOCAL INFILE '/Users/alice/Desktop/names_data.csv'
INTO TABLE names
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

If you get the following error:
ERROR 3948 (42000): Loading local data is disabled; this must be enabled on both the client and server sides

Run the following and then run commands above again.

> SET GLOBAL local_infile=true;

> quit;

*/

--
-- Insert data into table regions
--

INSERT INTO regions VALUES ('AL', 'South'),
('AK', 'Pacific'),
('AZ', 'Mountain'),
('AR', 'South'),
('CA', 'Pacific'),
('CO', 'Mountain'),
('CT', 'New_England'),
('DC', 'Mid_Atlantic'),
('DE', 'South'),
('FL', 'South'),
('GA', 'South'),
('HI', 'Pacific'),
('ID', 'Mountain'),
('IL', 'Midwest'),
('IN', 'Midwest'),
('IA', 'Midwest'),
('KS', 'Midwest'),
('KY', 'South'),
('LA', 'South'),
('ME', 'New_England'),
('MD', 'South'),
('MA', 'New_England'),
('MN', 'Midwest'),
('MS', 'South'),
('MO', 'Midwest'),
('MT', 'Mountain'),
('NE', 'Midwest'),
('NV', 'Mountain'),
('NH', 'New England'),
('NJ', 'Mid_Atlantic'),
('NM', 'Mountain'),
('NY', 'Mid_Atlantic'),
('NC', 'South'),
('ND', 'Midwest'),
('OH', 'Midwest'),
('OK', 'South'),
('OR', 'Pacific'),
('PA', 'Mid_Atlantic'),
('RI', 'New_England'),
('SC', 'South'),
('SD', 'Midwest'),
('TN', 'South'),
('TX', 'South'),
('UT', 'Mountain'),
('VT', 'New_England'),
('VA', 'South'),
('WA', 'Pacific'),
('WV', 'South'),
('WI', 'Midwest'),
('WY', 'Mountain');
