class HumanResource < ApplicationRecord
  belongs_to :company

  validates :name, presence: true
  validates_cpf :cpf
  validates :cpf, uniqueness: true
  validates :email, email: { allow_blank: true }
  validates :phone_number, length: { minimum: 11, maximum: 15, allow_blank: true }
end
