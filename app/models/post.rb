
class Post < ActiveRecord::Base
  has_many :notes
  has_many :tags, through: :notes

  validates :body, :presence => true
  validates :title, :presence => true, length: {minimum: 3}

end