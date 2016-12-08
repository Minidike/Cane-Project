class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :find_fact
  before_action :find_comment, only: [:edit, :update, :destroy]
  load_and_authorize_resource :fact
  load_and_authorize_resource :comment, :through => :fact
  
  def create
    @comment = @fact.comments.create(comment_params) 
    @comment.user = current_user

    if @comment.save
      redirect_to fact_path(@fact)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to fact_path(@fact)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to fact_path(@fact)		
  end
  
  private
    
    def find_fact
      @fact = Fact.find(params[:fact_id])
    end
  
    def find_comment
      @comment = @fact.comments.find(params[:id])
    end
    
    def comment_params
      params.require(:comment).permit(:content, :user_id, :fact_id)
    end
end
