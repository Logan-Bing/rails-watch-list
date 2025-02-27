class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new(set_params)
    @bookmark.save
    redirect_to list_path(@list)
  end

  private

  def set_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
