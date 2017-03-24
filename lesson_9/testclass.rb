require_relative 'validation'

class TestClass

  include Validation::InstanceMethods
  extend Validation::ClassMethods

  attr_accessor :year, :string, :number

  validate :year, :presence
  validate :string, :presence
  validate :string, :format, /^[a-z0-9]{3}-*[a-z0-9]{2}\z/ # 12345 and 123-45 ok
  validate :string, :type, String
  validate :number, :presence
  validate :number, :type, Integer
end

a = TestClass.new
p a.class.instance_variable_get(:@validations)
a.year= 1988
a.string= '12345' #wrong
a.number= 123
p a.valid?
a.validate!
