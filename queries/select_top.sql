SELECT DISTINCT Email
FROM REVENUE.AspNetUsers AS emails
INNER JOIN
(
	SELECT UserId, ActivityTime
	FROM REVENUE.UserActivities AS user
	INNER JOIN
	(
		SELECT WEEK(ActivityTime) AS week
		FROM REVENUE.UserActivities
		GROUP BY week
		ORDER BY COUNT(DISTINCT Page) DESC
		LIMIT 5
	) AS active_week
	ON WEEK(ActivityTime) = active_week.week
) AS joins
ON joins.UserId = emails.Id