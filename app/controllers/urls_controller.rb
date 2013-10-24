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
      @url.save
      visit = Visit.new
      visit.url_id = @url.id
      visit.count = 0
      visit.save
    end

    render 'result'
  end

  def result
    @url
  end

  def redirect
    @url = Url.find_by_short_url(params[:short_url])
    if @url
      redirect_to "http://#{@url.long_url}"
      new_visit
    end

  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end

end
