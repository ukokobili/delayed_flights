{% macro get_quarter(d) -%}
    
    case 
        when CAST(QUARTER( {{ d }} ) AS INT) = 4 then 'Q4'
        when CAST(QUARTER( {{ d }} ) AS INT) = 3 then 'Q3'
        when CAST(QUARTER( {{ d }} ) AS INT) = 2 then 'Q2'
        else 'Q1'
    end

{%- endmacro %}

{% macro get_int(int) -%}
    
    CAST( {{int}} AS INT)

{%- endmacro %}