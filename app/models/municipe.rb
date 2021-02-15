class Municipe < ApplicationRecord
    has_one :address
    accepts_nested_attributes_for :address

    validates :full_name, :cpf, :phone, presence: true
    validates :cpf, uniqueness: true
end
