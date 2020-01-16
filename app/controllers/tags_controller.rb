class TagsController < ApplicationController

  # def index
  #   # Code for listing all albums goes here.
  #   @tags= Tag.all
  #   @tags= Tag.all
  #   @tags= Tag.all
  #   :index
  # end

  def new
    # Code for new album form goes here.
    @tag = Tag.new
    :new
  end

  def create
    # Code for creating a new album goes here.
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to root_path
    else
      render :new

  end

  def edit
    # Code for edit album form goes here.
    @tag = Tag.find(params[:id])
    render :edit
  end

  def show
    # Code for showing a single album goes here.
    @tag = Tag.find(params[:id])

    render :show
  end

  def update
    # Code for updating an album goes here.

    @tag= Tag.find(params[:id])
      if @tag.update(tag_params)
        redirect_to tag_path
      else
        render :edit
      end
  end

  def destroy
    # Code for deleting an album goes here.
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to root_path
  end


end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
