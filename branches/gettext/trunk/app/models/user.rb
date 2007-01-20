class User < ActiveRecord::Base
  has_one :address
  belongs_to  :course
  has_many  :companies
  has_many  :degrees
  has_many  :links
  has_many  :papers
  has_many  :trainings
  has_many  :user_skills
end
