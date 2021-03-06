require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    user = User.create!(:email => 'celeste@aol.com', :password => 'hello1234567', :admin => 'true')
    login_as(user, :scope => :user)
    visit products_path
    click_link 'Create New Product'
    fill_in 'Name', :with => 'Cheese'
    fill_in 'Cost', :with => 2
    fill_in 'Country of origin', :with => 'Usa'
    click_on 'Create Product'
    expect(page).to have_content 'Cheese'
  end

  it "gives an error when no name is entered" do
    user = User.create!(:email => 'celeste@aol.com', :password => 'hello1234567', :admin => 'true')
    login_as(user, :scope => :user)
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Country of origin can't be blank"
  end
end

 