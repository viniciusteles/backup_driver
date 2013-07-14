require "thor"

module BackupDriver

  LIBRARY_PATH = File.join(File.dirname(__FILE__), 'backup_driver')

  %w(
    command
    create_command
    encrypt_command
    store_command
    clean_command
    driver
    cli
    version
  ).each { |lib| require File.join(LIBRARY_PATH, lib) }

  def self.backup
    Driver.new.backup
  end
end
