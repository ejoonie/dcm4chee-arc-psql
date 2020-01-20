require 'dicom'
require 'rest-client'
include DICOM

files = [
    File.new('./fixture/00000001.dcm', 'rb'),
    File.new('./fixture/00000002.dcm', 'rb'),
    File.new('./fixture/00000003.dcm', 'rb'),
    File.new('./fixture/00000004.dcm', 'rb'),
]
file_names = [
    './fixture/00000001.dcm',
    './fixture/00000002.dcm',
    './fixture/00000003.dcm',
    './fixture/00000004.dcm',
    './fixture/00000005.dcm',
    './fixture/00000006.dcm',
    './fixture/00000007.dcm',
    './fixture/00000008.dcm',
    './fixture/00000009.dcm',
    './fixture/00000010.dcm',
    './fixture/00000011.dcm',
    './fixture/00000012.dcm',
    './fixture/00000013.dcm',
    './fixture/00000014.dcm',
    './fixture/00000015.dcm',
    './fixture/00000016.dcm',
    './fixture/00000017.dcm',
    './fixture/00000018.dcm',
    './fixture/00000019.dcm',
    './fixture/00000020.dcm',
    './fixture/00000021.dcm',
    './fixture/00000022.dcm',
    './fixture/00000023.dcm',
    './fixture/00000024.dcm',
    './fixture/00000025.dcm',
    './fixture/00000026.dcm',
]

files = file_names.map {|f| File.new(f, 'rb')}
# 저장
node  = DClient.new('localhost', 11112, {host_ae: 'DCM4CHEE'})
begin
  node.send(file_names)
rescue Exception => e
  p(file_names)
end


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


# 조회
# https://github.com/dcm4che/dcm4chee-arc-light/wiki/RESTful-Services#wado_rs
res = RestClient.get('http://0.0.0.0:8080/dcm4chee-arc/aets/DCM4CHEE/rs/studies')
res = RestClient.get('http://0.0.0.0:8080/dcm4chee-arc/aets/DCM4CHEE/rs/studies/count')
res = RestClient.get('http://0.0.0.0:8080/dcm4chee-arc/aets/DCM4CHEE/rs/instances/count')
p res.body
