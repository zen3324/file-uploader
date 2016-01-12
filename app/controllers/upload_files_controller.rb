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
    file = upload_file_params[:upload_file]
    upload_file = {}
    if file != nil
      upload_file[:upload_file] = file.read
      upload_file[:name] = file.original_filename
    end
    upload_file[:expiry_date] = Date.new(upload_file_params["expiry_date(1i)"].to_i,
                                         upload_file_params["expiry_date(2i)"].to_i,
                                         upload_file_params["expiry_date(3i)"].to_i)
    upload_file[:password] = upload_file_params[:password]
    upload_file[:private_mode] = upload_file_params[:private_mode]
    @upload_file = UploadFile.new(upload_file)
    respond_to do |format|
      if @upload_file.save
        format.html { redirect_to @upload_file, notice: 'Upload success' }
      else
        @upload_files = UploadFile.all
        format.html { render action: 'index' }
      end
    end
  end

  private

  def upload_file_params
    params.require(:upload_file).
      permit(:upload_file,
             :name,
             :expiry_date,
             :password,
             :private_mode)
  end
end
