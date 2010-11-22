class ScreenshotsController < ApplicationController
  before_filter :guard, :only => [ :admin, :approve, :destroy ]
  
  def index
    @screenshots = Screenshot.approved.all
  end
  
  def create
    @screenshot = Screenshot.create params[:screenshot]
  end
  
  def new
    @screenshot = Screenshot.new
  end
  
  def admin
    @screenshots = Screenshot.unapproved.all
  end
  
  def approve
    screenshot = Screenshot.find(params[:id])
    screenshot.approved = 1
    screenshot.save!
    redirect_to :action => :admin, :secret => 'flashsuckz'
  end
  
  def destroy
    screenshot = Screenshot.find(params[:id])
    screenshot.destroy
    flash[:notice] = 'Successfully destroyed screenshot'
    redirect_to :action => :admin, :secret => 'flashsuckz'
  end
  
  private
  
  def guard
    if params[:secret] != 'flashsuckz'
      redirect_to root_url
      return false
    end
    return true
  end
end
