class DatafilesController < ApplicationController
  before_filter :signed_in_user
  before_filter :get_user

  def get_user
    @user = current_user
  end

  def index
  	@datafiles = Datafile.paginate(page: params[:page])
  end

  def show
  	@datafile = Datafile.find(params[:id]) 
      if @datafile.nil?
    @datafiles = Datafile.all
    render "index", :alert => 'Data was not found!'
   end
  end

  def new
  	@datafiles = Datafile.new
  end

  def create
    @datafiles = Datafile.new(params[:datafile])
    if @datafiles.save
      Relationship.create!(:datafile_id => :datafile_id, :user_id => @user.id)
      flash[:success] = "New data added!"
      redirect_to 'datafiles/index'
    else
      render 'new'
    end
  end

  def edit
    @datafile = Datafile.find(params[:id]) 
  end

  def update
  	if @datafiles.update_attributes(params[:id])
      flash[:success] = "Data updated"
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

  def info1
    info = datafile.Info1
    @info1 = link_to "info", datafiles
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
