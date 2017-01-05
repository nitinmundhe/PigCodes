/* Our raw server log is stored at /user/nitin/server.log */

--hdfs dfs -rm -r /user/nitin/serverlog --to remove files from previous run
--hdfs dfs -rm -r /user/nitin/sqlfile --to remove files from previous run

rawlog = LOAD '/user/nitin/server.log' using PigStorage( ) as ( row:chararray );  -- loading data
serverlog = FILTER rawlog BY ( row matches  '.*printQuery.*' ); -- filtering the data  
STORE serverlog into 'serverlog'; --storing data back into HDFS
log = LOAD '/user/nitin/serverlog/part-m-00000' using PigStorage(':') AS (f0,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10); -- loading data
sql = FOREACH log GENERATE f7;  -- transforming data
STORE sql into 'sqlfile'; -- storing result data into HDFS