#######################################################################################
# File: file_processor.rb                                                             #
# Author: Sivaprakasam Boopathy                                                       #
# Description: Read all JSON extension files from ./json_files folder relative to     #
#              current directory.                                                     #
# Date Created: 07/22/2017                                                            #
# Date Updated: 07/22/2017                                                            #
#######################################################################################
class FileProcessor
  attr_accessor :file_names
  attr_reader :file_path, :file_ext

  def initialize
    @file_path = './json_files'
    @file_ext = '.json'
    @file_names = Dir["#{@file_path}/*#{@file_ext}"]
  end

  def names
    @file_names.map {|name| name.split('/').last.split('.json').first }
  end
end
