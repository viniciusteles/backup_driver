module BackupDriver
  class StoreCommand < Command
    def do
      driver.log << `/usr/bin/s3cmd put --reduced-redundancy #{encrypted_file} #{bucket}/#{basename}/#{year}/#{month}/`
    end

    def encrypted_file
      driver.encrypt_command.encrypted_file
    end

    def bucket
      options[:bucket]
    end

    def basename
      driver.create_command.basename
    end

    def year
      driver.time.strftime("%Y")
    end

    def month
      driver.time.strftime("%m-%b")
    end
  end
end
