require 'rails_helper'

RSpec.describe 'foods', type: :feature do
  describe 'Tesing the creation of food' do
    before :all do
      @user1 = User.create(name: 'Nati', email: 'user@example.com', password: 'password', confirmed_at: Time.now)
      @recipe1 = Food.create(name: 'Potato', measurement_unit: 'kg', quantity: 4, price: 2, user: @user1)
    end
    it 'shows food' do
      visit root_path
      within('body') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      sleep 3
      expect(page).to have_content('Potato')
    end
    it 'shows food quantity' do
      visit root_path
      within('body') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      sleep 3
      expect(page).to have_content('4')
    end
    it 'shows foods price' do
      visit root_path
      within('body') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      sleep 3
      expect(page).to have_content('$2')
    end
    it 'shows foods measurement unit' do
      visit root_path
      within('body') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      sleep 3
      expect(page).to have_content('kg')
    end
    it 'shows button to add new food' do
      visit root_path
      within('body') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      sleep 3
      click_button 'Add food'
      expect(page).to have_content('Name')
    end
  end
end
