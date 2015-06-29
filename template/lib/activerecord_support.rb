
require_relative '../db/config'
ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection settings.environment
#网上抄的
before { ActiveRecord::Base.verify_active_connections! if ActiveRecord::Base.respond_to?(:verify_active_connections!) }
after  { ActiveRecord::Base.clear_active_connections! }
