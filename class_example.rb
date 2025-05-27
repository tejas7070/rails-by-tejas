class ClassExample
  def initialize(name)  #Contructor sets an Arguement to be given while creating an object{eg. obj1}
    @name = name 
  end
  def Greetings
    puts "Hello #{@name}, Welcome to the world of Ruby on Rails!" #To use that Arguement we need to use the @ symbol {eg. #{@name}}.
  end
  def self.Class_method
    puts " Hello Developer, Welcome to the world of Ruby on Rails! using a class method."
  end
end

obj1 = ClassExample.new('Tejas') # This creates an instance of ClassExample and passes 'Tejas' as an argument to the initialize method.

puts obj1.methods # This will print all the methods available in the ClassExample class which the Ruby interpreter has created for the object obj1.

puts obj1.class # This will print the class of the object obj1.

puts obj1.Greetings # This will call the Greetings method of the ClassExample class and print the greeting message.

ClassExample.Class_method # This will call the class method of the ClassExample class and print the greeting message.
                             #it cannot be called using obj1.Class_method because it is a class method(it only works for instance methods).
