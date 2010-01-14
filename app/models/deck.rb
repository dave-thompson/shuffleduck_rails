class Deck < ActiveRecord::Base
  has_one :deck_detail, :dependent => :destroy
  validates_uniqueness_of :user_visible_id
end
