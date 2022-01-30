show databases;
use sakila;

-- 1. Feladat
-- Jelenítsd meg az összes színész vezetéknevét és keresztnevét
select last_name, first_name
from sakila.actor;

-- 2. Feladat
-- a) Jelenítsd meg az összes színész teljes nevét csupa nagybetűkkel, egyetlen oszlopban.  az oszlop neve "Actor Name" legyen.
select upper(concat(last_name, ' ', first_name)) as "Actor Name" from sakila.actor;

-- b) Jelenítsd meg az azonosító, vezetéknév, és keresztnév értékeit annak a színésznek akinek a keresztneve Joe
select actor_id, first_name, last_name
from sakila.actor
where first_name ='Joe';

-- c) Találj meg minden színészt akinek a vezetéknéve tartalmazza a 'gen' szót!
select last_name 
from sakila.actor
where last_name like "%gen%";

-- d) Keress meg minden színészt akinek a vezetékneve tartalmazz az `li` szót, és rendezd a találatokat vezetéknév és keresztnév szerint.
select last_name, first_name
from sakila.actor
where last_name like "%gen%"
order by last_name, first_name;

-- 3. Feladat 
-- Mennyi különböző vezetéknevű színész van?
select count(DISTINCT last_name) from sakila.actor;

-- 4. Feladat
-- Melyik vezetéknév szerepel több mint egyszer?
select last_name
from sakila.actor
group by last_name
having count(last_name) > 1;

-- 5. Feladat 
-- Jelenítsd meg az összes ország ID-t, és ország nevet, amelyik kína, afganisztán, vagy Izrael!
select country_id, country
from sakila.country
where country in ('China', 'Afghanistan', 'Israel');

-- 6. Feladat 
-- Mennyi az átlagos hossza egy filmnek?
select sum(film.length) / count(film_id) as 'Átlagos film hossz'
from sakila.film;

-- 7. Feladat 
-- Jelenítsd meg az összes személyzet nevét, és címét.
select last_name, first_name, address
from sakila.staff s, sakila.address a
where s.address_id = a.address_id;

-- 8. Feladat 
-- Jelenítsd meg az összes vevő nevét és a fizetett összeget (payment amount).
-- ! Hogy ne legyen túl lassú a lekérdezés, elég csak az első 10 eredményt kiiratni. (limit 10;)
-- Megoldás 1:
select last_name, first_name, amount
from sakila.customer c, sakila.payment p
where c.customer_id = p.customer_id 
limit 10;

-- Megoldás 2:
select last_name, first_name, payment.amount
from customer
inner join payment using(customer_id)
limit 10;

-- 9. Feladat  
-- Jelenítsd meg az összes film címét és a benne szereplő színészek neveit.
-- ! Hogy ne legyen túl lassú a lekérdezés, elég csak az első 20 eredményt kiiratni. (limit 20;)
select film.title, last_name, first_name
from film
      inner join film_actor using(film_id)
      inner join actor using(actor_id)
limit 20;
