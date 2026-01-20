Q1: Count how many students passed the exam.
select
count(total_score)
from day_2_exam
WHERE result_status='Pass'
| count |
| ----- |
| 24    |

Q2: Find the average score of all students who failed.
select
AVG(total_score)
from day_2_exam
WHERE result_status='Fail'
| avg                 |
| ------------------- |
| 24.6666666666666667 |


Q3: Get the highest score among all students.
Select
max(total_score) as Highest_score
from day_2_exam
| highest_score |
| ------------- |
| 44            |


Q4: Get the lowest score among passed students.
SELECT
  MIN(total_score) AS LOWEST_SCORE
  FROM
  day_2_exam
  WHERE result_status = 'Pass'
| lowest_score |
| ------------ |
| 30           |



Q5: Sum the total marks of all students who scored above 40.
Select
sum(total_score) as total_marks_above_40
from day_2_exam
where total_score>40
| total_marks_above_40 |
| -------------------- |
| 127                  |


Q6: Count students by result status for those who scored 35 or more.
Select
count (result_status)
from day_2_exam
where total_score>=35
group by result_status
| count |
| ----- |
| 24    |


Q7: Find average score grouped by result status for students with scores between 30 and 40.
Select
result_status,
avg(total_score)
from day_1_exam
where total_score between 30 and 40
group by result_status
| result_status | avg                 |
| ------------- | ------------------- |
| Pass          | 34.8571428571428571 |


Q8: Get maximum and minimum scores grouped by result status for students who scored less than 35.
Select
max(total_score) as highest_score,
min(total_score) as lowest_score
FROM day_2_exam
WHERE total_score< 35
group by result_status
| highest_score | lowest_score |
| ------------- | ------------ |
| 34            | 30           |
| 29            | 21           |



Q9: Count students grouped by result status for those whose names start with 'A'.
select
  result_status,
  Count (student_name) 
  FROM
  day_1_exam
  WHERE student_name LIKE 'A%'
  GROUP BY result_status
| result_status | count |
| ------------- | ----- |
| Pass          | 7     |
| Fail          | 2     |


Q10: Sum total scores grouped by result status for students who scored exactly 35, 40, or 45.
select
result_status,
SUM(total_score)
from
day_2_exam
WHERE total_score IN (35,40,45)
GROUP BY result_status
| result_status | sum |
| ------------- | --- |
| Pass          | 145|



Q11: Count students by each score value, ordered by score descending.
SELECT
total_score,
count (total_score) AS STUDENT_COUNT_SCORE
FROM day_2_exam
GROUP BY total_score
ORDER BY total_score desc
| total_score | student_count_score |
| ----------- | ------------------- |
| 44          | 1                   |
| 42          | 1                   |
| 41          | 1                   |
| 40          | 1                   |
| 39          | 1                   |
| 38          | 2                   |
| 37          | 1                   |
| 36          | 5                   |
| 35          | 3                   |
| 34          | 1                   |
| 33          | 1                   |
| 32          | 3                   |
| 31          | 2                   |
| 30          | 1                   |
| 29          | 1                   |
| 28          | 2                   |
| 27          | 3                   |
| 26          | 1                   |
| 25          | 2                   |
| 24          | 4                   |
| 23          | 2                   |
| 22          | 1                   |
| 19          | 2                   |


Q12: Show average score for each result status, ordered by average score.
SELECT
  result_status,
  ROUND(AVG(total_score),2) AS AVERAGE
  FROM
  day_2_exam
  GROUP BY 1
  ORDER BY AVG(total_score)
| result_status | average |
| ------------- | ------- |
| Fail          | 24.67   |
| Pass          | 35.79   |

Q13: Count how many students got each score, only for scores above 30, ordered by frequency.
SELECT
  total_score,
  COUNT(total_score) AS COUNT_OF_STUDENT_EACH_SCORE
  FROM
  day_2_exam
  WHERE total_score > 30
  GROUP BY total_score
  ORDER BY total_score
| total_score | count_of_student_each_score |
| ----------- | --------------------------- |
| 31          | 2                           |
| 32          | 3                           |
| 33          | 1                           |
| 34          | 1                           |
| 35          | 3                           |
| 36          | 5                           |
| 37          | 1                           |
| 38          | 2                           |
| 39          | 1                           |
| 40          | 1                           |
| 41          | 1                           |
| 42          | 1                           |
| 44          | 1                           |


Q14: Get total marks sum for each result status, ordered by sum.
SELECT
  result_status,
  SUM(total_score) AS SUM_OF_SCORE
  FROM
  day_2_exam
  GROUP BY result_status
  ORDER BY SUM(total_score)
| result_status | sum_of_score |
| ------------- | ------------ |
| Fail          | 444          |
| Pass          | 859          |



Q15: Find minimum score for each result status, ordered by min score.
SELECT
  result_status,
  MIN(total_score) AS LOWEST_SCORE
  FROM
  day_2_exam
  GROUP BY 1
  ORDER BY MIN(total_score)
| result_status | lowest_score |
| ------------- | ------------ |
| Fail          | 19           |
| Pass          | 30           |
  


Q16: For passed students only, show count, average, max and min scores grouped by whether score is above 40.
SELECT
  total_score,
  COUNT(total_score) AS COUNT_OF_EACH_SCORE,
  ROUND(AVG(total_score),2) AS AVERAGE,
  MAX(total_score) AS HIGHEST_SCORE,
  MIN(total_score) AS LOWEST_SCORE
  FROM
  day_2_exam
  WHERE total_score > 40 AND result_status = 'Pass'
  GROUP BY total_score
| total_score | count_of_each_score | average | highest_score | lowest_score |
| ----------- | ------------------- | ------- | ------------- | ------------ |
| 41          | 1                   | 41.00   | 41            | 41           |
| 42          | 1                   | 42.00   | 42            | 42           |
| 44          | 1                   | 44.00   | 44            | 44           |


Q17: Count and average score for each result status, only for scores not equal to 35.
SELECT
  result_status,
  COUNT(total_score) AS COUNT_OF_EACH_SCORE,
  ROUND(AVG(total_score),2) AS AVERAGE
  FROM
  day_2_exam
  WHERE NOT total_score = 35
  GROUP BY result_status
| result_status | count_of_each_score | average |
| ------------- | ------------------- | ------- |
| Fail          | 18                  | 24.67   |
| Pass          | 21                  | 35.90   |















    

