class Company < ApplicationRecord
  has_many :human_resources, dependent: :destroy
  has_many :projects, dependent: :destroy

  validates :description, presence: true
  validates_cnpj :cnpj
  validates :cnpj, uniqueness: true
  validates :email, email: { allow_blank: true }
end
