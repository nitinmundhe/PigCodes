student = LOAD '/user/nitin/student_data.txt' using PigStorage(',') as ( id:int, firstname:chararray, lastname:chararray, contact:chararray, city:chararray );
dump student;