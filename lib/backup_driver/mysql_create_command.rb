module BackupDriver
  class MysqlCreateCommand < CreateCommand
    def prepare_source
      driver.log << `/bin/mkdir -p #{temp_dir}/mysql`
      driver.log << `/usr/bin/mysqldump -u #{options[:user]} #{password_params} #{options[:name]} > #{source}/#{options[:name]}.sql`
    end

    def backup_basename
      options[:name]
    end
    
    def source
      "#{temp_dir}/mysql"
    end

    def password_params
      return "-p #{options[:password]}" if options[:password]
      ""
    end
  end
end
