SELECT s.city FROM station AS s WHERE LOWER(SUBSTR(s.city,1,1)) IN ('i','e','a','o','u');
