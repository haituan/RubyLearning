def hello(name)
  puts "Hello, " + name
end

def start_with_consonant? s
  rs = true
  if s.empty? 
    rs = false
  else 
    fch = s.downcase.chr
    if (/[a-z]/.match(fch))
      case fch
      when 'a', 'e', 'i', 'o', 'u'
        rs = false
      end
    else
      rs = false
    end
  end
  rs
end

def binary_multiple_of_4? s 
  rs = true
  s.each_char { |ch| 
    if (ch != '0')
      n = s.to_i(2)
      if (n != 0 && n % 4 == 0)
        rs = true
      else
	rs = false
      end	
      break
    end
  }
  rs
end
