--- This subquery selects what's required for analysis, joining 4 different datasets and lining up what's common among them
--- eliminating duplicates and removing null values while rounding up values---
WITH cte1 AS (SELECT DISTINCT  
			personal.ID,personal.academic_info_id,personal.DOB, personal.gender,personal.ethnicity,
			family_info.fcollege, family_info.mcollege, family_info.urban, family_info.income, family_info.home,
			academic.education, academic.academic_score, academic.student_tuition,
			county.region, ROUND(county.unemp,2) AS unemp, ROUND(county.distance,2) AS distance, ROUND(county.avg_county_tuition,2) AS avg_county_tuition , ROUND(county.wage,2) AS wage,
			ROW_NUMBER() OVER (PARTITION BY personal.id, academic.id
                          ORDER BY personal.id, academic.id) AS duplicate_count
			
			FROM student_personal_details AS personal

			INNER JOIN student_family_details AS family_info
			ON personal.family_details_id = family_info.id

			INNER JOIN student_academic_info AS academic
			ON personal.academic_info_id = academic.id

			INNER JOIN county_info AS county
			ON personal.county_id = county.id

			WHERE personal.ID IS NOT NULL 
)
SELECT ID, academic_info_id, DOB, gender, ethnicity,region, fcollege, mcollege, urban, 
		home,income, education,academic_score,wage,student_tuition,avg_county_tuition, unemp, distance
FROM cte1
WHERE duplicate_count = 1
