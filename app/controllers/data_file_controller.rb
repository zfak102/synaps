class DataFileController < ApplicationController
  before_filter :signed_in_user

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
    @datafile = DataFile.new(params[:datafiles])
    if @datafile.save
      flash[:success] = "New data added!"
      redirect_to root_url
    else
      render 'new'
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
