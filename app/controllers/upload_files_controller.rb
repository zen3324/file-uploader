class UploadFilesController < ApplicationController

  def index
    @uploadFiles = UploadFile.all
  end

  def show
    @uploadFile = UploadFile.find(params[:id])
  end

  def new
    @uploadFile = UploadFile.new
  end

  def create
    @uploadFile = UploadFile.new(upload_file_params)

    if @uploadFile.save
      redirect_to @uploadFile
    else
      render 'new'
    end
  end

  private

  def upload_file_params
    params.require(:upload_file).
      permit(:name,
             :expiry_date,
             :password,
             :private_mode)
  end
end
