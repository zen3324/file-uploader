class UploadFile < ActiveRecord::Base
  validates :name, presence: { message: "入力してください" }

  scope :not_expire, -> { where("expiry_date >= ?", Date.today)  }
end
