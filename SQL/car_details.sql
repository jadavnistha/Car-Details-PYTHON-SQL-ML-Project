create database cars1;

show tables;

select*from vehicle_info;

select * from vehicle_sales;

#Q1. Show all vehicles that use Diesel fuel. 

select * from vehicle_info where fuel = "diesel";


#Q2. Display vehicle name, year, and brand for all vehicles. 


select name , year , brand  from vehicle_info;

#Q3. Find all sales where selling price is below 5,00,000. 

select * from vehicle_sales where selling_price<500000;

#Q4. Find fuel types where average selling price is greater than 6,00,000. 

select fuel , avg(selling_price) 
from vehicle_info vi 
inner join vehicle_sales vs 
on vi.vehicle_uid = vs.vehicle_uid 
group by fuel
having avg(selling_price) > 600000;

#Q5. Find brands that have more than 50 vehicles listed. 


select brand , count(*) from vehicle_info group by brand having count(*)>50;


#Q6. Show transmission types where the average selling price is greater 
#than 7,00,000 AND the total number of vehicles is at least 30. 

select transmission , avg(selling_price), count(*)
from vehicle_info vi 
inner join vehicle_sales vs 
on vi.vehicle_uid = vs.vehicle_uid 
group by transmission 
having avg(selling_price)>700000 and count(*);


#Q7. Find price categories where the average km driven is above 75,000, 
#but only include categories that have more than 20 vehicles AND only count Diesel vehicles.



select price_category , avg(km_driven) , count(*) , fuel 
from vehicle_info vi  
inner join vehicle_sales vs 
on vi.vehicle_uid = vs.vehicle_uid 
where fuel = "Diesel"
group by price_category 
having avg(km_driven) > 75000 and count(*) > 20;



#Q8. Find vehicles whose selling price is higher than the overall average selling price. 

select brand , avg(selling_price)
from vehicle_info vi 
inner join vehicle_sales vs 
on vi.vehicle_uid  = vs.vehicle_uid 
group by brand 
having avg(selling_price ) > (select round(avg(selling_price)) from vehicle_sales);




#Q9. Find brands whose average selling price is greater than the average selling price of Toyota vehicles. 

select brand, avg(selling_price)
from vehicle_info vi 
inner join vehicle_sales vs 
on vi.vehicle_uid = vs.vehicle_uid 
group by brand 
having avg(vs.selling_price) > (select avg(selling_price)
from vehicle_sales vs 
inner join vehicle_info vi 
on vi.vehicle_uid = vs.vehicle_uid 
where brand = "toyota"
group by brand);





#Q10. Find fuel types where total selling price is higher than total selling price of Petrol vehicles.

select fuel , sum(selling_price)
from vehicle_info vi 
inner join vehicle_sales vs
on vi.vehicle_uid = vs.vehicle_uid 
group by fuel
having sum(selling_price) > (select sum(selling_price)
from vehicle_info vi 
inner join vehicle_sales vs 
on vi.vehicle_uid = vs.vehicle_uid
where fuel = "petrol");




