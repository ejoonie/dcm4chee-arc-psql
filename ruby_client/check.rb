require 'json'
require './send_folder.rb'
include SendFolder

success = JSON.parse(File.read('success.json'))
p "success.json count: #{success.size}"

p "server file count: #{current_count}"


