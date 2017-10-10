# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "csv"
  spec.version       = "0.1.0"
  spec.date          = "2017-09-12"
  spec.authors       = ["James Edward Gray II"]
  spec.email         = [nil]

  spec.summary       = "CSV Reading and Writing"
  spec.description   = "the CSV library began its life as FasterCSV."
  spec.homepage      = "https://github.com/ruby/csv"
  spec.license       = "BSD-2-Clause"

  spec.files         = ["lib/csv.rb"]
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.5.0dev"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 12"
end
