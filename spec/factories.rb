FactoryBot.define do
  
  factory :user do
    name {"Nati"}
    email {"nati@gmail.com"}
    password {"password"}
  end
  def valid_sign_in(user) 
    visit root_path
    fill_in "Email", with: user.email 
    fill_in "Password", with: user.password 
    uncheck(:remember_me) 
    click_button "Log in" # Sign in when not using Capybara as well. cookies[:remember_token] = user.remember_token 
end 
end