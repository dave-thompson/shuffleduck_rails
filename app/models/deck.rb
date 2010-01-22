class Deck < ActiveRecord::Base
  belongs_to :user
  has_one :deck_detail, :dependent => :destroy
  validates_uniqueness_of :user_visible_id
  
  def before_save
    @attempted_save_level ||= 0
    @attempted_save_level += 1
  end
  
  def after_save
    logger.debug "Save level: #{@attempted_save_level}"
    if (@attempted_save_level == 1)
      logger.debug "User visible ID: #{user_visible_id}" if defined?(user_visible_id)
      unless user_visible_id
        logger.debug "Setting user_visible_id"
        self.user_visible_id = ((id + 3000)*10000) + rand(10000)
        logger.debug "ID: #{id}"
        logger.debug "User Visible ID: #{user_visible_id}"
        save
      end
      @attempted_save_level -= 1
    end
  end
  
end
