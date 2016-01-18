require 'spec_helper'

feature "UploadFilePages" do
  subject { page }

  describe "index" do

  end

  describe "new" do

  end

  describe "show" do
    let(:upload_file) { FactoryGirl.create(:upload_file) }
    before { visit upload_file_path(upload_file) }

    it { should have_selector("h1", text: upload_file.name) }
  end
end
