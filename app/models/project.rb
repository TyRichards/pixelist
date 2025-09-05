class Project < ApplicationRecord
  has_many :todos, dependent: :destroy
  validates :name, presence: { message: "- Oops, you forgot to add a name." }
end
