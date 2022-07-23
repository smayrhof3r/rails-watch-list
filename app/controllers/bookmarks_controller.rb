class BookmarksController < ApplicationController
  def destroy
    Bookmark.find(params[:id]).delete

    redirect_to list_path(params[:list_id])
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    b = Bookmark.new(bookmark_params)
    b.list_id = params[:list_id]
    if b.save
      redirect_to list_path(List.find(b.list_id))
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
