class Address < ActiveRecord::Base
  has_one :country
  belongs_to  :user
  belongs_to  :company
end
