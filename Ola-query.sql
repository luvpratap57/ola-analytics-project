create database Ola;
use Ola;


 -- 1. Retrieve all successful bookings:
 
 Create View Successful_bookings as
SELECT * FROM bookings WHERE Booking_status = 'Success';

select * from Successful_bookings;

-- 2. Find the average ride distance for each vehicle type:
Create View  Avg_rides_for_each_vehicle as
    Select Vehicle_Type ,Round(Avg(Ride_Distance),2 )as Avg_distance
    From Bookings
    Group by Vehicle_Type;
   
-- 2. Find the average ride distance for each vehicle type:
    Select * from Avg_rides_for_each_vehicle;
    
-- 3. Get the total number of cancelled rides by customers:
  
     Create View cancelled_rides_by_customers As
    Select Count(*) from Bookings 
    where Booking_Status ="Canceled by Customer";
    
-- 3. Get the total number of cancelled rides by customers:    
    Select * from cancelled_rides_by_customers;

-- 4. List the top 5 customers who booked the highest number of rides:

   Create View top_5_customers_highest_number_of_rides As
   Select Customer_ID, Count(Booking_ID) As Total_rides
   From Bookings
   Group By Customer_ID
   Order By Total_rides Desc Limit 5;
  
  -- 4. List the top 5 customers who booked the highest number of rides: 
   Select * from top_5_customers_highest_number_of_rides;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
  Create View rides_cancelled_by_drivers_personal_car_related_issues As
  Select Count(*) 
  From Bookings
  Where Canceled_Rides_by_Driver = "Personal & Car related issue";
  
-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
  Select * from rides_cancelled_by_drivers_personal_car_related_issues;
  
-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

 Create View Max_Min_Driver_Ratings_Prime_Sedan As
  Select Max(Driver_Ratings) As Max_Rating, Min(Driver_Ratings) as Min_Rating
  From Bookings
  Where Vehicle_Type= "Prime Sedan";
  
  
  
--   If i want to get the Driver_ID and Driver_Ratings as well 

  SELECT Driver_ID, Driver_Ratings
FROM Bookings
WHERE Vehicle_Type = 'Prime Sedan'
  AND Driver_Ratings IN (
      SELECT MAX(Driver_Ratings)
      FROM Bookings
      WHERE Vehicle_Type = 'Prime Sedan'
      
      UNION
      
      SELECT MIN(Driver_Ratings)
      FROM Bookings
      WHERE Vehicle_Type = 'Prime Sedan'
  );
 
 
-- 7. Retrieve all rides where payment was made using UPI:

Create View rides_using_UPI As
 Select * from Bookings Where Payment_Method= "UPI";
 
 -- 7. Retrieve all rides where payment was made using UPI:
 Select * from rides_using_UPI;
 
 
-- 8. Find the average customer rating per vehicle type:

Create View average_customer_rating_vehicle_type As
 Select Vehicle_Type, Round(Avg(Customer_Rating),2 ) from Bookings Group by Vehicle_Type;
 
 -- 8. Find the average customer rating per vehicle type:
 Select * From average_customer_rating_vehicle_type;
 
 -- 9. Calculate the total booking value of rides completed successfully:

Create View Total_Successful_ride_value As
Select Sum(Booking_Value) AS Total_Successful_Value
From Bookings
Where Booking_Status= "Success";

Select * from Total_Successful_ride_value;

-- 10. List all incomplete rides along with the reason:

Create View incompleterides_with_reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM  Bookings
WHERE Incomplete_Rides = 'Yes';

-- 1. Retrieve all successful bookings:
  
    select * from Successful_bookings;
    
-- 2. Find the average ride distance for each vehicle type:
    Select * from Avg_rides_for_each_vehicle;
    
-- 3. Get the total number of cancelled rides by customers:    
    Select * from cancelled_rides_by_customers;
    
 -- 4. List the top 5 customers who booked the highest number of rides: 
   Select * from top_5_customers_highest_number_of_rides;
  
-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
  Select * from rides_cancelled_by_drivers_personal_car_related_issues;
  
-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

 Select* from Max_Min_Driver_Ratings_Prime_Sedan;
 
  -- 7. Retrieve all rides where payment was made using UPI:
 Select * from rides_using_UPI;
 
  -- 8. Find the average customer rating per vehicle type:
 Select * From average_customer_rating_vehicle_type;
 
 -- 9. Calculate the total booking value of rides completed successfully:
Select * from Total_Successful_ride_value;
  
-- 10. List all incomplete rides along with the reason:
Select * from incompleterides_with_reason;