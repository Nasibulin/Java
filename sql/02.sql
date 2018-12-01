select ship,
STUFF(ship,
CHARINDEX(' ', ship)+1,
datalength(ship)-CHARINDEX(' ', REVERSE(ship))-CHARINDEX(' ', ship),
REPLICATE(CHAR(ASCII('*')),datalength(ship)-CHARINDEX(' ', REVERSE(ship))-CHARINDEX(' ', ship)))
new_name

 from outcomes

where STUFF(ship,
CHARINDEX(' ', ship)+1,
datalength(ship)-CHARINDEX(' ', REVERSE(ship))-CHARINDEX(' ', ship),
REPLICATE(CHAR(ASCII('*')),datalength(ship)-CHARINDEX(' ', REVERSE(ship))-CHARINDEX(' ', ship))) is not null
and CHARINDEX(' ', ship)<>0
