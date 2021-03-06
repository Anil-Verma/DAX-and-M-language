* Creating a library for proc_sql_Data;
libname procsql "/home/PATH/Proc_sql/data";


***		GROUP BY IF NOT ACCOMPAINED BY AGGREGATE FUNCTION		***;
PROC SQL;
	SELECT PRODTYPE,
			PRODCOST
	FROM PROCSQL.PRODUCTS
	GROUP BY PRODTYPE;
QUIT;


*** CHEAPEST IN PRODTYPE 		**;
PROC SQL;
	SELECT PRODTYPE, MIN(PRODCOST) AS CHEAPEST 
			FORMAT=DOLLAR7.2 LABEL='LEAST EXPENSIVE'
	FROM PROCSQL.PRODUCTS
	GROUP BY PRODTYPE;
QUIT;

***		GROUPING DATA AND SORTING 		***;
PROC SQL;
	SELECT PRODTYPE,
			MIN(PRODCOST) AS CHEAPEST FORMAT=DOLLAR9.2 LABEL='LEAST EXPENSIVE'
	FROM PROCSQL.PRODUCTS
	GROUP BY PRODTYPE
	ORDER BY CHEAPEST;
QUIT;


/***		SUBSETTING WITH HAVING		**/
PROC SQL;
	SELECT PRODTYPE,
			AVG(PRODCOST) AS AVG_PRODCOST FORMAT=DOLLAR9.2 LABEL='AVERAGE PRODUCT COST'
	FROM PROCSQL.PRODUCTS
	GROUP BY PRODTYPE
	HAVING AVG_PRODCOST <= 400;
QUIT;


PROC SQL;
	SELECT PRODTYPE,
			AVG(PRODCOST) AS AVG_PRODCOST FORMAT=DOLLAR9.2 LABEL='AVERAGE COST'
	FROM PROCSQL.PRODUCTS
	WHERE UPCASE(PRODTYPE) IN ('SOFTWARE', 'LAPTOP', 'PHONE')
	GROUP BY PRODTYPE
	HAVING AVG_PRODCOST >100
	ORDER BY AVG_PRODCOST;
QUIT;
	