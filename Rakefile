# encoding: utf-8

require_relative "lib/cli"

# ENV setup for external commands
ENV["RUBYLIB"] = Dir["vendor/*/lib"].join(":")
$LOAD_PATH.clear.push(*Dir["vendor/*/lib"])

# http://support.runcoderun.com/faqs/builds/how-do-i-run-rake-with-trace-enabled
Rake.application.options.trace = true

# default task for RunCodeRun.com
task :default => ["submodules:init", :spec]

# load tasks
Dir["tasks/*.rake"].each do |taskfile|
  begin
    load File.join(Dir.pwd, taskfile)
  rescue Exception => exception
    puts "Exception #{exception.class} occured during loading #{taskfile}:"
    puts exception.message
    puts exception.backtrace
  end
end
