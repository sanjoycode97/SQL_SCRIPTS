# SQL_SCRIPTS


SELECT * FROM patients
where (first_name like '__r%') 
and (gender = 'F') 
and (month(birth_date) in (2,5,12))
and (city='Kingston');
