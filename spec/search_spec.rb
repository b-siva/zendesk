#!/usr/bin/env ruby
#######################################################################################
# File: search_spec.rb                                                                #
# Author: Sivaprakasam Boopathy                                                       #
# Description: This is spec for search                                                #
# Date Created: 07/22/2017                                                            #
# Date Updated: 07/23/2017                                                            #
#######################################################################################
require_relative '../lib/search'

describe Search do
  let(:search) { Search.new }

  context 'initializes' do
    it 'should set file_processor' do
      expect(search.file_processor).to be_instance_of(FileProcessor)
    end

    it 'should set file_names' do
      list = ["organizations", "tickets", "users"]
      expect(search.file_names).to match_array(list)
    end

    it 'should set file_selection_opts' do
      expect(search.file_selection_opts).to be_instance_of(Hash)
    end

    it 'should set file_selection_opts' do
      hash = {1=>"organizations", 2=>"tickets", 3=>"users"}
      expect(search.file_selection_opts).to eql(hash)
    end

    it 'should set selected_file' do
      expect(search.selected_file).to be_nil
    end

    it 'should set field_name' do
      expect(search.field_name).to be_nil
    end
  end

end
