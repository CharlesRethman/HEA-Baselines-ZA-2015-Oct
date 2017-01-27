INSERT INTO zaf.tbl_wgs (lz_code, wg_name_id, pc_wg, hh_size) VALUES (59202, 1, 0.40, 5);
INSERT INTO zaf.tbl_wgs (lz_code, wg_name_id, pc_wg, hh_size) VALUES (59202, 2, 0.34, 6);
INSERT INTO zaf.tbl_wgs (lz_code, wg_name_id, pc_wg, hh_size) VALUES (59202, 3, 0.18, 6);
INSERT INTO zaf.tbl_wgs (lz_code, wg_name_id, pc_wg, hh_size) VALUES (59202, 4, 0.08, 5);

INSERT INTO zaf.tbl_wgs (lz_code, wg_name_id, pc_wg, hh_size) VALUES (59203, 1, 0.49, 6);
INSERT INTO zaf.tbl_wgs (lz_code, wg_name_id, pc_wg, hh_size) VALUES (59203, 2, 0.25, 6);
INSERT INTO zaf.tbl_wgs (lz_code, wg_name_id, pc_wg, hh_size) VALUES (59203, 3, 0.18, 6);
INSERT INTO zaf.tbl_wgs (lz_code, wg_name_id, pc_wg, hh_size) VALUES (59203, 4, 0.08, 5);

INSERT INTO zaf.tbl_wgs (lz_code, wg_name_id, pc_wg, hh_size) VALUES (59301, 1, 0.25, 6);
INSERT INTO zaf.tbl_wgs (lz_code, wg_name_id, pc_wg, hh_size) VALUES (59301, 2, 0.43, 6);
INSERT INTO zaf.tbl_wgs (lz_code, wg_name_id, pc_wg, hh_size) VALUES (59301, 3, 0.23, 5);
INSERT INTO zaf.tbl_wgs (lz_code, wg_name_id, pc_wg, hh_size) VALUES (59301, 4, 0.09, 5);

INSERT INTO zaf.tbl_wgs (lz_code, wg_name_id, pc_wg, hh_size) VALUES (59302, 1, 0.47, 8);
INSERT INTO zaf.tbl_wgs (lz_code, wg_name_id, pc_wg, hh_size) VALUES (59302, 2, 0.25, 7);
INSERT INTO zaf.tbl_wgs (lz_code, wg_name_id, pc_wg, hh_size) VALUES (59302, 3, 0.18, 7);
INSERT INTO zaf.tbl_wgs (lz_code, wg_name_id, pc_wg, hh_size) VALUES (59302, 4, 0.10, 6);

-- When all is done, display a list of livelihood zones, with wealth groups (where defined--i.e. where baselines ahve been done)
SELECT * FROM zaf.tbl_livezones_list_all AS f INNER JOIN (zaf.tbl_wgs AS g INNER JOIN zaf.tbl_wg_names AS h ON g.wg_name_id = h.tid) ON f.lz_code = g.lz_code;