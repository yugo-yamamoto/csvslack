# ruby csvmessage.rb  [path to messges directory]
require 'json'
require 'pp'

path = ARGV[0]
dir = Dir.open(path)

files = dir.select{|f|
  !f.start_with?(".")
}.map {|f|
  "#{path}/#{f}"
}

files.each {|file_name| 
  json_str = File.open(file_name).read
  json_obj = JSON.load(json_str)
  json_obj.each {|m|
    puts [
          m["user"],
          m["text"].gsub(/(\r\n|\r|\n)/, " "),
          Time.at(m["ts"].to_f).strftime("%Y/%m/%d %H:%M:%S")
      ].join("\t") if m["type"] == "message"
  }
}

