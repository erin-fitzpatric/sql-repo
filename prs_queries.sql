-- Be able to recognize the correct SQL statements for requests like these:

	-- 1. Display all rows and columns from a table and sort by a column in that table.
    select * from product
		order by price;
    
    -- 2. Display all columns from a table but only those rows where a column contains A or B or C.
    select vendorID, PartNumber, Price from product;
    
    -- 3. A valid join of two tables. 
    -- EX: Join to show all vendor and product
SELECT vendor.ID, product.name, vendor.email
FROM vendor
JOIN product
	on vendor.ID = product.vendorID;
        
    -- 1. Know what NULL means.
    -- Null = No value.
    
    -- 2. Know what the aggregate functions (min, max, count, sum, avg) do.
		-- Min() = returns the smallest number in  a set of numbers.
		-- Max() = returns the largest number in a set of numbers.
		-- Count() = returns an int value based on the number of occurences in a result set.
		-- Sum() = only operates on numberic columns and calculates to total all of the result set rows for that value.
		-- Avg() = calculates the mean from a set of numbers. 
		
    -- 3. Know what 'group by' and 'having' clauses do and when you can use them.
		-- groups rows that have the same values into summary rows, like "find the number of customers in each country"
        -- 
        
        
    -- 4. Know the two ways of adding comments and what each one does.
		/* */    
		-- 
        
    -- 5. Know what columns from a table must be included in the INSERT column list
    
    -- 6. Know the effects of executing UPDATE or DELETE.
    -- modifies existing records in a table
    -- deletes existing records in a table
    
    -- 7. Know the function that will take two or more strings, join them together, and return one string. 
    Select concat('stringone', 'string two');