with
gs as (select max(count(o1.battle)) over() mx, count(o1.battle) cnt,
o1.ship s1,o2.ship s2,o3.ship s3 from outcomes o1 join outcomes o2 on o1.battle=o2.battle join outcomes o3 on o1.battle=o3.battle where o1.ship<o2.ship and o2.ship<o3.ship and o1.ship<o3.ship group by o1.ship,o2.ship,o3.ship
),
ts as (select row_number() over (order by s1,s2,s3) numb,s1,s2,s3 from gs where mx=cnt)

select numb, choose(v,s1,s2,s3) as ship from ts cross join (values(1),(2),(3))V(v)
