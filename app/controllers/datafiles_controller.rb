class DatafilesController < ApplicationController
  before_filter :signed_in_user

  def index
  	@datafiles = Datafile.paginate(page: params[:page])
  end

  def show
  	@datafiles = Datafile.find(params[:id]) 
  end

  def new
  	@datafiles = Datafile.new
  end

  # def create
  #   @datafile = current_datafile.build(params[:datafile])
  #   if @datafile.save
  #     flash[:success] = "New file created!"
  #     redirect_to root_url
  #   else
  #     @feed_items = []
  #     render 'datafile/index'
  #   end
  # end

  def create
    @datafiles = Datafile.new(params[:datafile])
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
  	if @datafiles.update_attributes(params[:datafile])
      flash[:success] = "Data updated"
      sign_in @datafile
      redirect_to @datafiles
    else
      render 'edit'
    end
  end

  def destroy
    @datafiles.destroy
    redirect_to root_url
  end

  def link
    @title = "Link"
    @datatables = DataTable.find(params[:id])
    render 'show_link'
  end

  private

    def correct_user
      @datafiles = current_user.datafile.find_by_id(params[:id])
      redirect_to root_url if @datafile.nil?
    end
end
