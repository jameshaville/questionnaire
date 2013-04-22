class Form < ActiveRecord::Base
  attr_accessible :email, :name
  validates :name, presence: true, length: { minimum: 2}
  validates :email, presence: true, uniqueness: true
end
