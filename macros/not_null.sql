{% test_not_null(t_name,column_name) %}
   select *
   from 
   t_name
   where
   column_name is not_null

{% endtest %}