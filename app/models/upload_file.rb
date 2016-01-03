class UploadFile < ActiveRecord::Base
  validates :name, presence: { message: "入力してください" }
end
