require 'spec_helper'

describe UploadFile do
  before { @upload_file = UploadFile.new(name: 'file_name', expiry_date: '2015-12-28', password: 'pass', private_mode: 'false') }
  subject { @upload_file }

  it { should respond_to(:name) }
  it { should respond_to(:expiry_date) }
  it { should respond_to(:password) }
  it { should respond_to(:private_mode) }

  it { should be_valid }
end
