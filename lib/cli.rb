#!/usr/bin/env ruby1.9
# encoding: utf-8

module CLI
  VERSION ||= "0.0.1"
  extend self
  # TODO: yes?("You're fine?", default: true)
  def yes?(question, options = Hash.new)
    print "#{question} [Y/n] "
    values = {"y" => true, "yes" => true, "n" => false, "no" => false}
    values.default = true
    input  = STDIN.readline.chomp.downcase
    values[input]
  end

  def ask(question, options = Hash.new)
    print "#{question} [default: #{options[:default]}]"
    reply = STDIN.readline.chomp
    if reply.empty?
      options[:default]
    else
      reply
    end
  end
end

# run console if executed directly
if $0 == __FILE__
  require "irb"
  require "irb/completion"
  include CLI
  IRB.start(__FILE__)
end