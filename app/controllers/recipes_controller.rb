class RecipesController < ApplicationController

  def index
    # Code for listing all albums goes here.
    @recipes= Recipe.all
    @ingredients= Ingredient.all
    @tags= Tag.all

    :index
  end

  def new
    # Code for new album form goes here.
    @recipe = Recipe.new
    :new
  end

  def create
    # Code for creating a new album goes here.
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new

  end

  def edit
    # Code for edit album form goes here.
    @recipe = Recipe.find(params[:id])
    render :edit
  end

  def show
    # Code for showing a single album goes here.

  @recipe = Recipe.find(params[:id])

    @ingredients = []
    @tags = []
    Ingredient.all.each do |ingredient|
      if @recipe.ingredients.exclude?(ingredient)
        @ingredients.push(ingredient.name)

      end
    end

    Tag.all.each do |tag|
      if @recipe.tags.exclude?(tag)
        @tags.push(tag.name)

      end
    end

  render :show
  end

  def update
    # Code for updating an album goes here.

    @recipe= Recipe.find(params[:id])
      if @recipe.update(recipe_params)
        redirect_to recipe_path
      else
        render :edit
      end
  end

  def destroy
    # Code for deleting an album goes here.
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to root_path
  end

  def add
    @recipe = Recipe.find(params[:id])

    if params[:ingredient]

    ingredient = Ingredient.where(name: params[:ingredient].fetch("ingredient")).first

    @recipe.ingredients << ingredient



  elsif params[:tag]

    tag = Tag.where(name: params[:tag].fetch("tag")).first

    @recipe.tags << tag



  end

    redirect_to recipe_path


  end
end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :rating, :description)
  end
end
