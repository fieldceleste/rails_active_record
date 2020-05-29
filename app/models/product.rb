class Product < ApplicationRecord
  
  
  
  
  
  has_many :reviews,  dependent: :destroy
  validates :name, presence: true
  validates :country_of_origin, presence: true
  validates_length_of :name, maximum: 50
  before_save(:titleize_product)
  

  private
    def titleize_product
      self.name = self.name.titleize
      self.country_of_origin = self.country_of_origin.titleize
    end
end