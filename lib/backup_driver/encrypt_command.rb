module BackupDriver
  class EncryptCommand < Command
    def do
      driver.log << `/usr/bin/gpg #{options[:gpg_options]} --encrypt --compress-algo bzip2 --output #{encrypted_file} #{backup_file}`
    end

    def encrypted_file
      "#{backup_file}.gpg"
    end

    def backup_file
      driver.create_command.backup_file        
    end
  end
end
