class LinksTablesController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

    def recommendations
 
    end

  def links_table
  	@links_table = LinksTable.paginate(page: params[:page])
  end

  def show
  	@links_table = LinksTable.find(params[:id])
  end

  def new
    @links_table = LinksTable.new
  end

  def create
    @links_table = current_user.links_table.build(params[:links_table])
    if @links_table.save
      flash[:success] = "New file created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'links_tables/linksindex'
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