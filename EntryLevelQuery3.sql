---Gender Count---
SELECT gender, COUNT(gender) AS No_of_Gender
FROM reports_student_colleges
GROUP BY gender

--- Ethnicity Count---
SELECT ethnicity, COUNT(ethnicity)
FROM reports_student_colleges
GROUP BY ethnicity

---Number of students in Urban areas---
SELECT urban, COUNT(urban) AS Urban_living
FROM reports_student_colleges
GROUP BY urban

---Number of student's mothers that went to School---
SELECT fcollege, COUNT(fcollege) AS Mother
FROM reports_student_colleges
GROUP BY fcollege

---Number of student's Father that went to School---
SELECT mcollege, COUNT(mcollege) AS Father
FROM reports_student_colleges
GROUP BY mcollege

--- High or Low income Type----
SELECT income, COUNT(income) AS income_type
FROM reports_student_colleges
GROUP BY income

---Number of Family that has a home---
SELECT home, COUNT(home) AS home_owners
FROM reports_student_colleges
GROUP BY home

---Population By region---
SELECT region, COUNT(region) AS region_count
FROM reports_student_colleges
GROUP BY region

---Average student tuition by Region---
SELECT region, AVG(student_tuition) AS Average_tuition
FROM reports_student_colleges
GROUP BY region

--- Number of years spent in school---
SELECT education, COUNT(education) AS years_of_education
FROM reports_student_colleges
GROUP BY education


