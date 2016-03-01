class UploadFilesController < ApplicationController

  def index
    @uploadFiles = UploadFile.not_expire
  end

  def show
    @uploadFile = UploadFile.not_expire.find(params[:id])
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

  def destroy
    @upload_file = UploadFile.find(params[:id])
    if @upload_file.password == upload_file_params[:password]
      @upload_file.destroy
      redirect_to upload_files_url, notice: "File deleted"
    else
      redirect_to @upload_file, alert: "Wrong password"
    end
  end

  def download
    @uploadFile = UploadFile.find(params[:id])
    send_data(@uploadFile.upload_file,
      :filename => @uploadFile.name)
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
