class Client < ActiveRecord::Base
  acts_as_authentic do |config|
  end
end