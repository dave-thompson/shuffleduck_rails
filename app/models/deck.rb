class Deck < ActiveRecord::Base
  attr_accessible
  belongs_to :user
  has_one :deck_detail, :dependent => :destroy
  validates_uniqueness_of :user_visible_id
  
  def before_save
    @attempted_save_level ||= 0
    @attempted_save_level += 1
  end
  
  def after_save
    if (@attempted_save_level == 1)
      unless user_visible_id
        self.user_visible_id = ((id + 3000)*10000) + rand(10000)
        save
      end
      @attempted_save_level -= 1
    end
  end
  
end
