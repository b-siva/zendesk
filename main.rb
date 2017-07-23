#!/usr/bin/env ruby
#######################################################################################
# File: main.rb                                                                       #
# Author: Sivaprakasam Boopathy                                                       #
# Description: This is the main ruby script to invoke search                          #
# Date Created: 07/23/2017                                                            #
# Date Updated: 07/23/2017                                                            #
#######################################################################################
require 'optparse'
require './search'

options = {}

optparse = OptionParser.new do |opts|
  opts.banner = "Usage: main.rb [options]"

  opts.on('-d', '--dev ENVIRONMENT', "Mandatory ENVIRONMENT Name") do |name|
    options[:dev] = name
  end

  opts.on('-h', '--help', 'Displays Help') do
    puts opts
    exit
  end

end
optparse.parse!

# This will initialize the search object to begin searching
begin
  raise OptionParser::MissingArgument if options[:dev].nil? || options[:dev] != 'true'
  Search.new.welcome
rescue OptionParser::MissingArgument
  system("ruby main.rb -h")
rescue Exception => e
  puts "#{e}"
end
