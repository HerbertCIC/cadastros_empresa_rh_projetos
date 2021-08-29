class Company < ApplicationRecord
  has_many :hrs
  has_many :projects

  validates :description, presence: true
  validates_cnpj :cnpj
  validates :cnpj, uniqueness: true
  validates :email, email: { allow_blank: true }
end
