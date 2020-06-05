describe "the edit a product process" do
  it "edits a product" do
    test_product = Product.create(name: "Apple", cost: 3, country_of_origin: "Mexico", id: nil)
    test_product.save
    visit product_path(test_product)
    click_button 'Edit'
    fill_in 'Name', :with => 'Apple'
    fill_in 'Cost', :with => 3
    fill_in 'Country of origin', :with => 'Mexico'
    click_on 'Update Product'
    expect(page).to have_content 'Apple'
  end
end