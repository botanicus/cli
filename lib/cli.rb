#!/usr/bin/env ruby1.9
# encoding: utf-8

module CLI
  VERSION ||= "0.0.1"
  extend self
  # TODO: yes?("You're fine?", default: true)
  def yes?(question)
    print "#{question} [Y/n] "
    values = {"y" => true, "n" => false}
    values.default = "y"
    input  = STDIN.readline.chomp.downcase
    values[input]
  end

  def ask(question)
    print "#{question} "
    STDIN.readline.chomp
  end
end

# run console if executed directly
if $0 == __FILE__
  require "irb"
  require "irb/completion"
  include CLI
  IRB.start(__FILE__)
end