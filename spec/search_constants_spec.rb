#!/usr/bin/env ruby
#######################################################################################
# File: search_constants_spec.rb                                                      #
# Author: Sivaprakasam Boopathy                                                       #
# Description: This is spec for search_constants                                      #
# Date Created: 07/22/2017                                                            #
# Date Updated: 07/23/2017                                                            #
#######################################################################################
require_relative '../search_constants'

describe SearchConstants do
  it 'should return constant TWO' do
    expect(SearchConstants::TWO).to eql(2)
  end

  it 'should return constant TEN' do
    expect(SearchConstants::TEN).to eql(10)
  end

  it 'should return constant FIFTY' do
    expect(SearchConstants::FIFTY).to eql(50)
  end

  it 'should return constant SEVENTY' do
    expect(SearchConstants::SEVENTY).to eql(70)
  end

  it 'should return constant YES' do
    expect(SearchConstants::YES).to eql('yes')
  end

  it 'should return constant NO' do
    expect(SearchConstants::NO).to eql('no')
  end

  context 'VERBIAGES' do
    it 'should be instance of Hash' do
      expect(SearchConstants::VERBIAGES).to be_instance_of(Hash)
    end

    it 'should return its length' do
      expect(SearchConstants::VERBIAGES.keys.length).to eql(18)
    end

    it 'should have key dash' do
      expect(SearchConstants::VERBIAGES).to have_key('dash')
    end

    it 'should have key pound' do
      expect(SearchConstants::VERBIAGES).to have_key('pound')
    end

    it 'welcome key should return welcome message' do
      expect(SearchConstants::VERBIAGES['welcome']).to eql('Welcome to search')
    end

  end

end
