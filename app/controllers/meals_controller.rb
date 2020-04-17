class MealsController < ApplicationController
  def index
    @meals = Meal.all
    if @meals
      render json: {
        meals: @meals
      }
    else
      render json: {
        status: 500,
        errors: [ 'no meals found']
      }
    end
  end

  def show
    @meal = Meal.find(params[:id])
    if @meal
      render json: {
        meal: @meal
      }
    else
      render json: {
        status: 500,
        errors: ['meal not found']
      }
    end
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      render json: {
        status: :created,
        meal: @meal
      }
    else 
      render json: {
        status: 500, 
        errors: @meal.errors.full_messages
      }
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def meal_params
      params.require(:meal).permit(:name, :description, :date, :link_to_recipe, :user_id)
    end
end
