class BookmarksController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]


  def create
    @bookmark = current_user.bookmarks.build(bookmark_params)
    #require 'pismo'
    #url = bookmark_params(:link)
    #doc = Pismo::Document.new(bookmark.url)
    #@title = bookmark.title

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
    #url = bookmark_params(:link)
    #doc = Pismo::Document.new(bookmark.link)
	  params.require(:bookmark).permit(:link, :title)
	end

  def nokogiri
    require 'nokogiri'
    url = bookmark_params(:link)
    @doc = Nokogiri::HTML(open(url))
  end

  def correct_user
    @bookmark = current_user.bookmarks.find_by(id: params[:id])
    redirect_to root_url if @bookmark.nil?
  end

end