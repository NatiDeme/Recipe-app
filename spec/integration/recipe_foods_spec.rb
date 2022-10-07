require 'rails_helper'

RSpec.describe 'recipes', type: :feature do
  describe 'Tesing the creation of recipe' do 
    before :all do
      @user1 = User.create(name: 'Nati', email: 'user@example.com', password: 'password', confirmed_at: Time.now)
      @recipe1 = Recipe.create(name: 'Cooking burger', preparation_time: '02:00:00', cooking_time: '02:00:00', description: 'good food', public: true, user: @user1)
      @food1 = Food.create(name: 'Potato', measurement_unit: 'kg', quantity: 4, price: 2, user: @user1)
      @recipe_food1 = RecipeFood.create(quantity: 1, foods: @food1, recipes: @recipe1)
    end
    it "shows recipe food list for a single recipe" do
      visit root_path 
      within('body') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      sleep 3
      visit recipes_path
      click_link 'Cooking burger'
      click_button 'Generate Shopping List'
      expect(page).to have_content('Potato')
    end
    it "shows Total value of food needed" do
      visit root_path 
      within('body') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      sleep 3
      visit recipes_path
      click_link 'Cooking burger'
      click_button 'Generate Shopping List'
      expect(page).to have_content('Total value of food needed')
    end
    it "shows Total value of food needed" do
      visit root_path 
      within('body') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      sleep 3
      visit recipes_path
      click_link 'Cooking burger'
      click_button 'Generate Shopping List'
      expect(page).to have_content('Amount of food')
    end
  end
end



