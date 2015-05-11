# Write a function that given a list of non negative integers, arranges them such that they form the largest possible number. 
# For example, given [50, 2, 1, 9], the largest formed number is 95021.

def largest_num(ary)
	sorted = ary.sort { |a, b|
		(b.to_s + a.to_s).to_i <=> (a.to_s + b.to_s).to_i
	}
end

p largest_num([50, 2, 1, 9]) #95021

