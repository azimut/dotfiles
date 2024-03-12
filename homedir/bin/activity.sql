-- create table events (
--   id serial primary key,
--   etype varchar(128) not null,
--   sleep_at timestamp with time zone not null,
--   wakeup_at timestamp with time zone not null,
--   diff real not null
-- );
-- psql --csv -t -X -U postgres -d activity -f activity.sql
select sum(round(cast((diff/60/60) as numeric)))
  from events
 where (now() - sleep_at) <= interval '24 hours'
   and (diff/60/60) > 2 -- offtime
