module BackupDriver
  class CleanCommand < Command
    def do
      remove_source_files
      remove_temp_dir
    end

    def remove_source_files
      driver.log << `/bin/rm #{driver.create_command.source}/*`
    end

    def remove_temp_dir
      driver.log << `/bin/rm -r #{driver.create_command.temp_dir}`
    end
  end
end
