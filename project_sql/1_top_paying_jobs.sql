/*
Question: What are the top-paying Data Analyst jobs?
Objectives:
1. Identify the top 10 highest-paying Data Analyst roles that are available remotely.
2. Only include job postings with specified salaries (exclude NULL values).
3. Purpose: Highlight the best-paying opportunities for Data Analysts, 
   offering insights into employment trends and career planning.
*/


SELECT 
    name AS company_name,
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim ON
    company_dim.company_id = job_postings_fact.company_id
WHERE job_title = 'Data Analyst' AND 
      job_location = 'Anywhere' AND salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10