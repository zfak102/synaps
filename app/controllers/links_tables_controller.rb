class LinksTablesController < ApplicationController
  layout 'linkapplication'

  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy


  def recommendations
  end

  def index
  	@links_tables = LinksTable.paginate(page: params[:page])
  end

  def show
  	@links_table = LinksTable.find(params[:id])
  end

  def new
    @links_table = LinksTable.new
  end

  def create
    @links_table = LinksTable.new(params[:links_table])
    if @links_table.save
      LinksUser.create!(:links_table_id => LinksTable.last.id, :user_id => current_user.id)
      flash[:success] = "Data Linked!"
      redirect_to :back, :alert => 'Linked!'
    else
      render "new", :alert => 'Link not made!'
    end
  end

  def destroy
    @links_table.destroy
    redirect_to root_url
  end

  def Recommendations
  end 

  private

    def correct_user
      @links_table = current_user.links_table.find_by_id(params[:id])
      redirect_to root_url if @links_table.nil?
    end
end