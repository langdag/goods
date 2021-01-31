class InfosController < ApplicationController
    def upload_csv
      return unless info_params[:file].present?

      @info = Info.new(name: info_params[:file].original_filename)
      @info.file.attach(info_params[:file])
      if @info.save
        path = @info.file_path
        filename = @info.name
        ImportProductsWorker.perform_async(path, filename) 
        redirect_to root_path, notice: 'All Data have been uploaded!'
      else
        flash[:success] = "Файл был отклонен"
        redirect_to :back
      end
    end
  
    private
  
    def info_params
      params.permit(:file)
    end
end