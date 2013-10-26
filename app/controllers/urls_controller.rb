class UrlsController < ApplicationController
  include UrlsHelper

  before_action :authenticate_user!, except: [:new, :redirect, :create]

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url
      @url.short_url = magic_url_minifier
      @url.user_id = current_user.id if user_signed_in?
      @url.count = 0
      @url.save
    end

    render 'result'
  end

  def result
    @url
  end

  def redirect
    @url = Url.find_by_short_url(params[:short_url])
    if @url
      @url.count += 1
      @url.save
      redirect_to "http://#{@url.long_url}"
    end

  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end

end
