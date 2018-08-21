SELECT Stuff(
  (SELECT N'' + Name FROM aero_search FOR XML PATH(''),TYPE)
  .value('text()[1]','nvarchar(max)'),1,2,N'')