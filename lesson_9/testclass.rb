require_relative 'validation'
require_relative 'acessors'

class TestClass

  include Validation::InstanceMethods
  extend Validation::ClassMethods
  extend Acessors

  attr_accessor :year, :string, :number
  # attr_accessor_with_history :year, :string, :number

  def initialize(year, string, number)
    @year = year
    @string = string
    @number = number
    # validate!
  end

  validate :year, :presence
  validate :string, :presence
  validate :string, :format, /^[a-z]{5}/ #/^[a-z0-9]{3}-*[a-z0-9]{2}\z/ # 12345 and 123-45 ok
  validate :string, :type, String
  validate :number, :presence
  validate :number, :type, Integer
end

a = TestClass.new(1988, '12345', 23)
p a.class.instance_variable_get(:@validations)
a.year= 1988
a.string= 'qwert' #wrong
a.number= 123
p a.valid?
a.validate!

# a.year= 33445
# a.string= 'goodbuy'
# a.number= 4567

# p a.year_history
# p a.string_history
# p a.number_history
