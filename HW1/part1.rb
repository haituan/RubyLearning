def sum arr
  rs = 0
	arr.each { |x|
		rs += x
	}
	puts rs
end

def max_2_sum arr
	rs = 0
	if arr.length >= 2
		arr = arr.sort.reverse
		rs += arr[0] + arr[1]
	else 
		if arr.length == 1 
			rs = arr[0]
		end
	end
	puts rs
end

def sum_to_n (arr, n)
	rs = false
	if arr.length >= 2
		while(!arr.empty?)
			trest = n - arr.pop
			if arr.include?(trest)
				rs = true
				break
			end
		end
	end
	puts rs
end 
