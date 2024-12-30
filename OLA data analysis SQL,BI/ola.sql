use Ola;

select * from bookings;
-- 1 
create view Successful_Bookings as 
select * from bookings
 where Booking_Status = 'Success';
 
 select * from Successful_Bookings;
 
-- 2 
create view ride_distance_for_each_vehicle as 
select Vehicle_type,avg(Ride_Distance) 
as avg_distance from bookings
group by Vehicle_Type;

select * from ride_distance_for_each_vehicle;

-- 3
create view Canceled_Rides_by_Customer as 
select count(*) from bookings
where Booking_Status='Canceled by Customer';

select * from Canceled_Rides_by_Customer;

-- 4

create view Top_5_Customers as
SELECT Customer_ID, 
       COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;


select * from Top_5_Customers;

-- 5 
create view canceled_by_driver_P_C_Issues as 
select count(*) from bookings
where Canceled_Rides_by_Driver='Personal & Car related issue';

select * from canceled_by_driver_P_C_Issues;

-- 6 
create view max_min_driver_rating as 
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from bookings where vehicle_Type='Prime Sedan';

select * from max_min_driver_rating;

-- 7 
create view UPI_Payment as
select * from bookings 
where Payment_Method='UPI';

select * from UPI_Payment;

-- 8 
create view avg_customer_rating_by_vehicle_type as 
select Vehicle_Type,avg(Customer_Rating) as avg_customer_rating
from bookings
group by Vehicle_Type;

select * from avg_customer_rating_by_vehicle_type;

-- 9 
select sum(Booking_Value) as total_successful_ride_value
from bookings
where Booking_Status='Success';

-- 10 
create view incomplete_rides_reson as
select Booking_ID,Incomplete_Rides_Reason
from bookings
where Incomplete_Rides='Yes';

select * from incomplete_rides_reson;