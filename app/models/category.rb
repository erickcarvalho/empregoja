class Category < ApplicationRecord
  has_many :jobs
  validates :name, uniqueness: { message: 'Nome da categoria não pode duplicar'}
  validates :name, presence: { message: 'Não é possível criar categoria em branco'}
end
