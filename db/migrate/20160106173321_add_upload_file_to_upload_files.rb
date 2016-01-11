class AddUploadFileToUploadFiles < ActiveRecord::Migration
  def change
    add_column :upload_files, :upload_file, :binary
  end
end
