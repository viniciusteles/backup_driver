module BackupDriver
  class CleanCommand < Command
    def do
      remove_backup_file
      remove_encrypted_file
      remove_source_files
    end

    def remove_backup_file
      driver.log << `/bin/rm #{driver.create_command.backup_file}`
    end

    def remove_encrypted_file
      driver.log << `/bin/rm #{driver.encrypt_command.encrypted_file}`
    end

    def remove_source_files
      driver.log << `/bin/rm #{driver.create_command.source}/*`
    end
  end
end
