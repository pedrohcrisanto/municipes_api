class Address < ApplicationRecord
  belongs_to :municipe

  validates :zip, :street, :complement, :neighborhood, :city, :uf, presence: true
end
