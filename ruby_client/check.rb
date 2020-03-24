require 'json'
require './send_folder.rb'
include SendFolder

DATA_ROOT = "/usr/src/data"
p "local patients count: #{Dir.glob('*', base: DATA_ROOT).length}"
p "local file count: #{Dir.glob(File.join("**", "*.dcm"), base: DATA_ROOT).length}"

# success = JSON.parse(File.read('success.json'))
# p "success.json count: #{success.size}"

p "server file count: #{current_count}"
p "server patients count: #{patients_count}"


