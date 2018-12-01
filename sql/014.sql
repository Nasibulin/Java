select distinct pt.id_psg, t_to.date from pass_in_trip pt join trip t_from on t_from.trip_no=pt.trip_no
join (select id_psg, date,town_to,time_out,time_in from pass_in_trip pt join trip t_to on t_to.trip_no=pt.trip_no) t_to
on
t_to.town_to=t_from.town_from
and
t_to.date=pt.date
and
pt.id_psg=t_to.id_psg
and
t_from.time_in<t_to.time_out
and
t_from.time_out<t_from.time_in
and
t_to.time_in>t_to.time_out
