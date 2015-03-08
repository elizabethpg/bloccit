
class SummariesController < ApplicationController 

  def show
    @summary = Summary.find(params[:id])
    @post = Summary.find(params[:post_id])
    authorize @summary
  end

  def edit
    @summary = Summary.find(params[:id])
    @post = Post.find(params[:post_id])
    authorize @summary
  end
  
  
  def update
    @summary = Summary.find(params[:id])
    @post = Post.find(params[:post_id])
    authorize @summary
    if @summary.update_attributes(params.require(:summary).permit(:description))
      flash[:notice] = "Summary was updated."
     redirect_to [@post, @summary]
    else
      flash[:error] = "Error in updating the summary. Try again."
      render :edit
    end
  end
end