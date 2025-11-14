/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
   🧠 offering strategic insights for career development in data analysis
*/




WITH skill_stats AS (
    SELECT 
        s.skill_id,
        s.skills,
        COUNT(j.job_id) AS demand_count,
        ROUND(AVG(j.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact j
    INNER JOIN skills_job_dim sj ON j.job_id = sj.job_id
    INNER JOIN skills_dim s ON sj.skill_id = s.skill_id
    WHERE j.job_title_short = 'Data Analyst'
      AND j.job_work_from_home IS TRUE
      AND j.salary_year_avg IS NOT NULL
    GROUP BY s.skill_id, s.skills
)
SELECT 
    skill_id,
    skills,
    demand_count,
    avg_salary
FROM skill_stats
WHERE demand_count > 10
ORDER BY avg_salary DESC, demand_count DESC
LIMIT 25;






/*

📊 Top Data Analyst Skills: Demand & Pay Insights

Python & Tableau – Python (236 postings, $101k), Tableau (230 postings, $99k)
💡 Both high-demand and solid-paying. Core skills for almost any analyst role.

R & SAS – R (148 postings, $100k), SAS (63 postings, $99k)
💡 Statistical tools with strong demand in analytics-heavy industries.

Looker & SQL Server – Looker (49 postings, $104k), SQL Server (35 postings, $98k)
💡 BI tools + database expertise remain valuable for reporting and dashboards.

Cloud & Big Data – Snowflake (37 postings, $113k), Azure (34 postings, $111k), AWS (32 postings, $108k), Hadoop (22 postings, $113k), Spark (13 postings, $99k), BigQuery (13 postings, $110k)
💡 Analysts with cloud or big data skills can command higher salaries.

Programming & Dev Tools – Go (27 postings, $115k), Java (17 postings, $107k), JavaScript (20 postings, $97k), Confluence (11 postings, $114k), Jira (20 postings, $105k)
💡 Coding and workflow tool knowledge increases both pay and job flexibility.

Trend: The most strategic skills combine high demand with higher salaries — particularly:
➡️ Python, Tableau, R, SAS for analytics/statistics
➡️ Cloud & Big Data tools (Snowflake, AWS, Azure, Hadoop)
➡️ Programming + DevOps tools for hybrid analyst-engineer roles

💡 Career tip: Focus on skills that are both widely demanded and offer a salary premium to maximize job security and financial upside.



[
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "27",
    "avg_salary": "115320"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demand_count": "11",
    "avg_salary": "114210"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "22",
    "avg_salary": "113193"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "37",
    "avg_salary": "112948"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "34",
    "avg_salary": "111225"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "13",
    "avg_salary": "109654"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "32",
    "avg_salary": "108317"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "17",
    "avg_salary": "106906"
  },
  {
    "skill_id": 194,
    "skills": "ssis",
    "demand_count": "12",
    "avg_salary": "106683"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "20",
    "avg_salary": "104918"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "37",
    "avg_salary": "104534"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "49",
    "avg_salary": "103795"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "13",
    "avg_salary": "101414"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "236",
    "avg_salary": "101397"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "148",
    "avg_salary": "100499"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "16",
    "avg_salary": "99936"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demand_count": "13",
    "avg_salary": "99631"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "230",
    "avg_salary": "99288"
  },
  {
    "skill_id": 197,
    "skills": "ssrs",
    "demand_count": "14",
    "avg_salary": "99171"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "13",
    "avg_salary": "99077"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "demand_count": "11",
    "avg_salary": "98958"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "35",
    "avg_salary": "97786"
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "demand_count": "20",
    "avg_salary": "97587"
  }
]

*/