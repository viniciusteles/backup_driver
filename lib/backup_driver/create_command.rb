module BackupDriver
  class CreateCommand < Command
    def do
      create_temp_dir
      prepare_source
      driver.log << `/bin/tar -C #{source_parent} -cvf #{backup_file} #{source_basename}`
    end

    def create_temp_dir
      driver.log << `/bin/mkdir -p #{temp_dir}`
    end

    def temp_dir
      "/tmp/backup_driver"
    end

    def prepare_source
     # Implemented in subclasses only 
    end

    def backup_file
      "#{temp_dir}/#{file_name}"
    end

    def file_name
      "#{backup_basename}-#{formatted_time}.tar"
    end

    def backup_basename
      source_basename
    end
    
    def source_basename
      File.basename(source)
    end

    def source
      options[:source]
    end

    def source_parent
      File.dirname(source)
    end

    def formatted_time
      driver.time.strftime("%Y%m%d-%H%M%S")
    end
  end
end
