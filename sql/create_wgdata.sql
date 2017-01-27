-- CAUTION!! THIS QUERY WIPES OUT TABLES AND THUS DESTROYS ALL YOUR HARD WORK FROM BEFORE!
-- You will have to reload ALL the outcomes using the create_analysis.sql query again for
-- all previous analyses!

-- To generate a data set, run this query, then run:
-- Documents/hea_baselines/south_africa/baseline_surveys/2015_lp/sql/insert_wgdata.sql
-- then:
-- Documents/hea_analysis/south_africa/2015.08.lp/sql/create_analysis_data.sql
-- then:
-- Documents/hea_analysis/south_africa/2015.08.lp/sql/insert_analysis_data.sql
-- then you're good to go! Analyse!

-- DROPPING old tables: oooo, nasty!
DROP TABLE IF EXISTS zaf.tbl_ofa_results;
DROP TABLE IF EXISTS zaf.tbl_wgs;
DROP TABLE IF EXISTS zaf.tbl_livezones_list_all;
DROP TABLE IF EXISTS zaf.tbl_wg_names;

-- New tables to come in make things nice again
-- First up is a list of Wealth Group Names
CREATE TABLE zaf.tbl_wg_names (
	tid SERIAL PRIMARY KEY,
	wg_name VARCHAR(64),
	ord_num INTEGER
);


-- Add in the four usual names of 'very poor', 'poor', 'middle' and 'better off';
-- 'Very poor' first
INSERT INTO zaf.tbl_wg_names (
	wg_name,
	ord_num
)
VALUES (
	'Very poor', 
	10
);

-- Then 'Poor'
INSERT INTO zaf.tbl_wg_names (
	wg_name,
	ord_num
)
VALUES (
	'Poor', 
	20
);

-- Then 'Middle'
INSERT INTO zaf.tbl_wg_names (
	wg_name,
	ord_num
)
VALUES (
	'Middle', 
	30
);

-- And finally, 'Better off'
INSERT INTO zaf.tbl_wg_names (
	wg_name,
	ord_num
)
VALUES (
	'Better off', 
	40
);


-- Create a table that lists all livelihood zones from the the livezones_rural and livezones_urban
-- geometry tables
CREATE TABLE zaf.tbl_livezones_list_all (
	lz_code INTEGER PRIMARY KEY,
	lz_abbrev VARCHAR(5),
	lz_name VARCHAR(254),
	features INTEGER
);

INSERT INTO	zaf.tbl_livezones_list_all (
	lz_code,
	lz_abbrev,
	lz_name,
	features
)
SELECT
	f.lz_code,
	f.lz_abbrev,
	f.lz_name,
	Count(lz_code)
FROM (
	SELECT
		lz_code,
		lz_abbrev,
		lz_name
	FROM
		zaf.livezones_rural
	UNION SELECT
		lz_code,
		lz_abbrev,
		lz_name
	FROM
		zaf.livezones_urban
) AS f
GROUP BY
	lz_code,
	lz_abbrev,
	lz_name
;


-- Create a table of wealth groups with information on percentages (wealth breakdown) and household sizes
CREATE TABLE zaf.tbl_wgs (
	tid SERIAL PRIMARY KEY,
	lz_code INTEGER REFERENCES zaf.tbl_livezones_list_all (lz_code),
	wg_name_id INTEGER REFERENCES zaf.tbl_wg_names (tid),
	pc_wg NUMERIC,
	hh_size INTEGER
);

-- When all is done, display a list of livelihood zones, with wealth groups (where defined--i.e. where baselines ahve been done)
SELECT * FROM zaf.tbl_livezones_list_all AS f INNER JOIN (zaf.tbl_wgs AS g INNER JOIN zaf.tbl_wg_names AS h ON g.wg_name_id = h.tid) ON f.lz_code = g.lz_code;