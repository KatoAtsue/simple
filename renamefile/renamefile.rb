# coding: windows-31j

lines = 0

open("csv/sample.csv") {|file|
  while l = file.gets
    lines += 1
    if lines < 10
        num = "0" + lines.to_s
      else
        num = lines.to_s
    end
    org_name = "files/doc_" + lines.to_s + ".pdf"
    dataname = "address/d" + num + "_" + l.split(",")[1].gsub(/(\s|　)+/, '') + "_" + l.split(",")[2].gsub(/(\s|　)+/, '') + "様.pdf"
    File.rename(org_name, dataname)
  end
}
