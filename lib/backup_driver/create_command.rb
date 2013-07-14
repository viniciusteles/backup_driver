module BackupDriver
  class CreateCommand < Command
    def do
      driver.log << `/bin/tar cvf #{backup_file} #{source}`
    end

    def backup_file
      "#{temp_dir}/#{file_name}"
    end

    def source
      options[:source]
    end

    def temp_dir
      "/tmp"
    end

    def file_name
      "#{basename}-#{formatted_time}.tar"
    end

    def basename
      File.basename(source)
    end
    
    def formatted_time
      driver.time.strftime("%Y%m%d-%H%M%S")
    end
  end
end
