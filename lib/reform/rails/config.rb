require "dry-configurable"

module Reform
  module Rails
    extend Dry::Configurable
    setting :validation_engine, 'active_model'
  end
end
