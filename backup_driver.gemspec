# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'backup_driver/version'

Gem::Specification.new do |spec|
  spec.name          = "backup_driver"
  spec.version       = BackupDriver::VERSION
  spec.authors       = ["Vinicius Teles"]
  spec.email         = ["vinicius@improveit.com.br"]
  spec.description   = %q{Backup files to Amazon S3}
  spec.summary       = %q{Backup stuff to a remote server.}
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
