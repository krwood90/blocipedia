class WikisController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authorize_user, except: [:index, :show, :edit, :update, :new, :create]
  
  def index
    @wikis = policy_scope(Wiki)
  end
  
  def show
    @wikis = Wiki.find(params[:id])
  end

  def new
    @wikis = Wiki.new
  end
  
  def create
    @wikis = Wiki.new
    @wikis.title = params[:wiki][:title]
    @wikis.body = params[:wiki][:body]
    @wikis.private = params[:wiki][:private]
    @wikis.user = current_user

    if @wikis.save
      flash[:notice] = "Wiki was saved successfully."
      redirect_to @wikis
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @wikis = Wiki.find(params[:id])
  end
  
  def update
    @wikis = Wiki.find(params[:id])
    @wikis.title = params[:wiki][:title]
    @wikis.body = params[:wiki][:body]
    @wikis.private = params[:wiki][:private]
    @wikis.user = current_user
    
    
    if @wikis.save
      flash[:notice] = "Wiki was updated!"
      redirect_to @wikis
    else
      flash.now[:alert] = "There was an error updating the wiki. Please try again."
      render :edit
    end
  end
  
  def destroy
    @wikis = Wiki.find(params[:id])
    
    if @wikis.destroy
      flash[:notice] = "\"#{@wikis.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end
  

  def authorize_user
    unless current_user.admin?
      flash[:alert] = "You can't do that"
      redirect_to wikis_path
    end
  end
end
