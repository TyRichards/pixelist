class Project < ApplicationRecord
  validates :name, presence: { message: "- Oops, you forgot to add a name." }
end
