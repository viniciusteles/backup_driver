module BackupDriver
  class CLI < Thor
    desc 'backup', "Performs the backup"
    option :gpg_options
    option :source, :required => true
    option :bucket, :required => true
    def backup
      Driver.new(options).backup
    end              
  end
end
