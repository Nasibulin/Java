with a as (select p.id_psg, p.name, count(t.trip_no) flights, c.name company from
passenger p
join
pass_in_trip pit on p.id_psg=pit.id_psg
join
trip t on t.trip_no=pit.trip_no
join
company c on t.id_comp=c.id_comp
group by p.name,c.name,p.id_psg
union
select p.id_psg,p.name, count(t.trip_no) flights, 'FLIGHTS_TOTAL' from
passenger p
join
pass_in_trip pit on p.id_psg=pit.id_psg
join
trip t on t.trip_no=pit.trip_no
join
company c on t.id_comp=c.id_comp
group by p.name,p.id_psg)

select name,flights,company from a  where id_psg in (select p.id_psg from
passenger p
join
pass_in_trip pit on p.id_psg=pit.id_psg
join
trip t on t.trip_no=pit.trip_no
join
company c on t.id_comp=c.id_comp
group by p.id_psg having count (distinct c.name)>1)
