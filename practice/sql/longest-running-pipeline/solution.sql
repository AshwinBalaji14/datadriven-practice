SELECT
    pipe_name
FROM
    data_pipes
WHERE
    dur_secs = (
        SELECT MAX(dur_secs)
        FROM data_pipes
    )
 limit 1 ;
