#######################################################################################
# File: search_constants.rb                                                           #
# Author: Sivaprakasam Boopathy                                                       #
# Description: This file has all the constants used in search.rb file                 #
# Date Created: 07/22/2017                                                            #
# Date Updated: 07/22/2017                                                            #
#######################################################################################
module SearchConstants
  TWO = 2
  TEN = 10
  FIFTY = 50
  SEVENTY = 70
  YES = 'yes'
  NO = 'no'

  VERBIAGES = {
    'dash' => '-',
    'pound' => '#',
    'select_file' => "Select the file name from below options to start your search:",
    'selcted_file' => "\nYou selected '%s' file for searching",
    'continue_file_msg' => "Press enter key to continue with selected file or type 'No' to choose different file",
    'exception' => "There was an exception: %s",
    'select_field' => "Select available fields from '%s' for searching:",
    'selected_field' => "\nYou selected '%s' field for searching",
    'continue_field_msg' => "Press enter key to continue with selected field or type 'No' to choose different field",
    'field_value' => "Please enter your input for selected field '%s' to search:",
    'items_found' => "\n%s item(s) found:",
    'proceed' => "Please enter to proceed",
    'end_of_result' => "End of search result",
    'sorry_no_records' => "Sorry, no matching record found",
    'field_value_again' => "Want to input one more time? type 'yes' and press enter key:",
    'search_again' => "Want to search one more time? Type 'yes' and press enter or press enter key to end your search:",
    'thank_you' => "\nThank you for using the search and have a nice day!\n",
    'welcome' => "Welcome to search",
    'quit' => "Press ctrl+c anytime to quit.\n"
  }
end
