class CreateUploadFiles < ActiveRecord::Migration
  def change
    create_table :upload_files do |t|
      t.string :name
      t.date :expiry_date
      t.string :password
      t.boolean :private_mode

      t.timestamps null: false
    end
  end
end
