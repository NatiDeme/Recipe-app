require 'rails_helper'

RSpec.describe 'recipes', type: :feature do
  describe 'Tesing the creation of recipe' do 
    before :all do
      @user1 = User.create(name: 'Nati', email: 'user@example.com', password: 'password', confirmed_at: Time.now)
      @recipe1 = Recipe.create(name: 'Cooking pasta', preparation_time: '02:00:00', cooking_time: '02:00:00', description: 'good food', public: true, user: @user1)
    end
    it "shows recipe title" do
      visit root_path 
      within('body') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      sleep 3
      visit recipes_path  
      expect(page).to have_content('Cooking pasta')
    end
    it "shows recipe description" do
      visit root_path 
      within('body') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      sleep 3
      visit recipes_path 
      expect(page).to have_content('good food')
    end
    it "shows recipe detail" do
      visit root_path 
      within('body') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      sleep 3
      visit recipes_path
      click_link 'Cooking pasta'
      expect(page).to have_content('Preparation Time')
    end
  end
end



