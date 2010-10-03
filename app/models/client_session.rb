class ClientSession < Authlogic::Session::Base
  api_key_param 'app_key'
end