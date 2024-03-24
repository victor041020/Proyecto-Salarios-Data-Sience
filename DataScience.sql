-- CREAMOS LA NUEVA BASE DE DATOS

CREATE DATABASE Salario;

-- UNA VEZ CREADA, NOS POSICIONAMOS EN ELLA

USE Salario;

-- LLAMAMOS TODA LA BASE DE DATOS PARA COMPROBAR QUE SE IMPORTÓ CORRECTAMENTE

SELECT * FROM ds_salaries;

----------------------------------------------------------------------------------------------

-- EXTRACCION DE INFORMACION A TRAVÉS DE CONSULTAS SQL

-- PREGUNTAS OBJETIVO

-- 1.	¿Cómo varía el salario promedio por nivel de experiencia en ciencia de datos?

SELECT experience_level, AVG(salary_in_usd) AS Salario FROM ds_salaries
GROUP BY experience_level
ORDER BY AVG(salary_in_usd) DESC;

-- 2.	¿Cuál es el tipo de empleo más común en la industria de la ciencia de datos?

SELECT employment_type, COUNT(*) AS TipoEmpleoMasComun FROM ds_salaries
GROUP BY employment_type;

-- 3.	¿Existe una diferencia significativa en el salario entre empleados a tiempo completo y empleados contratados?

SELECT employment_type, SUM(salary_in_usd) AS Salario FROM ds_salaries
GROUP BY employment_type
ORDER BY SUM(salary_in_usd) DESC;

-- 4.	¿Qué nivel de experiencia tiende a estar asociado con mayores salarios en la ciencia de datos?

SELECT experience_level, SUM(salary_in_usd) FROM ds_salaries
GROUP BY experience_level
ORDER BY SUM(salary_in_usd);

-- 5.	¿Cuál es la distribución de tamaños de empresa entre los empleadores de ciencia de datos?

SELECT company_size, COUNT(*) AS Empresa FROM ds_salaries
GROUP BY company_size
ORDER BY COUNT(*) DESC;

-- 6.	¿Cómo difieren los salarios promedio entre pequeñas, medianas y grandes empresas en ciencia de datos?

SELECT company_size, AVG(salary_in_usd) AS Salariopromedio FROM ds_salaries
GROUP BY company_size
ORDER BY AVG(salary_in_usd) DESC;

-- 7.	¿Cuál es la ubicación geográfica más común para empleados y empleadores en la ciencia de datos?

SELECT employee_residence, COUNT(employee_residence) AS Empleados FROM ds_salaries
GROUP BY employee_residence
ORDER BY COUNT(employee_residence) DESC
LIMIT 5;

 SELECT company_location, COUNT(company_location) AS Empresa FROM ds_salaries
 GROUP BY company_location
 ORDER BY COUNT(company_location) DESC
 LIMIT 5;
 
-- 8.	¿Existe alguna relación entre el nivel de experiencia y el tipo de empleo ofrecido en la industria de la ciencia de datos?

SELECT experience_level, employment_type, COUNT(*) AS count
FROM ds_salaries
GROUP BY experience_level, employment_type
ORDER BY experience_level, employment_type DESC;

-- 9.	¿Cuál es el salario promedio para diferentes tipos de empleo en empresas de diferentes tamaños?

SELECT employment_type, company_size, AVG(salary_in_usd) AS Salario FROM ds_salaries
GROUP BY employment_type, company_size
ORDER BY AVG(salary_in_usd);

-- 10.	 ¿Cuál es la distribución de salarios para diferentes títulos de trabajo en la industria de la ciencia de datos?

SELECT job_title, SUM(salary_in_usd) FROM ds_salaries
GROUP BY job_title
ORDER BY SUM(salary_in_usd) DESC
LIMIT 5;