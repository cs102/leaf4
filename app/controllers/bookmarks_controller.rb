class BookmarksController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]


  def create
    require 'pismo'
    doc = Pismo::Document.new(bookmark_params[:link])
    @bookmark = current_user.bookmarks.build(bookmark_params)
    @bookmark.title = doc.title.to_s
   
    if @bookmark.save
      #flash[:success] = "Bookmark save"
      redirect_to statics_home_path
    else
      redirect_to statics_home_path
      #render 'statics/home'
    end
  end

  def destroy
    @bookmark.destroy!
    #flash[:success] = "Bookmark deleted"
    redirect_to statics_home_path
  end

  private

	def bookmark_params
    params.require(:bookmark).permit(:link, :title)
	end

  def correct_user
    @bookmark = current_user.bookmarks.find_by(id: params[:id])
    redirect_to root_url if @bookmark.nil?
  end

end