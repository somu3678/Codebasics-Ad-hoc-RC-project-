use gdb023;

###### Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.######

SELECT                
DISTINCT market
FROM gdb023.dim_customer                                          --- Calculated list of unique markets in "Atliq Exclusive" customer and "APAC" region.
WHERE customer = "Atliq Exclusive" AND region = "APAC";

