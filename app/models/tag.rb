class Tag < ActiveRecord::Base
  has_many :notes
  has_many :posts, through: :notes
end
