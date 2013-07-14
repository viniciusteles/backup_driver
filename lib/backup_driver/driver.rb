module BackupDriver
  class Driver
    attr_reader :options, :time, :log

    def initialize(options)
      @options = options
      @time = Time.now
      @log  = []
    end

    def backup
      create_command.do
      encrypt_command.do
      store_command.do
      clean_command.do
      output_log
    end

    def output_log
      puts @log.join("\n")
    end

    def create_command
      @create_command ||= CreateCommand.new(self)
    end

    def encrypt_command
      @encrypt_command ||= EncryptCommand.new(self)
    end

    def store_command
      @store_command ||= StoreCommand.new(self)
    end

    def clean_command
      @clean_command ||= CleanCommand.new(self)
    end
  end
end
