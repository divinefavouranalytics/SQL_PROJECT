/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market,
providing insights into the most valuable skills for job seekers.
  */






SELECT 
    skills,
    count(job_postings_fact.job_id) as demand_count
FROM 
    job_postings_fact
INNER JOIN 
skills_job_dim ON 
    skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON 
    skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND job_work_from_home IS TRUE
GROUP BY skills 
ORDER BY demand_count DESC
LIMIT 5



/*

🔎 Key Takeaways
- SQL dominates: It’s the most universal skill across postings.  
- Excel remains strong: Despite newer tools, it’s still a staple.  
- Python + BI tools (Tableau/Power BI): These are the differentiators that push analysts into higher-paying or more technical roles.  
- Trend: Employers want analysts who can both query data (SQL/Python) and present insights (Tableau/Power BI).


[
  {
    "skills": "sql",
    "demand_count": "7291"
  },
  {
    "skills": "excel",
    "demand_count": "4611"
  },
  {
    "skills": "python",
    "demand_count": "4330"
  },
  {
    "skills": "tableau",
    "demand_count": "3745"
  },
  {
    "skills": "power bi",
    "demand_count": "2609"
  }
]

*/