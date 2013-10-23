class UrlsController < ApplicationController
  include UrlsHelper
  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url
      @url.short_url = magic_url_minifier
      @url.save
    end

    render 'result'
  end

  def result
    @url
  end

  def redirect
    @url = Url.find_by_short_url(params[:short_url])
    redirect_to "http://#{@url.long_url}"
  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end

end
