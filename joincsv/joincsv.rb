#! ruby -Ks
# coding: windows-31j

ary = Dir.glob("csv/*")

filename1 = "data1.csv"
filename2 = "data2.csv"

fh1 = open(filename1,"w")
fh2 = open(filename2,"w")

str1 = ""
str2 = ""

ary.each_with_index{|n, i|
  fn = n
  f = open(fn)
  case n
  when /report1.csv/s
    str1 += "----------\n"
    str1 += "C" + (i + 1).to_s + ","
    str1 += n + "\n"
    str1 += f.read
  when /report2.csv/s
    str2 += "----------\n"
    str2 += "C" + (i + 1).to_s + ","
    str2 += n + "\n"
    str2 += f.read
  end
  f.close
} 

str1 += "----------\n"
str1.gsub!(/,※(.+?)-----/m, "-----")
str1.gsub!(/^[1-8],,,,,,,,,\n/, "")
str2.gsub!(/^（report 1）(,+)\n/, "")

str2 += "----------\n"
str2.gsub!(/,※(.+?)-----/m, "-----")
str2.gsub!(/^[1-8],,,,,,,,,,\n/, "")
str2.gsub!(/^（report 2）(,+)\n/, "")

fh1.write str1
fh2.write str2

fh1.close
fh2.close
