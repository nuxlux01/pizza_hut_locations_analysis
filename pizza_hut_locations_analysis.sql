select *
from pizza_hut_locations limit 10;

--Count of stores by type
select type, count(*) amount_stores
from pizza_hut_locations
group by type;

--Count top 10 city and type with more stores
select * from (
select type,city, count(*) amount_stores
from pizza_hut_locations 
group by type, city
order by amount_stores desc ) q limit 10;

--Count top 10 city with more stores
select * from (
select city, count(*) amount_stores
from pizza_hut_locations 
group by  city
order by amount_stores desc ) q limit 10;

--city with most stores opened durin a working day
select city, max(hours) max_hours
from (
select city, sum(close - open) hours from (
select field1 id,city, open_hours,cast(substr(open_hours,1,5) as int) open
	,cast(substr(open_hours,12,2) as int) + 12 close
from pizza_hut_locations 
where open_hours is not null ) q
group by city ) qo;



