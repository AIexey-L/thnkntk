module Validation
  
  module ClassMethods
    
    def validate(attr, type, *arg)
      @validations ||= []
      @validations << { attr.to_sym => [type.to_sym, arg.first].compact }
      @validations = @validations.uniq
    end
  end

  module InstanceMethods

    def validate!
      self.class.instance_variable_get(:@validations).each do |validation|
        case check_type(validation)
        when :presence
          unless presence?(attr_name(validation))
            raise "'#{attr_name(validation)}' is nil or empty"
          end
        when :format
          unless format?(attr_name(validation), valid_arg(validation))
            raise "Wrong format of argument:'#{attr_name(validation)}'"
          end
        when :type
          unless type?(attr_name(validation), valid_arg(validation))
            raise "Wrong type of argument:'#{attr_name(validation)}'"
          end
        end
      end
    end

    def valid?
      begin
        validate!
        true
      rescue
        false
      end
    end
    
    private

    def valid_arg(validation)
      validation.values[0].last
    end
    
    def check_type(validation)
      validation.values[0].first
    end

    def attr_name(validation)
      validation.keys[0]
    end
    
    def var_value(attr)
      self.instance_variable_get("@#{attr}")
    end

    def presence?(attr)
      var_value(attr).nil? || var_value(attr).to_s.empty? ? false : true
    end

    def format?(attr, value)
      var_value(attr) =~ value ? true : false
    end

    def type?(attr, value)
      var_value(attr).class == value ? true : false
    end
  end
end
