describe 'the product delete path' do
  it "deletes a product" do
    user = User.create!(:email => 'celeste@aol.com', :password => 'hello1234567', :admin => 'true')
    login_as(user, :scope => :user)
    test_product = Product.create(name: "Apple", cost: 3, country_of_origin: "Mexico", id: nil)
    test_product.save
    id = test_product.id
    visit product_path(test_product)
    click_button "Delete product"
    expect(page).to_not have_content "Apple"
  end
end

