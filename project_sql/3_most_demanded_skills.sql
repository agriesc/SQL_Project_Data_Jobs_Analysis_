/* count jobs based on skill */
SELECT
    skills,
    COUNT (job_title) AS total_jobs
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere'
GROUP BY 
    (skills)
ORDER BY
    total_jobs DESC
LIMIT 5