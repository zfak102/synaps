class DataFileController < ApplicationController
  before_filter :signed_in_user

  # def data_file
  # 	@datafiles = DataFile.paginate(page: params[:page])
  # end

  def index
  	@datafiles = DataFile.paginate(page: params[:page])
  end

  def show
  	@datafile = DataFile.find(params[:id])
  end

  def new
  	@datafile = DataFile.new
  end

  def create
    @datafile = current_datafile.build(params[:datafile])
    if @datafile.save
      flash[:success] = "New file created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'data_file/index'
    end
  end

  def edit
  end

  def update
  	if @data_file.update_attributes(params[:datafile])
      flash[:success] = "Data updated"
      sign_in @datafile
      redirect_to @datafile
    else
      render 'edit'
    end
  end

  def destroy
    @datafile.destroy
    redirect_to root_url
  end

  private

    def correct_user
      @datafile = current_user.datafile.find_by_id(params[:id])
      redirect_to root_url if @datafile.nil?
    end
end
