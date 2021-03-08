class Address < ApplicationRecord
    belongs_to :building, optional: true
    belongs_to :customer, optional: true
end