-- Query 3

select if(gender="M","Male","Female") Gender,
       count(*) Total_Count 
  from TravelOnTheGo.passenger
 where distance >= 600
 group by gender;

-- Query 4:

select min(p.price) "Min Sleeper Price" 
  from TravelOnTheGo.price p
 inner join TravelOnTheGo.distance d
    on p.bus_type_id = d.bus_type_id
 where d.bus_type = "Sleeper";

-- Query 5:

select passenger_name 
  from TravelOnTheGo.passenger
 where upper(passenger_name) like upper('S%');

-- Query 6:

select p1.passenger_name,
       p1.Boarding_City,
	   p1.Destination_City,
	   p1.bus_type,
	   p1.distance,
	   p2.price
  from TravelOnTheGo.passenger p1
  left outer join TravelOnTheGo.distance d
    on p1.bus_type = d.bus_type
   and p1.distance = d.distance
  left outer join TravelOnTheGo.price p2
    on p2.bus_type_id = d.bus_type_id
 order by p1.passenger_name,p1.distance,p2.price;

-- Query 7:

select p1.passenger_name,
       d.bus_type, 
	   p2.price 
from TravelOnTheGo.passenger p1
inner join TravelOnTheGo.distance d
on p1.distance = d.distance
and p1.bus_type = d.bus_type
inner join TravelOnTheGo.price p2
on p2.bus_type_id = d.bus_type_id
where p1.distance = 1000
and d.bus_type = "Sitting";

-- Query 8:

select p1.passenger_name,
       d.bus_type, 
	   p2.price 
from TravelOnTheGo.passenger p1
inner join TravelOnTheGo.distance d
on p1.distance = d.distance
inner join TravelOnTheGo.price p2
on p2.bus_type_id = d.bus_type_id
where passenger_name = "Pallavi";

-- Query 9:

select distinct distance 
from TravelOnTheGo.passenger
order by 1 desc;

-- Query 10:

select passenger_name, 
       distance, 
	   round(distance/(select sum(distance) from TravelOnTheGo.passenger) * 100,2) Dist_Trav_Percentage
from TravelOnTheGo.passenger;

-- Query 11:

select distinct distance, 
       price,
       case        
       WHEN price < 500 THEN "Cheap"
       WHEN price between 500 and 1000 THEN "Average Cost"
       else "Expensive"
       end price_category
from TravelOnTheGo.price p
inner join TravelOnTheGo.distance d
  on p.bus_type_id = d.bus_type_id
order by 1;
