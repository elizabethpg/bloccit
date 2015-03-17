class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

    scope :visibile_to, -> (user) { user ? all : where(public: true) }
end
