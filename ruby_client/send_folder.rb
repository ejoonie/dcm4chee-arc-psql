require 'dicom'
require 'rest-client'
include DICOM


module SendFolder

  # HOST = 'localhost'
  HOST = '192.168.0.32'
# HOST = '192.168.0.6'
# HOST = 'yousunko.synology.me'
  PORT = '8080'
# PORT = '8081'

  def current_count
    res = RestClient.get("http://#{HOST}:#{PORT}/dcm4chee-arc/aets/DCM4CHEE/rs/instances/count")
    JSON.parse(res)['count']
  end

  def patients_count
    res = RestClient.get("http://#{HOST}:#{PORT}/dcm4chee-arc/aets/DCM4CHEE/rs/patients/count")
    JSON.parse(res)['count']
  end

  def send_folder(folder_path)
    # 로그파일
    log = Logger.new('log/send_folder.log')

    # DICOM node
    node  = DClient.new(HOST, 11112, {host_ae: 'DCM4CHEE'})

    # 전송 성공한 파일들
    success_file = 'success.json'

    # 전송 실패한 파일들
    failure_file = 'failure.json'

    # 오브젝트
    success = JSON.parse(File.read(success_file))
    failure = JSON.parse(File.read(failure_file))


    # all dicom files
    dicom_files = Dir.glob(File.join("**", "*.dcm"), base: folder_path).map{|f| File.join(folder_path, f)}
    total_file_count = dicom_files.length
    processed_file_count = 0
    success_file_count = 0
    failure_file_count = 0


    # initial report
    log.debug "total: #{total_file_count}"
    files_to_send = dicom_files - success.keys

    if files_to_send.length <= 0
      log.debug("Nothing to do with #{folder_path}")
    end

    file_count_before_sending = current_count
    log.debug("file count before #{folder_path}: #{file_count_before_sending}")

    while processed_file_count < files_to_send.length
      block = dicom_files[processed_file_count...processed_file_count + 64]

      begin
        node.send(block)
        success.merge! block.map {|f| [f, DateTime.now.strftime]}.to_h
        success_file_count += block.length
      rescue => e
        failure.merge! block.map {|f| [f, DateTime.now.strftime]}.to_h
        failure_file_count += block.length
      end

      processed_file_count += block.length
    end


    # final report
    file_count_after_sending = current_count
    log.debug("processed: #{processed_file_count}, success: #{success_file_count}, failure: #{failure_file_count} / #{total_file_count}")
    log.debug("file count after #{folder_path}: #{file_count_after_sending}")

    if file_count_before_sending + processed_file_count > file_count_after_sending
      log.error("#{folder_path}, #{file_count_before_sending} + #{processed_file_count} != #{file_count_before_sending}")
      File.write(failure_file, failure.to_json)
    else
      log.debug("success: #{folder_path}")
      File.write(success_file, success.to_json)
    end
  end
end
