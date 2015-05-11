# Challenge: From a list of overlapping sub strings, piece together the expected phrase.
# Rules: All phrases start with "intuit:" and are followed by one or more words

def find_phrase(chunks)
	key = "intuit:"

	max = ["", ""]
	chunks.each do |chunk|
		if chunk.include? ":"
			split = chunk.split(":")
			max[1] = split[1] if split[1].to_s.length > max[1].length
			max[0] = split[0].gsub(key[0..-2], "") if split[0].to_s.length > max[0].length && split[0].to_s.length >= key.length
		end
	end

	use = max[1]
	phrases = []
	phrases[1] = key + use
	
	while use.length > 1
		chunks.each_with_index do |chunk, index|
			if chunk.start_with? use
				use = chunk.gsub(use, "")
				phrases[1] += use
				break
			end
		end
		use = use[1..-1]
	end
	use = max[0]
	phrases[0] = use

	while use.length > 1
		chunks.each do |chunk|
			if chunk.include? use
				chunks.delete(chunk)
				use = chunk[0...(chunk =~ /#{use}/)]
				phrases[0] = use + phrases[0]
				break
			end
		end
		use = use[0..-2]
	end

	join_phrases(phrases)
end

def join_phrases(phrases)
	phrases.sort_by { |phrase| phrase.length }
	index = phrases[0].length - 1
	while index > 0
		if phrases[1].include? phrases[0][0..index]
			return phrases[1] + phrases[0][(index + 1)..-1]
			break
		end
		index -= 1
	end

	return phrases[1]
end



one = ["dintui", ": be b", "uit: be", "dintui", " bold", ": be", "dintui", " be bold", "t: be bo", "intu"]
two = ["t com", "y withou", "without co", "romiseintui", "uit", "intu", " wit", " integrity", "ompro", ": in", " wi", " integrity", "ity without", "eintuit: inte", "miseintui", "it: integ", "iseintuit:"]

p find_phrase(one)
p find_phrase(two)