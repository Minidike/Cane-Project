class FactsController < ApplicationController
  # Find the fact before running the following actions
  before_action :find_fact, only: [:show, :edit, :update, :destroy]
  # Require an authenticated user to create, edit and delete facts
  before_action :authenticate_user!, except: [:index, :show]
  # Load permissions
  load_and_authorize_resource :except => [:index, :show]

  # List all the facts
  def index
    @facts = Fact.all.order("created_at DESC")
  end

  # Show individual fact
  def show
  end

  # Render new view
  def new
    @fact = Fact.new
  end

  # Post fact into the database
  def create
    @fact = Fact.new(fact_params)
    @fact.user = current_user

    if @fact.save
      redirect_to @fact, :notice => "Se compartio el post Correctamente!"
    else
      render "new"
    end
  end

  # Render edit view
  def edit
  end

  # Update fact in the database
  def update
    if @fact.update(fact_params)
      redirect_to @fact, :notice => "Se actualizo el post Correctamente!"
    else
      render "edit"
    end
  end

  # Delete the fact from the database
  def destroy
    @fact.destroy
    redirect_to facts_path, :notice => "Se elimino el post Correctamente!"
  end

  def upvote
    @fact = Fact.find(params[:id])
    @fact.upvote_by current_user
    redirect_to :back
  end

  private

    def find_fact
      @fact = Fact.find(params[:id])
    end

    def fact_params
      params.require(:fact).permit(:title, :description, :image)
    end

end
