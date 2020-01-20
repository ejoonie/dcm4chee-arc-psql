require 'dicom'
include DICOM

node  = DClient.new('localhost', 11112, {host_ae: 'DCM4CHEE'})
node.send('./fixture/00000002.dcm')

