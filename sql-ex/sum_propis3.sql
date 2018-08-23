select 
model, price,
pricename
from (
	select 
	model, price, cast(rtrim(ltrim(replace(hundreds + ' ' + tens + ' ' + ones, '  ', ' '))) as char(50)) pricename
	from ( 
		select 
		model, price, 
		case (price / 100) % 10 
			when 9 then 'nine hundred' 
			when 8 then 'eight hundred' 
			when 7 then 'seven hundred'
			when 6 then 'six hundred' 
			when 5 then 'five hundred' 
			when 4 then 'four hundred' 
			when 3 then 'three hundred' 
			when 2 then 'two hundred' 
			when 1 then 'one hundred' 
			else '' 
		end 
		hundreds, 
		case (price / 10) % 10 
			when 2 then 'twenty' 
			when 3 then 'thirty' 
			when 4 then 'forty' 
			when 5 then 'fifty' 
			when 6 then 'sixty' 
			when 7 then 'seventy' 
			when 8 then 'eighty' 
			when 9 then 'ninety'
			else case price % 100 
				when 10 then 'ten' 
				when 11 then 'eleven' 
				when 12 then 'twelve' 
				when 13 then 'thirteen' 
				when 14 then 'fourteen' 
				when 15 then 'fifteen' 
				when 16 then 'sixteen' 
				when 17 then 'seventeen' 
				when 18 then 'eighteen' 
				when 19 then 'nineteen' 
				else '' 
			end
		end tens, 
		case 
			when (price / 10) % 10 != 1 then 
				case price % 10 
					when 1 then 'one' 
					when 2 then 'two' 
					when 3 then 'three' 
					when 4 then 'four' 
					when 5 then 'five' 
					when 6 then 'six' 
					when 7 then 'seven' 
					when 8 then 'eight' 
					when 9 then 'nine' 
					else '' 
				end 
			else '' 
		end ones 
		from ( 
			select distinct 
			model, 
			cast(price as int) price 
			from pc 
			where price < 1000 and price > 0
		) as a 
	) as b
) as c