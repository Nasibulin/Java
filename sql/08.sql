select name,convert(date,date) date,

convert(date,
dateadd(day,
 (5-6-datepart(weekday, dateadd(day,-1, dateadd(month,1, convert(char(6),date,112)+'01'))))%7,
 dateadd(day,-1, dateadd(month,1, convert(char(6),date,112)+'01')))
) fri

from battles
