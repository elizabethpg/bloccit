class Post < ActiveRecord::Base
  scope :ordered_by_title, -> { order(:title, :asc) }

  has_many :comments
  belongs_to :user

end
