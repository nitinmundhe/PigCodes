### PigCodes

This project will include various scripts written in Pig provides examples of **how** we can make use of the Pig to solve the complex problem with Pig Latin Scripts

## Code Example

rawlog = LOAD '/user/nitin/server.log' using PigStorage( ) as ( row:chararray );  -- loading data
serverlog = FILTER rawlog BY ( row matches  '.*printQuery.*' ); -- filtering the data  
STORE serverlog into 'serverlog'; --storing data back into HDFS
log = LOAD '/user/nitin/serverlog/part-m-00000' using PigStorage(':') AS (f0,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10); -- loading data
sql = FOREACH log GENERATE f7;  -- transforming data
STORE sql into 'sqlfile'; -- storing result data into HDFS

## Motivation

Purpose of this project is to have such codes handy whenever needed.

## License

A open source
