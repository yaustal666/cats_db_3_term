UPDATE Animals
SET Sex = 'unknown' WHERE Sex NOT IN('male','female') AND Sex IS NOT NULL;

UPDATE Animals
SET Sex = 'm' WHERE Sex = 'male';

UPDATE Animals
SET Sex = 'w' WHERE Sex = 'female';