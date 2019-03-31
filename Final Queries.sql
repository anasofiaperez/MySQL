
#what was the most popular color of cats (animal_type) adopted in 2016
select a.main_color from 
(select ifnull(color1, color2)main_color, count(distinct a.animal_id)cnt
 from final_project.animal a, final_project.Outcome b
where a.animal_id = b.animal_id and year(b.outcome_datetime) = '2016'
and b.outcome_type = 'Adoption' and a.animal_type = 'Cat'
group by ifnull(color1, color2))a
order by a.cnt desc limit 1;

#what was the most popular color of cats adopted in 2016 (using cat info)
SELECT  A1.color AS 'Cat Color using cat subtype'
FROM (SELECT ifnull(color1, color2) color, COUNT(distinct(A.Animal_ID))  AS Color_count
FROM final_project.Outcome A 
    INNER JOIN final_project.Animal B ON A.Animal_ID = B.Animal_ID 
	INNER JOIN final_project.Cat_Info C  ON  a.Animal_ID = C.Animal_ID 
	and a.Outcome_Datetime = c.Outcome_Datetime
WHERE A.Outcome_type = 'Adoption' AND C.Cat_Kitten = 'CAT' 
AND YEAR(A.Outcome_Datetime) = '2016'
          GROUP BY ifnull(color1, color2)
	  ) A1   
ORDER BY Color_count DESC limit 1;     


/*What were the names of female cats that were more than 5 years old at the center when they were adopted? */
SELECT DISTINCT a.Name
FROM final_project.animal a 
INNER JOIN final_project.outcome o ON a.Animal_ID=o.Animal_ID
WHERE a.Animal_Type='Cat'
AND a.Sex='Female'
AND timestampdiff(year, a.date_of_birth,o.Outcome_Datetime)>5
AND o.outcome_type='Adoption'
AND a.Name IS NOT NULL;

/*Which day of the week had the least adoptions in 2016?*/
SELECT mycount.Weekday AS 'Weekday with least adoptions'
FROM (SELECT DAYNAME(o.outcome_datetime) Weekday,COUNT(dayname(o.outcome_datetime)) mynum
FROM final_project.outcome1 o
WHERE YEAR(o.outcome_datetime)='2016'
AND o.outcome_type='Adoption'
GROUP BY dayname(o.outcome_datetime)) mycount
ORDER BY  mycount.mynum limit 1;


SELECT mycount.Weekday, MIN(mycount.mynum) AS 'Number of Adoptions'
FROM(SELECT DAYNAME(o.outcome_datetime) Weekday,COUNT(dayname(o.outcome_datetime)) mynum
			FROM final_project.outcome1 o
			WHERE YEAR(o.outcome_datetime)='2016'
			AND o.outcome_type='Adoption'
			GROUP BY dayname(o.outcome_datetime)) mycount
			GROUP BY Weekday
            ORDER BY mycount.mynum DESC limit 1;












