#!/usr/bin/env gem1.9 build
# encoding: utf-8

Dir[File.join(File.dirname(__FILE__), "vendor", "*")].each do |path|
  if File.directory?(path) && Dir["#{path}/*"].empty?
    warn "Dependency #{File.basename(path)} in vendor seems to be empty. Run git submodule init && git submodule update to checkout it."
  elsif File.directory?(path) && File.directory?(File.join(path, "lib"))
    $:.unshift File.join(path, "lib")
  end
end

# NOTE: we can't use require_relative because when we run gem build, it use eval for executing this file
require File.join(File.dirname(__FILE__), "lib", "cli")

Gem::Specification.new do |s|
  s.name = "cli"
  s.version = CLI::VERSION
  s.authors = ["Jakub Šťastný aka Botanicus"]
  s.homepage = "http://github.com/botanicus/cli"
  s.summary = "CLI interaction library similar to highline"
  s.description = "" # TODO: long description
  s.cert_chain = nil
  s.email = ["knava.bestvinensis", "gmail.com"].join("@")
  s.has_rdoc = true

  # files
  s.files = Dir.glob("**/*") - Dir.glob("pkg/*")
  s.require_paths = ["lib"]

  # Ruby version
  s.required_ruby_version = ::Gem::Requirement.new(">= 1.9")

  # runtime dependencies
  s.add_dependency "rubyexts"

  # development dependencies
  # use gem install rango --development if you want to install them
  s.add_development_dependency "rspec"

  # RubyForge
  # s.rubyforge_project = "cli"
end
