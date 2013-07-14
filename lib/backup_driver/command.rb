module BackupDriver
  class Command
    attr_reader :driver

    def initialize(driver)
      @driver = driver
    end

    def options
      driver.options
    end
  end
end
