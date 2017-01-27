SELECT 
	dc_name,
	mn_name,
	mp_name, 
	mp_code, 
	sp_name, 
	sp_code, 
	sa_code,
	za_lp.demog_sas.lz_code,
	f.lz_abbrev,
	f.lz_name
FROM 
	za_lp.demog_sas 
INNER JOIN
	(SELECT DISTINCT
		lz_code,
		lz_abbrev,
		lz_name
	FROM
		za_lp.livezones) AS f
ON
	za_lp.demog_sas.lz_code = f.lz_code
WHERE
	sp_name LIKE '%Tshituni%'
--	OR sp_name LIKE '%Koloti SP%'
--	OR sp_name LIKE '%Mohlajeng%'
--	OR sp_name LIKE '%Monotwane%'
--	OR Mp_name LIKE '%Glen R%'
--	OR mp_name LIKE '%Mmankgodi%'
--	OR sp_name LIKE '%Mangondi%'
--	OR mp_name LIKE '%Darling%'
--	OR sp_name LIKE '%Sako%'
--	OR sp_name LIKE '%GaMonare%'
--	OR sp_name LIKE '%Mushi%'
--	OR sp_name LIKE '%Bakenberg%'
--	OR sp_name LIKE '%bosch%'
--	OR sp_name LIKE '%Beauty%'
--	OR sp_name LIKE '%Maangani%'
--	OR sp_name LIKE '%Zamekomste%'
	ORDER BY mp_name, sp_name;