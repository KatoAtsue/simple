# using open-uri
# create text data

require 'open-uri'

docs = "docs.txt"

# url host name
domain = "http://www.hostname/"

# url directory file name
uri = [
  "sample/sample1.html",
  "sample/sample2.html",
  "sample/sample3.html"
]
fh = open(docs,"w")
str = ''
num = 30
uri.each_with_index{|n, i|
  url = domain + n
  open(url){|f|
    str += "------\n"
    str += "00" + (i + num).to_s
    str += f.read
  }
}
fh.write str
fh.close
