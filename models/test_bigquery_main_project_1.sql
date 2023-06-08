WITH hundred_rows_table AS (

  SELECT * 
  
  FROM {{ source('prophecy-qa.qa_test_another_dataset', 'hundred_rows_table') }}

),

all_type_table AS (

  SELECT * 
  
  FROM {{ source('prophecy-qa.qa_test_dataset', 'all_type_table') }}

),

Join_2 AS (

  SELECT 
    in0.c_int64 AS c_int64,
    in0.c_bignumeric AS c_bignumeric,
    in0.c_bool AS c_bool,
    in0.c_bytes AS c_bytes,
    in0.c_string AS c_string,
    in0.c_float64 AS c_float64,
    in0.c_numeric_1 AS c_numeric_1,
    in0.c_numeric_2 AS c_numeric_2,
    in0.c_date AS c_date,
    in0.c_interval AS c_interval,
    in0.c_time AS c_time,
    in0.c_timestamp AS c_timestamp,
    in0.c_datetime AS c_datetime,
    in0.c_geography AS c_geography,
    in0.c_json AS c_json,
    in0.c_array_int64 AS c_array_int64,
    in0.c_struct AS c_struct,
    in0.p_date AS p_date
  
  FROM all_type_table AS in0
  INNER JOIN hundred_rows_table AS in1
     ON in0.c_int64 != in1.a

),

Limit_1_1 AS (

  SELECT * 
  
  FROM Join_2 AS in0
  
  LIMIT 10

),

service_classification_test AS (

  SELECT * 
  
  FROM {{ ref('service_classification_test')}}

),

test_sql_databricks_useall AS (

  SELECT * 
  
  FROM {{ ref('test_sql_databricks_useall')}}

),

Join_1 AS (

  SELECT 
    in0.c_if AS c_if,
    in0.code AS code,
    in0.service_label AS service_label,
    in0.NZHSC_Level_2_Code_HS4 AS NZHSC_Level_2_Code_HS4,
    in0.NZHSC_Level_1_Code_HS2 AS NZHSC_Level_1_Code_HS2,
    in0.NZHSC_Level_2 AS NZHSC_Level_2,
    in0.NZHSC_Level_1 AS NZHSC_Level_1,
    in0.Status_HS4 AS Status_HS4
  
  FROM test_sql_databricks_useall AS in0
  INNER JOIN service_classification_test AS in1
     ON in0.service_label != in1.code

),

Limit_1 AS (

  SELECT * 
  
  FROM Join_1 AS in0
  
  LIMIT 10

),

Join_3 AS (

  SELECT 
    in1.c_int64 AS c_int64,
    in1.c_bignumeric AS c_bignumeric,
    in1.c_bool AS c_bool,
    in1.c_bytes AS c_bytes,
    in1.c_string AS c_string,
    in1.c_float64 AS c_float64,
    in1.c_numeric_1 AS c_numeric_1,
    in1.c_numeric_2 AS c_numeric_2,
    in1.c_date AS c_date,
    in1.c_interval AS c_interval,
    in1.c_time AS c_time,
    in1.c_timestamp AS c_timestamp,
    in1.c_datetime AS c_datetime,
    in1.c_geography AS c_geography,
    in1.c_json AS c_json,
    in1.c_array_int64 AS c_array_int64,
    in1.c_struct AS c_struct,
    in1.p_date AS p_date
  
  FROM Limit_1 AS in0
  INNER JOIN Limit_1_1 AS in1
     ON in0.c_if != in1.c_string

)

SELECT *

FROM Join_3
