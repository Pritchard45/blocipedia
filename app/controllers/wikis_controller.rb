class WikisController < ApplicationController

  def index
   @wikis = policy_scope(Wiki)
  end

  def show
   @wiki = Wiki.find(params[:id])
   @users = User.find_by(id: session[:user_id])
   @collaborators = @wiki.collaborators
  end

  def new
   @wiki = Wiki.new
  end

  def create
   @wiki = current_user.wikis.build(wiki_params)


   if @wiki.save
     flash[:notice] = "Wiki was saved."
     redirect_to wikis_path
   else
     flash.now[:alert] = "There was an error saving your wiki, please try again."
     render :new
   end
  end

  def edit
   @wiki = Wiki.find(params[:id])
   @users = User.where.not(id: current_user.id)
   @collaborators = @wiki.collaborators
  end

  def update

   @wiki = Wiki.find(params[:id])


   if @wiki.update_attributes(wiki_params)
     flash[:notice] = "Wiki was updated."
     redirect_to @wiki
   else
     flash.now[:alert] = "There was an error saving the wiki. Please try again."
     render :edit
   end
  end

  def destroy
   @wiki = Wiki.find(params[:id])
   authorize @wiki

   if @wiki.destroy
     flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
     redirect_to wikis_path
   else
     flash.now[:alert] = "There was an error deleting the post."
     render :show
   end
  end

  private

  def wiki_params
   params.require(:wiki).permit(:title, :body, :private)
  end
end
