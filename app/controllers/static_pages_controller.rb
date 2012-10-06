class StaticPagesController < ApplicationController
  layout 'linkapplication'
  def home
      #   if signed_in?
      # @links_table  = current_user.linkstable.build
      # @feed_items = current_user.feed.paginate(page: params[:page]) end
  end

  def help
  end

  def about
  end

  def contact
  end

  def news
  end
end
