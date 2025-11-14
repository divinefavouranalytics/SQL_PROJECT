# Introduction

📊 Dive into the data job market! Focusing on data analyst roles, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and ☑️ where high demand meets high salary in data analytics.

💬 SQL queries? Check them out here: [project_sql folder](/project_sql/).



# Background
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others work to find optimal jobs.

Data hails from my [SQL Course](https://lukebarousse.com/sql). It's packed with insights on job titles, salaries, locations, and essential skills.

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used

| Tool / Skill           | Purpose / Use Case                                                                 |
|------------------------|-----------------------------------------------------------------------------------|
| **SQL**                | The backbone of my analysis, allowing me to query the database and unearth critical insights. |
| **PostgreSQL**         | The chosen database management system, ideal for handling the job posting data.   |
| **Visual Studio Code** | My go-to for database management and executing SQL queries.                        |
| **Git & GitHub**       | Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking. |


# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here's how I approached each question:

### 1️⃣ Top-Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.


**SQL Query:**
```SQL
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

```


#### Overview
- Total Jobs: 10
- Location: Remote / Anywhere 🌍
- Schedule: Full-time ⏰
- Salary Range: $135,000 – $650,000

#### Salary Insights
| Company | Avg. Salary (USD) |
|---------|-----------------|
| Mantys | 650,000 🔥 |
| Get It Recruit - IT | 165,000 |
| Plexus Resource Solutions | 165,000 |
| Get It Recruit - Healthcare | 151,500 |
| CyberCoders | 145,000 |
| Level | 145,000 |
| Uber | 140,500 |
| Overmind | 138,500 |
| InvestM Technology LLC | 135,000 |
| EPIC Brokers | 135,000 |

> Most jobs cluster between $135k – $151.5k. Mantys is an outlier with $650k.

#### Key Takeaways
- Fully remote roles dominate ✅
- Full-time positions only ✅
- Specialized recruiters (IT/Healthcare) pay higher 💰
- High-paying benchmark: $135k – $151k

## 2️⃣ Skills Required for Top-Paying Roles

**Objective**: Determine which skills are demanded by the top-paying Data Analyst jobs


**SQL Query:**
```SQL
WITH top_paying_jobs AS (
    SELECT 
        name AS company_name,
        job_id,
        job_title,
        salary_year_avg
    FROM job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
    WHERE job_title = 'Data Analyst' 
      AND job_location = 'Anywhere' 
      AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT 
       top_paying_jobs.*,
       skills
FROM top_paying_jobs
INNER JOIN skills_job_dim 
    ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_dim.skill_id = skills_job_dim.skill_id;

```

**Skill Insights**:

- Top skills: Python, SQL, R, Tableau, Excel, Power BI

- Specialized skills: Java, Swift, Go, Kubernetes, GCP, BigQuery

- Python, SQL, and R appear most frequently in high-paying roles


![Alt text](/assets/Code_Generated_Image.png)


## 3️⃣ Most In-Demand Skills

**Objective**: Identify the top 5 skills across all remote Data Analyst postings.


**SQL Query:**
```SQL
SELECT 
    skills,
    COUNT(job_postings_fact.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_title_short = 'Data Analyst' 
  AND job_work_from_home IS TRUE
GROUP BY skills 
ORDER BY demand_count DESC
LIMIT 5;

```
***Top 5 In-Demand Skills (2023):***

| Skill    | Demand Count |
| -------- | ------------ |
| SQL      | 7,291        |
| Excel    | 4,611        |
| Python   | 4,330        |
| Tableau  | 3,745        |
| Power BI | 2,609        |



**Key Takeaways**:

- SQL dominates as a universal skill ✅

- Excel remains essential ✅

- Python + BI tools differentiate analysts for high-paying or technical roles 💡

## 4️⃣ Top-Paying Skills

**Objective**: Determine which skills yield the highest salaries.

**SQL Query:**
```SQL
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_title_short = 'Data Analyst' 
  AND salary_year_avg IS NOT NULL
  AND job_work_from_home IS TRUE
GROUP BY skills 
ORDER BY avg_salary DESC
LIMIT 25;

```

**Top-Paying Skills (USD Avg Salary):**

- PySpark: $208k

- Bitbucket: $189k

- DataRobot: $155k

- Pandas: $152k

- Watson: $161k

- GitLab: $154k

**💡 Trend**: Analysts with Big Data, ML, Cloud, and DevOps skills command the highest salaries.



## 5️⃣ Optimal Skills to Learn

**Objective**: Identify skills with high demand and high salary.

**SQL Query:**
```SQL
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
```

**Insights:**

- Python & Tableau: Core, high-demand, good-paying

- R & SAS: Strong statistical tools

- Cloud & Big Data: Snowflake, AWS, Azure, Hadoop, BigQuery

- Programming & Dev Tools: Go, Java, JavaScript, Confluence, Jira

**💡 Career Tip**: Focus on skills that combine high demand with high salaries to maximize job security and earnings.


# What I Learned




Working on this Data Analyst job market project taught me a lot, both technically and professionally:

1. **SQL Mastery**  
   - I strengthened my SQL skills by writing complex queries with multiple joins, CTEs, and aggregation.  
   - Learned how to filter, rank, and summarize real-world data efficiently.

2. **Data Modeling Understanding**  
   - Gained experience working with fact and dimension tables (star schema style).  
   - Learned how to link job postings with skills tables to extract meaningful insights.

3. **Data Analysis & Interpretation**  
   - Learned how to turn raw data into actionable insights, like identifying high-paying roles and in-demand skills.  
   - Practiced interpreting numbers and presenting them clearly in tables and summaries.

4. **Data Visualization Planning**  
   - Thought about how to represent complex data in a readable way, even before creating charts.  
   - Learned to structure data so it’s ready for visualization in tools like Tableau or Excel.

5. **Project Documentation & Readme Writing**  
   - Learned how to document queries, results, and insights clearly.  
   - Practiced explaining technical work in a way that’s understandable for both technical and non-technical audiences.

6. **Critical Thinking & Decision Making**  
   - Learned how to decide which skills, salaries, or jobs were most relevant for analysis.  
   - Developed a better sense of prioritizing insights that matter most for career guidance.

7. **Attention to Detail**  
   - Learned the importance of checking for NULLs, duplicates, and outliers in data.  
   - Realized that small mistakes in queries can completely change the results.

💡 **Overall:** This project was a great exercise in combining **technical SQL skills**, **data analysis**, and **clear communication**, preparing me for real-world analytics projects.




# Conclusion

This project provided a comprehensive look at the Data Analyst job market, combining salary trends, skill demands, and high-paying roles. By analyzing real job posting data, I was able to identify patterns that are crucial for anyone looking to grow in this field.

## Insight

- High-paying roles often require a combination of technical, analytical, and visualization skills.  
- SQL, Python, and Excel remain core skills, while cloud, Big Data, and ML tools significantly boost earning potential.  
- Remote work is becoming a standard for top-paying positions, highlighting the importance of adaptability and digital collaboration skills.  
- Focusing on skills that are both in high demand and linked to higher salaries is the most strategic approach for career growth.  
- Documenting the analysis clearly is as important as the analysis itself, ensuring insights can be understood and acted upon by others.


### Closing Thoughts
This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.