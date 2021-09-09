class Project < ApplicationRecord
  belongs_to :company

  validates :name, presence: true
  validates :value, numericality: true, allow_blank: true
end
