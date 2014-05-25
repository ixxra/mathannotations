require 'json'


nb = JSON::parse(File.read ARGV[0])
puts nb
