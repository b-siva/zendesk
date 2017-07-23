require_relative '../file_processor'

describe FileProcessor do
  let(:file_processor) { FileProcessor.new }

  it 'should set file_path' do
    expect(file_processor.file_path).to eql('./json_files')
  end

  it 'should set file_ext' do
    expect(file_processor.file_ext).to eql('.json')
  end

  it 'should return names of all files in dir' do
    list = ["./json_files/organizations.json", "./json_files/tickets.json", "./json_files/users.json"]
    expect(file_processor.file_names).to match_array(list)
  end

  it 'should return names of all files in dir' do
    list = ["organizations", "tickets", "users"]
    expect(file_processor.names).to match_array(list)
  end
end
