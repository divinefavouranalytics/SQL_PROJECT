/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
  helps identify the most financially rewarding skills to acquire or improve
*/




SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN 
skills_job_dim ON 
    skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON 
    skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home IS TRUE
GROUP BY 
    skills 
ORDER BY 
    avg_salary DESC
LIMIT 25




/*

📊 Trends in Top-Paying Data Analyst Skills
📊 Trends in Top-Paying Data Analyst Skills

Big Data & Distributed Computing – PySpark ($208k), Databricks ($142k), Pandas ($152k)
💡 Handling large-scale datasets commands the highest salaries.

DevOps & Automation Tools – Bitbucket ($189k), GitLab ($155k), Jenkins ($125k), Kubernetes ($132k)
💡 Analysts who can deploy and maintain pipelines earn a premium.

Machine Learning & AI – DataRobot ($155k), Scikit-learn ($126k), NumPy ($144k), Pandas ($152k), Watson ($161k)
💡 ML skills push analysts into top-paying technical roles.

Cloud & Infrastructure – GCP ($123k), Linux ($137k)
💡 Cloud and container knowledge adds extra value.

Collaboration & Workflow Tools – Notion ($125k), Atlassian ($131k), Twilio ($127k)
💡 Familiarity with cross-functional tools is rewarded in hybrid roles.

Trend: Employers favor analysts who combine data analysis with ML, big data, cloud, and automation expertise for the highest-paying roles.




[
  {
    "skills": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907"
  },
  {
    "skills": "linux",
    "avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skills": "notion",
    "avg_salary": "125000"
  },
  {
    "skills": "scala",
    "avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619"
  }
]
*/