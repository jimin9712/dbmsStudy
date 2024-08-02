CREATE OR REPLACE VIEW VIEW_SUPPORT_TARGET AS 
(
	SELECT * FROM TBL_FIELD_TRIP
	WHERE ID IN
	(
		SELECT FIELD_TRIP_ID
		FROM TBL_APPLY
		GROUP BY FIELD_TRIP_ID 
		HAVING COUNT(ID) <
		(
			SELECT AVG(APPLY_COUNT)
			FROM
			(
				SELECT FIELD_TRIP_ID ,COUNT(ID) APPLY_COUNT
				FROM TBL_APPLY 
				GROUP BY FIELD_TRIP_ID
			)
		)
	)
);

SELECT * FROM VIEW_SUPPORT_TARGET;