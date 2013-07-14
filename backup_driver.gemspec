# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'backup_driver/version'

Gem::Specification.new do |spec|
  spec.name          = "backup_driver"
  spec.version       = BackupDriver::VERSION
  spec.authors       = ["Vinicius Teles"]
  spec.email         = ["vinicius@improveit.com.br"]
  spec.description   = %q{BackupDriver is a tool created to backup files from Unix systems.}
  spec.summary       = %q{BackupDriver can be used to backup log files and mysql databases to Amazon S3.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'thor', '= 0.18.1'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
