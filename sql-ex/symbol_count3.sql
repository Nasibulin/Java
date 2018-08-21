select substring(
        (select ''+Name AS 'data()' from aero_search for xml path(''))
       ,3, 255) as "MyList"