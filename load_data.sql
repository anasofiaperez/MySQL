load data local infile 'C:/Users/anaso/Desktop/Database/Final Project/animal_load1.txt' 
into table final_project.animal; 

load data local infile 'C:/Users/anaso/Desktop/Database/Final Project/outcome_load1.txt' 
into table final_project.outcome; 

load data local infile 'C:/Users/anaso/Desktop/Database/Final Project/cat_load.txt' 
into table final_project.cat_info; 

create table final_project.animal1 as
select * from final_project.animal where 1=0;

create table final_project.outcome1 as
select * from final_project.outcome where 1=0;

#expected record count
/*Animal--28209
Outcome - 29414
Cat Info- 29414*/
