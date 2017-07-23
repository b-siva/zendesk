#######################################################################################
# File: search.rb                                                                     #
# Author: Sivaprakasam Boopathy                                                       #
# Description: This script will enable the user to search from available JSON files   #
# Date Created: 07/22/2017                                                            #
# Date Updated: 07/22/2017                                                            #
#######################################################################################

require 'json'
require './lib/file_processor'
require './lib/string'
require './lib/search_constants'

#Class for searcihing
class Search
  include SearchConstants
  # attr readers
  # file_processor => Get the files information
  # file_name => Extracted file names from file file_processor object
  # file_selection_opts => file names hash for options to select
  attr_reader :file_processor, :file_names, :file_selection_opts

  # attr accessor
  # selected_file => Slected file by user for searching
  # content_fields_hash => All available fields from JSON object to choose to search
  # content => JSON content
  # field_name => Slected field by user for searching
  attr_accessor :selected_file, :content_fields_hash, :content, :field_name

  # Initializes the file_processor and builds the available file names options to choose
  def initialize
    @file_processor = FileProcessor.new
    @file_names = @file_processor.names
    @file_selection_opts = Hash[(1..file_names.size).zip file_names]
    @selected_file = nil
    @field_name = nil
  end

  #Welcome message
  def welcome
    puts ("\n" + VERBIAGES['pound'] * FIFTY ).green
    puts (" " * TEN + VERBIAGES['welcome']).green
    puts (VERBIAGES['pound'] * FIFTY).green
    puts VERBIAGES['quit'].red
    get_file_name
  end

  # Below methods only available to self
  private
  # This method gets the user input to select from available file names
  def get_file_name
    begin
      until @file_selection_opts[@selected_file]
        puts VERBIAGES['select_file'].cyan
        puts (VERBIAGES['dash'] * SEVENTY).cyan
        @file_selection_opts.each do |key, value|
            puts "#{key}.#{value}"
        end
        @selected_file = gets.chomp.to_i
      end
      puts VERBIAGES['selcted_file'].cyan % @file_selection_opts[@selected_file]
      puts VERBIAGES['continue_file_msg'].cyan
      selected_option = gets.chomp
      if selected_option.downcase == NO
        @selected_file = nil
        get_file_name
      else
        read_json_file
      end
    rescue SystemExit, Interrupt
      thank_you
    rescue Exception => e
      puts VERBIAGES['exception'].red % e
      thank_you
    end
  end

  # This method reads the JSON content and extracts the field names
  def read_json_file
    file_name_and_extension = [file_selection_opts[@selected_file], file_processor.file_ext].join
    file_full_path = File.join(file_processor.file_path, file_name_and_extension)
    @content = JSON.parse(File.read(file_full_path))
    content_keys = content.first.keys
    @content_fields_hash = Hash[(1..content_keys.size).zip content_keys]
    get_field_name
  end

  # This method gets the user input to select from available field names
  def get_field_name
    until @content_fields_hash[@field_name]
      puts VERBIAGES['select_field'].magenta % @file_selection_opts[@selected_file]
      puts (VERBIAGES['dash'] * SEVENTY).magenta
      @content_fields_hash.each do |key,value|
        puts "#{key}.#{value}"
      end
      @field_name = gets.chomp.to_i
    end
    puts VERBIAGES['selected_field'].magenta % @content_fields_hash[@field_name]
    puts VERBIAGES['continue_field_msg'].magenta
    selected_option = gets.chomp
    if selected_option.downcase == NO
      @field_name = nil
      get_field_name
    else
      get_field_value
    end
  end

  #This method gets the search value from user for selected field
  def get_field_value
    @selected_field = @content_fields_hash[@field_name]
    puts VERBIAGES['field_value'].magenta % @selected_field
    @field_value = gets.chomp
    find_rows
  end

  # This method searches the pattern in JSON content
  def find_rows
    @matched_rows = @content.select do |obj|
      field_to_search = obj[@selected_field]
      field_to_search = field_to_search.join if field_to_search.is_a?(Array)
      field_to_search.to_s.split.join =~ /#{@field_value}/i
    end
    print_results
  end

  # This method prints the results
  def print_results
    if @matched_rows.length  < 1
      print_no_results
      return
    end

    puts VERBIAGES['items_found'].green % @matched_rows.length
    puts (VERBIAGES['dash'] * SEVENTY).green

    @matched_rows.each_with_index do |row, index|
      row.each do |key,value|
        puts "#{key}: #{value}".send(index % TWO == 0 ? 'green' : 'red')
      end
      puts
      if (index+1) % TWO == 0
        puts VERBIAGES['proceed'].brown
        gets.chomp
      end
    end

    puts VERBIAGES['end_of_result'].red
    search_again
  end

  # Print no results and allow user to input again
  def print_no_results
    puts VERBIAGES['sorry_no_records'].red
    puts VERBIAGES['field_value_again'].red
    gets.chomp.downcase == YES ? get_field_value : search_again
  end

  # This method enables the user to start the search again
  def search_again
    puts (VERBIAGES['dash'] * SEVENTY).gray
    puts VERBIAGES['search_again'].green
    search_again = gets.chomp
    if search_again.downcase == YES
      @selected_file = @field_name = nil
      get_file_name
    else
      thank_you
    end
  end

  #Thank you message
  def thank_you
    puts VERBIAGES['thank_you'].blue
  end
end

