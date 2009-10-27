# encoding: utf-8

SPEC_ROOT = File.dirname(__FILE__)
require "spec" # so you can run ruby spec/cli_spec.rb

$:.unshift(File.join(SPEC_ROOT, "..", "lib"))

module Spec
  module Matchers
    def match(expected)
      Matcher.new :match, expected do |expected|
        match do |actual|
          actual.match(expected)
        end
      end
    end
  end
end
