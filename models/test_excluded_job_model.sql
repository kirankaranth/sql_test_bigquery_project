WITH all_type_table AS (

  SELECT * 
  
  FROM {{ source('prophecy-qa.qa_test_dataset', 'all_type_table') }}

)

SELECT *

FROM all_type_table
