class TopicsController < ApplicationController
  def index
    @topics = Topic.visibile_to(current_user).paginate(page: params[:page], per_page: 10)
    authorize @topics
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def show
    @topic = Topic.find(params[:id])
    authorize @topic
    @posts = @topic.posts.includes(:user).paginate(page: params[:page], per_page: 10)
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def destroy
    @topic = Topic.find(params[:id])
    name = @topic.name

    authorize @topic
    if @topic.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "Error deleting topic. Please try again."
      render :show
    end
  end

   def create
     @topic = Topic.new(params.require(:topic).permit(:name, :description, :public))
     authorize @topic
     if @topic.save
       redirect_to @topic, notice: "Topic was saved successfully."
     else
       flash[:error] = "Error creating topic. Please try again."
       render :new
     end
   end
 
   def update
     @topic = Topic.find(params[:id])
     authorize @topic
     if @topic.update_attributes(params.require(:topic).permit(:name, :description, :public))
       redirect_to @topic
     else
       flash[:error] = "Error saving topic. Please try again."
       render :edit
     end
   end
end
