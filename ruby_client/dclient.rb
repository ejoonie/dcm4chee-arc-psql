require 'dicom'
require 'rest-client'
include DICOM

# 저장
# node  = DClient.new('localhost', 11112, {host_ae: 'DCM4CHEE'})
# node.send('./fixture/00000002.dcm')

# 저장 STOW-RS
# https://github.com/dcm4che/dcm4chee-arc-light/wiki/Store-objects-by-STOW-RS
# files = [
#     File.open('./fixture/00000001.dcm', 'rb'),
#     File.open('./fixture/00000002.dcm', 'rb'),
#     File.open('./fixture/00000003.dcm', 'rb'),
#     File.open('./fixture/00000004.dcm', 'rb'),
# ]
# begin
# RestClient.post(
#     'http://0.0.0.0:8080/dcm4chee-arc/aets/DCM4CHEE/rs/studies',
#     files: files,
#     content_type: 'application/dicom+json')
# rescue Exception => e
#  p(e)
# end


# 조회
# https://github.com/dcm4che/dcm4chee-arc-light/wiki/RESTful-Services#wado_rs
res = RestClient.get('http://0.0.0.0:8080/dcm4chee-arc/aets/DCM4CHEE/rs/studies')
res = RestClient.get('http://0.0.0.0:8080/dcm4chee-arc/aets/DCM4CHEE/rs/studies/count')
res = RestClient.get('http://0.0.0.0:8080/dcm4chee-arc/aets/DCM4CHEE/rs/instances/count')
p res.body
