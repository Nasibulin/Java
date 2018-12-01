select p1.maker,

case p2.pc when 0 then 'no' else ('yes('+cast(p1.pc as varchar)+')') end pc,
case p2.laptop when 0 then 'no' else ('yes('+cast(p1.laptop as varchar)+')') end laptop,
case p2.printer when 0 then 'no' else ('yes('+cast(p1.printer as varchar)+')') end printer

from (select pr.maker,count(distinct p.model) pc,count(distinct l.model) laptop,count(distinct pp.model) printer from product pr left join pc p on p.model=pr.model left join printer pp on pr.model=pp.model left join laptop l on pr.model=l.model group by maker) p1
join 
(SELECT maker, [pc], [laptop], [printer]
FROM Product
PIVOT
(
count(model)
FOR type
IN([pc], [laptop], [printer])
) pvt) p2 on p1.maker=p2.maker
