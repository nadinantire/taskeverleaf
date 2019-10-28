     USER
     
column            | datatype
------------------| -------------
id                | integer
email             | string
password          | string
re_enter password | string

TASK

columns           | datatype
------------------| -------------
id                | integer
name              | string
content           | string
stutus            | string
user_id(FK)       | references
priority          | priority
stated_date       | date
end_date          | date
