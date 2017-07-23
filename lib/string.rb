#######################################################################################
# File: string.rb                                                                     #
# Author: Sivaprakasam Boopathy                                                       #
# Description: String class extension that gives self to display in available color   #
# Date Created: 07/22/2017                                                            #
# Date Updated: 07/22/2017                                                            #
#######################################################################################
class String
  def red;            "\033[31m#{self}\033[0m" end
  def green;          "\033[32m#{self}\033[0m" end
  def brown;          "\033[33m#{self}\033[0m" end
  def blue;           "\033[34m#{self}\033[0m" end
  def magenta;        "\033[35m#{self}\033[0m" end
  def cyan;           "\033[36m#{self}\033[0m" end
  def gray;           "\033[37m#{self}\033[0m" end
end
