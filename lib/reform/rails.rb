require "reform/rails/version"
require "reform/rails/config"

require "reform"
require "reform/form/active_model"
require "reform/form/multi_parameter_attributes"

require "reform/active_record" if defined?(ActiveRecord)
require "reform/mongoid" if defined?(Mongoid)

Reform::Form.class_eval do
  include Reform::Form::ActiveModel
  include Reform::Form::ActiveModel::FormBuilderMethods
  include Reform::Form::ActiveRecord if defined?(ActiveRecord)
  include Reform::Form::Mongoid if defined?(Mongoid)

  if Reform::Rails.config.validation_engine == 'active_model'
    include Reform::Form::ActiveModel::Validations
  else
    require "reform/form/dry"
    feature Reform::Form::Dry
  end
end

module Reform
  def self.rails3_0?
    ::ActiveModel::VERSION::MAJOR == 3 and ::ActiveModel::VERSION::MINOR == 0
  end
end
