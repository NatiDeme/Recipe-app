class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    # render :new, locals: { user: current_user, food: Food.new }
    @food = Food.new
  end

  def create
    # respond_to do |format|
    # format.html do
    @food = Food.new(food_params)
    @food.user = current_user
    @recipe_food = RecipeFood(food_id: @food.id)
    if @food.valid?
      @food.save
      flash[:notice] = 'New Food Created Successfully'
      redirect_to foods_path
    else
      render :new
    end
    # end
    # end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    # flash[:notice] = ['Food Deleted Successfully']
    redirect_to foods_path, notice: 'Successfully removed the Food.'
  end

  private

  def food_params
    params.require(:food).permit!
  end
end
