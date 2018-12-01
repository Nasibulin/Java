select distinct kpc.model from pc kpc
join laptop dl on kpc.hd=dl.hd
join printer vpp on vpp.price=kpc.price
join laptop ol on kpc.ram=ol.ram and dl.screen=ol.screen+3 and len(vpp.model)=len(ol.model) and substring(vpp.model,3,1)
<>substring(ol.model,3,1) and len(vpp.model)>=3 and len(ol.model)>=3
and left(vpp.model,2)=left(ol.model,2) 
and substring(vpp.model,4,len(vpp.model))=substring(ol.model,4,len(ol.model))

join pc mpc on kpc.speed=mpc.speed
join printer tpp on mpc.price=tpp.price*4 and tpp.type<>vpp.type and tpp.color=vpp.color
where mpc.model in (select distinct pr1.model from product pr1 join product pr2 on pr1.maker=pr2.maker and pr1.type='PC' and 
pr2.type='Laptop' and pr2.model=dl.model)