def perm(possibilities, numPerms, str = "", permNo = 0, perms = [])
	if numPerms == 0
		perms << str
		str = ""
		permNo += 1
	end

	if permNo < possibilities.length ** numPerms
		possibilities.each do |poss|
			perm(possibilities, numPerms - 1, str + poss, permNo, perms)
		end
	end

	perms
end

def all_combinations_of_adds(range, num_needed)
	combs = []
	perms = perm(["+", "-", " "], range.to_a.length - 1)
	perms.each_with_index do |perm, index|
		combinations = []
		range.each_with_index { |val, i|
			op = perm[i] == " " ? "" : perm[i]
			combinations << val
			combinations << op.center(perm[i].length + 2) if ["+", "-"].include? op
		}
		r = combinations.inject { |acc, val| acc.to_s + val.to_s}
		res = eval(r)
		combs << r if res == num_needed
	end

	return combs
end

p all_combinations_of_adds(1..9, 100)