wordCount_load = LOAD 'inputfiles/wordCount' as (line:chararray);
wordCount_split = FOREACH wordCount_load GENERATE FLATTEN(TOKENIZE(line)) as words; 
word_group = GROUP wordCount_split by words ;
wordCount = FOREACH word_group GENERATE group , COUNT(wordCount_split);
STORE wordCount INTO 'outputPig/Assignment4_3_OP' ;

