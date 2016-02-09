# ruby csvuser.rb user.json
require 'json'

json_str = json_str = File.open(ARGV[0]).read
json_obj = JSON.load(json_str)

json_obj.each {|user|
  puts [user["id"],user["name"]].join("\t")
}

