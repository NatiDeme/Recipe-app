class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def show
    @food = Food.find(params[:id])
  end

  def create
    respond_to do |format|
      format.html do
        @food = Food.new(food_params)
        if @food.valid?
          @food.save
          flash[:notice] = 'New Food Created Successfully'
          redirect_to foods_path
        else
          render :new
        end
      end
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @comment.destroy
    # flash[:notice] = ['Food Deleted Successfully']
    redirect_to foods_path, notice: 'Successfully removed the Food.'
  end

  private

  def food_params
    params.require(:food).permit!
  end
end
