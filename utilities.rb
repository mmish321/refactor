module Utilities
	SECONDS_IN_A_YEAR = 31536000.0
	
	def evaluate_leap_year(year)
	(is_divisible(year,100) && is_divisible(year,400)) || (is_divisible(year,4) && !is_divisible(year,100))  
	end

	def percent_of_the_year(a)
		convert_to_float(year_percent(a)) + '%'
	end

	def convert_to_military_time(x)
		a, b = x.split(":")
		c, d = b.split(" ")
		e = " "
		if d.downcase != 'am'
			e =(a.to_i == 12 ? a + ":" + c : (a.to_i + 12).to_s + ":" + c)
		elsif d.downcase != 'pm'
			e =(a.to_i == 12 ? a + ":" + c : (a.to_i - 12).to_s + ":" + c)
		end
	end

	def convert_to_standard_time(x)
		a, b = x.split(":")
		c = a.to_i == 12 ? a +':' + b + ' pm' : ((a.to_i < 12) ? a + b + ":" + " am" : (a.to_i-12).to_s + ":" + b + " pm")
	end

	def bedtime?(time, bool)
		am_or_pm = time.split(":")[1].split(" ")[1] 
		hours = time.split(":")[0].to_i
		(hours >= 8 && bool || hours >= 10 && !bool) && am_or_pm == 'pm' ? false : true 
	end

	def percentage_of(a, b)
		a < b ? subtracting_percents(b,a) : subtracting_percents(a,b)
	end

	private
	def is_divisible(a,b)
		a % b == 0
	end
	def convert_to_float(x)
		'%.1f' % x
	end
	def year_percent(n)
		(n / SECONDS_IN_A_YEAR) * 100
	end
	def subtracting_percents(a,b)
		('%.1f' % (percent_of_the_year(a)[0..-2].to_f - percent_of_the_year(b)[0..-2].to_f)).to_s + '%'
	end

	


end