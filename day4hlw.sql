Q10)Find the names of students who improved their scores every single day (Day 3 > Day 2 AND Day 2 > Day 1). 
  Also, display the name of the Month they were born in using a date function.

SELECT full_name,
TO_CHAR(dob,'MONTH') AS BIRTH_MONTH,
T2.total_score AS DAY1,
T3.total_score AS DAY2,
T4.total_score AS DAY3
FROM "RSVP_New" AS T1
JOIN day_1_exam AS T2
ON T1.hall_ticket_no = T2.hall_ticket_no
JOIN day_2_exam AS T3
ON T2.hall_ticket_no = T3.hall_ticket_no
JOIN day_3_exam AS T4
ON T1.hall_ticket_no = T4.hall_ticket_no
WHERE T3.total_score > T2.total_score AND  T4.total_score > T3.total_score

| full_name       | birth_month | day1 | day2 | day3 |
| --------------- | ----------- | ---- | ---- | ---- |
| MALEKA TARRANUM | DECEMBER    | 32   | 36   | 44   |
| MARIA KATE      | AUGUST      | 27   | 30   | 37   |
| MAHIMA          | APRIL       | 32   | 34   | 37   |
| RAMDIN ASWANI   | NOVEMBER    | 27   | 35   | 44   |
| PAVITHRA        | MARCH       | 25   | 28   | 36   |



Q2)-List the names and contact numbers of students who attended the Day 1 AND Day 2 exams, but EXCEPT those who showed up for Day 3.
select
full_name,
contact_no
from "RSVP_New"
where hall_ticket_no in(
select
hall_ticket_no from day_1_exam
intersect
select hall_ticket_no from day_2_exam
except
select hall_ticket_no from day_3_exam 
)
| full_name       | contact_no |
| --------------- | ---------- |
| NABA MUJAHID    | 9573127535 |
| RITHIKA         | 7675913403 |
| MUNAZZA KHATOON | 7382888571 |
| JUVERIYA JAHA   | 9392591146 |

Q3)-Find the students who registered in the Morning (before 12:00 PM) and scored higher than the average class score of Day 3.
SELECT
full_name,
created_at,
total_score
FROM
"RSVP_New" AS T1
JOIN day_3_exam AS T2
ON T1.hall_ticket_no = T2.hall_ticket_no
WHERE
EXTRACT(HOUR FROM created_at) < 12 AND
total_score > (SELECT AVG(total_score) FROM day_3_exam)
ORDER BY total_score DESC
| full_name            | created_at                    | total_score |
| -------------------- | ----------------------------- | ----------- |
| TASNIA ZAREEF        | 2026-01-19 10:04:18.879621+00 | 46          |
| SRUTHI LALITHA       | 2026-01-05 05:16:32.211584+00 | 46          |
| BARRAH SHAKEEB       | 2026-01-05 05:16:10.383569+00 | 46          |
| HALEEMA MARFANI      | 2026-01-19 10:04:16.842249+00 | 45          |
| HAFSA                | 2026-01-19 10:06:49.499606+00 | 45          |
| RAMDIN ASWANI        | 2026-01-19 10:08:17.973701+00 | 44          |
| NAINA DUGAR          | 2026-01-05 05:15:26.177065+00 | 44          |
| ANISHA               | 2026-01-05 05:15:59.170151+00 | 44          |
| FATIMA AMOODI        | 2026-01-05 05:15:20.100296+00 | 44          |
| SOBIA                | 2026-01-19 10:02:22.794323+00 | 44          |
| MALEKA TARRANUM      | 2026-01-05 05:16:12.713548+00 | 44          |
| AMENAH AHSAN         | 2026-01-19 10:03:36.155456+00 | 44          |
| RAHELA SULTANA       | 2026-01-05 05:15:19.889302+00 | 43          |
| SWAIBA FAZAL         | 2026-01-19 10:04:39.840194+00 | 43          |
| ZILL E SUMAIYA BEGUM | 2026-01-19 10:03:40.242551+00 | 42          |
| ADEEBA ARFANI        | 2026-01-05 05:16:08.519894+00 | 42          |
| PRAGNA               | 2026-01-19 10:02:38.560321+00 | 42          |
| NANDINI              | 2026-01-05 05:17:32.717859+00 | 41          |
| AISHA SULTANA        | 2026-01-19 10:04:29.713601+00 | 40          |
| AYESHA JABEEN        | 2026-01-05 05:16:12.011433+00 | 40          |




Q4)Create a master leaderboard. Combine the Hall Ticket Numbers and scores from all 3 days. 
--Use a CASE statement to label them: if the combined score across all 3 days is >120, they are a 'GOAT', otherwise 'Rising Legend'
SELECT
T1.hall_ticket_no,
(SUM(T2.total_score) + SUM(T3.total_score) + SUM(T4.total_score)) AS TOTAL_POINTS,
CASE
WHEN (SUM(T2.total_score) + SUM(T3.total_score) + SUM(T4.total_score)) > 120 THEN 'GOAT'
ELSE 'RISING LEGEND'
END AS FINAL_STATUS
FROM "RSVP_New" AS T1
JOIN day_1_exam AS T2
ON T1.hall_ticket_no = T2.hall_ticket_no
JOIN day_2_exam AS T3
ON T1.hall_ticket_no = T3.hall_ticket_no
JOIN day_3_exam AS T4
ON T1.hall_ticket_no = T4.hall_ticket_no
GROUP BY T1.hall_ticket_no
ORDER BY 2 DESC

| hall_ticket_no | total_points | final_status  |
| -------------- | ------------ | ------------- |
| 120424672045   | 133          | GOAT          |
| 120424672005   | 130          | GOAT          |
| 120424672032   | 129          | GOAT          |
| 120424672017   | 128          | GOAT          |
| 120424672047   | 128          | GOAT          |
| 120424672016   | 127          | GOAT          |
| 120424672012   | 126          | GOAT          |
| 120424672029   | 120          | RISING LEGEND |
| 120424672002   | 117          | RISING LEGEND |
| 120424672042   | 116          | RISING LEGEND |
| 120424672007   | 115          | RISING LEGEND |
| 120424672018   | 113          | RISING LEGEND |
| 120424672003   | 112          | RISING LEGEND |
| 120424672001   | 111          | RISING LEGEND |
| 120424672038   | 109          | RISING LEGEND |
| 120424672046   | 106          | RISING LEGEND |
| 120424672036   | 105          | RISING LEGEND |
| 120424672057   | 105          | RISING LEGEND |
| 120424672022   | 105          | RISING LEGEND |
| 120424672014   | 105          | RISING LEGEND |
| 120424672011   | 105          | RISING LEGEND |
| 120424672041   | 103          | RISING LEGEND |
| 120424672054   | 103          | RISING LEGEND |
| 120424672059   | 100          | RISING LEGEND |
| 120424672051   | 97           | RISING LEGEND |
| 120424672037   | 94           | RISING LEGEND |
| 120424672015   | 93           | RISING LEGEND |
| 120424672049   | 90           | RISING LEGEND |
| 120424672055   | 89           | RISING LEGEND |
| 120424672008   | 89           | RISING LEGEND |
| 120424672039   | 87           | RISING LEGEND |
| 120424672040   | 86           | RISING LEGEND |
| 120424672048   | 85           | RISING LEGEND |
| 120424672025   | 85           | RISING LEGEND |
| 120424672044   | 84           | RISING LEGEND |
| 120424672009   | 78           | RISING LEGEND |
| 120424672030   | 73           | RISING LEGEND |
| 120424672013   | 69           | RISING LEGEND |





