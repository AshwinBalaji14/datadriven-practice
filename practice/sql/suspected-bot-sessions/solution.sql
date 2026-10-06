select 
  session_id,
  user_id,
  session_duration_sec
from
  user_sessions
where
  session_duration_sec < 100   AND session_start >= '2026-01-01'
  AND session_start < '2027-01-01';
