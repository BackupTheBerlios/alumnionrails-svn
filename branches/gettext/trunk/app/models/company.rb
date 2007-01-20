class Company < ActiveRecord::Base
  has_many  :addresses
  belongs_to  :user
end
