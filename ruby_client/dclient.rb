require 'logger'
require './send_folder.rb'
include SendFolder

DATA_ROOT = "/Users/ejoonie/Documents/TestDICOM"
# send folder
Dir.glob('*', base: DATA_ROOT).each do |patient_folder|
  p patient_folder
  dir = File.join(DATA_ROOT, patient_folder)
  p dir
  send_folder(dir)
end

# send_folder('./fixture')
# 저장 STOW-RS - 해결못함
# https://github.com/dcm4che/dcm4chee-arc-light/wiki/Store-objects-by-STOW-RS
# begin
# RestClient.post(
#     'http://0.0.0.0:8080/dcm4chee-arc/aets/DCM4CHEE/rs/studies',
#     File.open('./fixture/00000003.dcm', 'r'),
#     content_type: 'application/dicom+json',
#     multipart: true)
#     # content_type: 'application/dicom+json')
# rescue Exception => e
#  p(e)
# end
