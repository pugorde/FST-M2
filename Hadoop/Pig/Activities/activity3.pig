--LOAD csv data into pig
salesInput = LOAD 'hdfs:///user/puja/sales.csv' USING PigStorage(',') AS (Product:chararray,Price:chararray,Payment_Type:chararray,Name:chararray,City:chararray,State:chararray,Country:chararray);
--Group data by country
grpd = GROUP salesInput BY Country;
--count the number of rows
totalCount = FOREACH grpd GENERATE CONCAT((chararray)$0, CONCAT(':', (chararray)COUNT($1)));
--remove old output
rmf hdfs:///user/puja/PigOutput2;
--store thr output in the HDFS
STORE totalCount INTO 'hdfs:///user/puja/PigOutput2';
