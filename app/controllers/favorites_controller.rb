class FavoritesController < ApplicationController

  def create
     @post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: @post)

     authorize favorite

     if favorite.save
       redirect_to [@post.topic, @post], notice: "Favorite was saved successfully."
     else
       flash[:error] = "Error favoriting post. Please try again."
       redirect_to [@post.topic, @post]
     end
   end

    def destroy
      @post = Post.find(params[:post_id])#get the post from the params
      favorite = current_user.favorites.find(params[:id]) # Find the current user's favorite with the ID in the params

      authorize favorite

     if favorite.destroy
      redirect_to [@post.topic, @post], notice: "Favorite was successfuly removed."
     else
      flash[:error] = "Error removing favorite. Please try again."
      redirect_to [@post.topic, @post]
     end
  end
end