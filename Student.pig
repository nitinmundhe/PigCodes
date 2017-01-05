student = LOAD '/user/nitin/student_data.txt' using PigStorage(',') as ( id:int, firstname:chararray, lastname:chararray, contact:chararray, city:chararray );
dump student
student_details = LOAD '/user/nitin/student_details.txt' USING PigStorage(',') as (id:int, firstname:chararray, lastname:chararray, age:int, phone:chararray, city:chararray);
group_data = GROUP student_details by age;
dump group_data;
group_multiple = GROUP student_details by ( age, city );
dump group_multiple;
group_all = GROUP student_details all;
dump group_all;