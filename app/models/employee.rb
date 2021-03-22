class Employee < ApplicationRecord
    belongs_to :user
    has_many :intervention
end
