/*
Question: What skills are required for the top-paying Data Analyst jobs?

Objectives:
1. Use the top 10 highest-paying Data Analyst jobs identified in the first query.
2. Add the specific skills required for these roles.
3. Purpose: Provide a detailed view of which high-paying jobs demand certain skills,
   helping job seekers understand which skills to develop in order to align with top salaries.
*/






WITH top_paying_jobs AS (
SELECT 
    name AS company_name,
    job_id,
    job_title,
    salary_year_avg
FROM
    job_postings_fact
LEFT JOIN company_dim ON
    company_dim.company_id = job_postings_fact.company_id
WHERE job_title = 'Data Analyst' AND 
      job_location = 'Anywhere' AND salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10
)

SELECT 
       top_paying_jobs.*,
       skills
FROM top_paying_jobs
INNER JOIN skills_job_dim 
ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
ON skills_dim.skill_id = skills_job_dim.skill_id







/*

📈 Skill Frequency Insights (Top-Paying Data Analyst Roles — 2023)

Here’s the breakdown of the most demanded skills found across the 2023 high-paying data analyst job postings you provided:

• Python leads with a bold count of 7.
• SQL follows closely with a bold count of 6.
• R is also highly sought after, with a bold count of 5.
• Visualization tools like Tableau, Looker, and Excel each appear 3 times.
• Tools such as Pandas, AWS, SAS, and Power BI appear 2 times.
• Specialized skills like Java, Swift, Qlik, C++, JavaScript, Scikit-Learn, 
Kubernetes, MATLAB, GCP, BigQuery, Golang, MySQL, and 
Elasticsearch each appear once, showing niche but valuable demand.


[
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "sql"
  },
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "python"
  },
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "r"
  },
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "sas"
  },
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "matlab"
  },
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "pandas"
  },
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "tableau"
  },
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "looker"
  },
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "sas"
  },
  {
    "company_name": "Plexus Resource Solutions",
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "python"
  },
  {
    "company_name": "Plexus Resource Solutions",
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "mysql"
  },
  {
    "company_name": "Plexus Resource Solutions",
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "aws"
  },
  {
    "company_name": "Get It Recruit - Healthcare",
    "job_id": 456042,
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "skills": "sql"
  },
  {
    "company_name": "Get It Recruit - Healthcare",
    "job_id": 456042,
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "skills": "python"
  },
  {
    "company_name": "Get It Recruit - Healthcare",
    "job_id": 456042,
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "skills": "r"
  },
  {
    "company_name": "Level",
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "sql"
  },
  {
    "company_name": "Level",
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "python"
  },
  {
    "company_name": "Level",
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "r"
  },
  {
    "company_name": "Level",
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "golang"
  },
  {
    "company_name": "Level",
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "elasticsearch"
  },
  {
    "company_name": "Level",
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "aws"
  },
  {
    "company_name": "Level",
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "bigquery"
  },
  {
    "company_name": "Level",
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "gcp"
  },
  {
    "company_name": "Level",
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "pandas"
  },
  {
    "company_name": "Level",
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "scikit-learn"
  },
  {
    "company_name": "Level",
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "looker"
  },
  {
    "company_name": "Level",
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "kubernetes"
  },
  {
    "company_name": "CyberCoders",
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "python"
  },
  {
    "company_name": "CyberCoders",
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "java"
  },
  {
    "company_name": "CyberCoders",
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "r"
  },
  {
    "company_name": "CyberCoders",
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "javascript"
  },
  {
    "company_name": "CyberCoders",
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "c++"
  },
  {
    "company_name": "CyberCoders",
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "tableau"
  },
  {
    "company_name": "CyberCoders",
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "power bi"
  },
  {
    "company_name": "CyberCoders",
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "qlik"
  },
  {
    "company_name": "Uber",
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "sql"
  },
  {
    "company_name": "Uber",
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "python"
  },
  {
    "company_name": "Uber",
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "r"
  },
  {
    "company_name": "Uber",
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "swift"
  },
  {
    "company_name": "Uber",
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "excel"
  },
  {
    "company_name": "Uber",
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "tableau"
  },
  {
    "company_name": "Uber",
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "looker"
  },
  {
    "company_name": "Overmind",
    "job_id": 1482852,
    "job_title": "Data Analyst",
    "salary_year_avg": "138500.0",
    "skills": "sql"
  },
  {
    "company_name": "Overmind",
    "job_id": 1482852,
    "job_title": "Data Analyst",
    "salary_year_avg": "138500.0",
    "skills": "python"
  },
  {
    "company_name": "EPIC Brokers",
    "job_id": 1326467,
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "skills": "excel"
  },
  {
    "company_name": "InvestM Technology LLC",
    "job_id": 479965,
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "skills": "sql"
  },
  {
    "company_name": "InvestM Technology LLC",
    "job_id": 479965,
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "skills": "excel"
  },
  {
    "company_name": "InvestM Technology LLC",
    "job_id": 479965,
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "skills": "power bi"
  }
]
*/