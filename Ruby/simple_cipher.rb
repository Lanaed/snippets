def north_korean_cipher(coded_message)

  input = coded_message.downcase.split("")

  decoded_sentence = []

  input.each do |x|
      if (x.ord >= 101 && x.ord <= 122)
        z = (x.ord - 4).chr
        decoded_sentence << z
      elsif (x.ord >= 97 && x.ord <= 100)
        z = (x.ord + 22).chr
        decoded_sentence << z
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*"
        decoded_sentence << " "
      elsif (0..9).to_a.include?(x)
        decoded_sentence << x
      else
        decoded_sentence << x
      end

  end
  decoded_sentence = decoded_sentence.join("")

  if decoded_sentence.match(/\d+/)
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 }
  end

  return decoded_sentence
end

# Driver Test Code:
p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.")
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!")
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.")
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!")
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?")
