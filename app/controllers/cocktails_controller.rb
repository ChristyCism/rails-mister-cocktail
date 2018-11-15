class CocktailsController < ApplicationController
  # A user can see the list of cocktails
  def index
    @cocktails = Cocktail.all
  end

  #A user can see the details of a given cocktail, with the dose needed for each ingredient
  def show
    @cocktail = Cocktail.find(params[:id])
  end

  # A user can create a new cocktail
  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      @cocktails.errors
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
