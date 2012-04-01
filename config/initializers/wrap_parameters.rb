# Be sure to restart your server when you modify this file.
#
# This file contains settings for ActionController::ParamsWrapper which
# is enabled by default.

# Enable parameter wrapping for JSON. You can disable this by setting :format to an empty array.
<<<<<<< HEAD
ActiveSupport.on_load(:action_controller) do
  wrap_parameters format: [:json]
end

# Disable root element in JSON by default.
ActiveSupport.on_load(:active_record) do
  self.include_root_in_json = false
=======
ActionController::Base.wrap_parameters :format => [:json]

# Disable root element in JSON by default.
if defined?(ActiveRecord)
  ActiveRecord::Base.include_root_in_json = false
>>>>>>> af435c4bc5467c40a503b053920c1a7a3dddb6f4
end
