-- Load input file from HDFS
inputFile = LOAD 'hdfs:///user/puja/input.txt' AS (line:chararray);
-- Tokeize each word in the file (Map)
words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) AS word;
-- Combine the words from the above stage
grpd = GROUP words BY word;
-- Count the occurence of each word (Reduce)
cntd = FOREACH grpd GENERATE $0 AS word, COUNT($1) AS no_of_words;

--To remove old output
rmf hdfs:///user/puja/PigOutput1

-- Store the result in HDFS
STORE cntd INTO 'hdfs:///user/puja/PigOutput1';
