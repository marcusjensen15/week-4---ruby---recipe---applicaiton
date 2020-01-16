class IngredientsController < ApplicationController

  # def index
  #   # Code for listing all albums goes here.
  #   @ingredients= Ingredient.all
  #   @ingredients= Ingredient.all
  #   @tags= Tag.all
  #   :index
  # end

  def new
    # Code for new album form goes here.
    @ingredient = Ingredient.new
    :new
  end

  def create
    # Code for creating a new album goes here.
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to root_path
    else
      render :new

  end

  def edit
    # Code for edit album form goes here.
    @ingredient = Ingredient.find(params[:id])
    render :edit
  end

  def show
    # Code for showing a single album goes here.
    @ingredient = Ingredient.find(params[:id])

    render :show
  end

  def update
    # Code for updating an album goes here.

    @ingredient= Ingredient.find(params[:id])
      if @ingredient.update(ingredient_params)
        redirect_to ingredient_path
      else
        render :edit
      end
  end

  def destroy
    # Code for deleting an album goes here.
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to root_path
  end
end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
