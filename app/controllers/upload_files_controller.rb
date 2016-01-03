class UploadFilesController < ApplicationController

  def index
    @uploadFiles = UploadFile.all
  end
end
