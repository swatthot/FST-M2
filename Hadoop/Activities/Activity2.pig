-- Load input file from HDFS
inputFile = LOAD 'hdfs:///user/swatthot/file01.txt' AS (line);
-- Tokeize each word in the file (Map)
words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) AS word;
-- Combine the words from the above stage
grpd = GROUP words BY word;
-- Count the occurence of each word (Reduce)
cntd = FOREACH grpd GENERATE group,$0, COUNT(words);
-- Remove the old results
rmf 'hdfs:///user/swatthot/results';
-- Store the result in HDFS
STORE cntd INTO 'hdfs:///user/swatthot/results';

// Input 
This is an example file
This is an example line

// Expected Output
 $0         , $1
 This       , 2
 is         , 2
 an         , 2
 example    , 2
 file       , 1
 line       , 1