module Validation

  module ClassMethods
    
  def validate(attr, type, *args)
    if type == :presence
      raise 'could not be nil' if  attr.nil?
      raise 'could not be empty' if attr.empty?
    elsif type == :format
    end
  end

  module InstanceMethods

    def validate!
      validate
    end

    valid?
    
        
end
