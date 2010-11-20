class HomeController < ApplicationController
  def index
    @screenshot = Screenshot.new
  end
end
