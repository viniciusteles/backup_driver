module BackupDriver
  class CLI < Thor
    desc 'files', "Backup a file or directory"
    option :gpg_options
    option :source, :required => true
    option :bucket, :required => true
    def backup
      Driver.new(options).backup
    end              

    desc 'mysql', "Backup a mysql database"
    option :mysql, :default => true
    option :name, :required => true
    option :user, :required => true
    option :bucket, :required => true
    option :gpg_options
    option :password
    def mysql
      Driver.new(options).backup
    end
  end
end
