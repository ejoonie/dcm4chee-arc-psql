require 'logger'
require './send_folder.rb'
include SendFolder

# DATA_ROOT = "/Users/ejoonie/Documents/TestDICOM"
DATA_ROOT = "/usr/src/data"
# send folder
Dir.glob('*', base: DATA_ROOT).each do |patient_folder|
  p patient_folder
  dir = File.join(DATA_ROOT, patient_folder)
  p dir
  send_folder(dir)
end

missing = ["DMC1463",
"DMC1464",
"DMC1465",
"DMC1466",
"DMC1467",
"DMC1468",
"DMC1469",
"DMC1470",
"DMC1471",
"DMC1472",
"DMC1473",
"DMC1474",
"DMC1476",
"DMC1477",
"DMC1478",
"DMC1479",
"DMC1480",
"DMC1481",
"DMC1482",
"DMC1483",
"DMC1484",
"DMC1485",
"DMC1486",
"DMC1487",
"DMC1488",
"DMC1489",
"DMC1490",
"DMC1491",
"DMC1492",
"DMC1493",
"DMC1494",
"DMC1495",
"DMC1497",
"DMC1498",
"DMC1500",
"DMC1501",
"DMC1502",
"DMC1503",
"DMC1504",
"DMC1505",
"DMC1506",
"DMC1507",
"DMC1508",
"DMC1509",
"DMC1510",
"DMC1511",
"DMC1512",
"DMC1513",
"DMC1514",
"DMC1515",
"DMC1516",
"CAUH1001",
"CAUH1002",
"CAUH1003",
"CAUH1004",
"CAUH1001",
"CAUH1002",
"CAUH1003",
"CAUH1004",
"CAUH1005",
"CAUH1006",
"CAUH1007",
"CAUH1008,",
"CAUH1001",
"CAUH1002",
"CAUH1003",
"CAUH1004",
"CAUH1005",
"CAUH1006",
"CAUH1007",
"CAUH1008,",
"CAUH1009",
"CAUH1010",
"CAUH1001",
"CAUH1011",
"CAUH1002",
"CAUH1012",
"CAUH1013,",
"CAUH1014",
"CAUH1015",
"CAUH1016",
"CAUH1017",
"CAUH1018",
"CAUH1019,",
"CAUH1021",
"CAUH1022",
"CAUH1023",
"CAUH1024",
"CAUH1025",
"CAUH1026",
"CAUH1027,",
"CAUH1028",
"CAUH1029",
"DMC1517"]

missing.each do |patient_folder|
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
