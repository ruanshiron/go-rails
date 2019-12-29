class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :new]
  before_action :correct_user,   only: :destroy

  def index
    if params[:term]
      @microposts = Micropost.search_by_full_name(params[:term]).paginate(page: params[:page]).with_pg_search_highlight
    else
      @microposts = Micropost.all
    end

    respond_to do |format| 
      format.html {}
      format.json { render :json => @microposts.limit(5)}
    end
  end

  def new 
    @micropost = current_user.microposts.build
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to current_user
    else
      render :new
    end
  end

  # def create
  #   @micropost = current_user.microposts.build(micropost_params)
  #   respond_to do |format|
  #     if @micropost.save
  #       flash[:success] = "Micropost created!"
  #       format.html { redirect_to root_url }
  #       format.js {}
  #     else
  #       @feed_items = []
  #       render 'static_pages/home'
  #     end
  #   end
  # end

  # def destroy
  #   @micropost.destroy
  #   flash[:success] = "Micropost deleted"
  #   redirect_to request.referrer || root_url
  # end
  def destroy
    @micropost.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
      format.js   { render layout: false }
    end
  end

  private

    def micropost_params
      params.require(:micropost).permit(:title, :content, pictures_attributes: [ :id, :src, :picture_cache, :_destroy ])
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end