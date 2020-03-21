require 'dicom'
require 'rest-client'
include DICOM

HOST = '192.168.0.32'
# HOST = '1.237.206.121'
# HOST = '192.168.0.6'
# HOST = '15.165.171.194'
HOST = 'yousunko.synology.me'
# PORT = '8080'
PORT = '8081'

file_names = [
    './fixture/ejoonie-dicom/00000001.dcm',
    './fixture/ejoonie-dicom/00000002.dcm',
    './fixture/ejoonie-dicom/00000003.dcm',
    './fixture/ejoonie-dicom/00000004.dcm',
    './fixture/ejoonie-dicom/00000005.dcm',
    './fixture/ejoonie-dicom/00000006.dcm',
    './fixture/ejoonie-dicom/00000007.dcm',
    './fixture/ejoonie-dicom/00000008.dcm',
    './fixture/ejoonie-dicom/00000009.dcm',
    './fixture/ejoonie-dicom/00000010.dcm',
    './fixture/ejoonie-dicom/00000011.dcm',
    './fixture/ejoonie-dicom/00000012.dcm',
    './fixture/ejoonie-dicom/00000013.dcm',
    './fixture/ejoonie-dicom/00000014.dcm',
    './fixture/ejoonie-dicom/00000015.dcm',
    './fixture/ejoonie-dicom/00000016.dcm',
    './fixture/ejoonie-dicom/00000017.dcm',
    './fixture/ejoonie-dicom/00000018.dcm',
    './fixture/ejoonie-dicom/00000019.dcm',
    './fixture/ejoonie-dicom/00000020.dcm',
    './fixture/ejoonie-dicom/00000021.dcm',
    './fixture/ejoonie-dicom/00000022.dcm',
    './fixture/ejoonie-dicom/00000023.dcm',
    './fixture/ejoonie-dicom/00000024.dcm',
    './fixture/ejoonie-dicom/00000025.dcm',
    './fixture/ejoonie-dicom/00000026.dcm',
]

files = file_names.map {|f| File.new(f, 'rb')}
# 저장
node  = DClient.new(HOST, 11112, {host_ae: 'DCM4CHEE'})
begin
  # node.send(file_names)
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
# res = RestClient.get("http://#{HOST}:#{PORT}/dcm4chee-arc/aets/DCM4CHEE/rs/studies")
# res = RestClient.get("http://#{HOST}:#{PORT}/dcm4chee-arc/aets/DCM4CHEE/rs/studies/count")
res = RestClient.get("http://#{HOST}:#{PORT}/dcm4chee-arc/aets/DCM4CHEE/rs/instances/count")
p res.body
