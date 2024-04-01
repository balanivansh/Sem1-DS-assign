use Assignment;
describe Olympics;
#1(a)
SELECT * FROM Olympics;
#2(b)
SELECT name , Medal FROM Olympics;
#3(c)
SELECT COUNT(DISTINCT name) AS TotalAthletes FROM Olympics;
#4(d)
SELECT * FROM Olympics WHERE medal = 'Gold';
#5(e)
SELECT name FROM Olympics WHERE Medal = 'Silver' ORDER BY Year;
#6(f)
SELECT team, medal, COUNT(*) AS MedalCount FROM Olympics GROUP BY team, medal;
#7(g)
SELECT team FROM Olympics WHERE medal = 'Gold' GROUP BY team HAVING COUNT(*) > 50;
#8(i)
SELECT name , COUNT(*) AS MedalCount
FROM Olympics
GROUP BY name
ORDER BY MedalCount DESC
LIMIT 1;
#9(j)
SELECT DISTINCT event FROM Olympics WHERE event LIKE '%Freestyle%';
#10(k)
SELECT sport, name, COUNT(*) AS MedalCount
FROM Olympics
GROUP BY sport, name
ORDER BY sport, MedalCount DESC
LIMIT 3;
#11(l)
SELECT name, year, COUNT(*) AS MedalCount
FROM Olympics
GROUP BY name, year
HAVING COUNT(*) > 1;
#12(m)
SELECT team
FROM Olympics
WHERE season IN ('Summer', 'Winter')
GROUP BY team
HAVING COUNT(DISTINCT Season) = 2
AND SUM(CASE WHEN medal = 'Gold' THEN 1 ELSE 0 END) > 0;
#13(n)
SELECT team, MAX(year) - MIN(year) AS YearDifference
FROM Olympics
GROUP BY team;
#14(p)
SELECT name, event
FROM Olympics
WHERE event IN (
    SELECT event
    FROM Olympics
    WHERE medal = 'Silver'
)
AND medal = 'Gold';
#15(s)
SELECT team
FROM (
    SELECT team, COUNT(DISTINCT sport) AS SportCount
    FROM Olympics
    GROUP BY team
) AS subquery
WHERE SportCount > 10;