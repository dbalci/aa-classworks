# Requiring Files Notes
# ⏱ 10 minutes

# Requiring Files
# As our programs grow more and more complex, we'll want to separate code into many files. This will help our code stay organized and easy to maintain. We've been using this organization a bit so far in the course: we often separate our test code (spec files) from our actual implementation files. In the previous RSPEC based projects, you may have noticed the /spec and /lib folders found in each project root. Let's step through an example of how we can divide our code into files!

# Enter Pet Hotel
# Using the previous concept of classes, let's design a PetHotel that will house Cats as guests. Let's begin by writing both classes in the same file:

# # pet_hotel.rb

# class PetHotel
#   def initialize(name)
#     @name = name
#     @guests = []
#   end

#   def check_in(guest)
#     @guests << guest
#   end
# end

# class Cat
#   def initialize(name)
#     @name = name
#   end
# end

# hotel = PetHotel.new("Animal Inn")

# cat_1 = Cat.new("Sennacy")
# cat_2 = Cat.new("Whiskers")

# hotel.check_in(cat_1)
# hotel.check_in(cat_2)

# p hotel
# # <PetHotel:0x007fb1ce1e91f0
# #   @name="Animal Inn",
# #   @guests=[
# #     #<Cat:0x007fb1ce1e9060 @name="Sennacy">,
# #     #<Cat:0x007fb1ce1e8f48 @name="Whiskers">
# #   ]
# # >
# The code above seems acceptable, but what if our PetHotel and Cat classes were more complex? Grouping these two classes in the same file may no longer be viable. Even further, what if our PetHotel should be able to house other animals like Dogs, Birds, etc.? We should avoid creating one massive file for all of this classes and logic. A great design principle to follow is Separation of Concerns. One file should focus on implementing one class. After all, our Cat class should be able to stand on it's own without interaction from PetHotel. Let's decouple Cat from PetHotel to increase reusability of our classes.

# A Better Hotel design
# Below is one way we could organize our different files. project_root is our outermost folder that will contain everything. Names that end in .rb are files, names that don't end in .rb are folders:

# project_root
#   ├── pet_hotel.rb
#   ├── cat.rb
#   └── other_animals
#       └── dog.rb
# However, if PetHotel and Cat exist in separate files, how can we connect the two? We need to "import" cat.rb into pet_hotel.rb. In other words, we need to require cat.rb in pet_hotel.rb. Let's take a look into how we can do this along with dog.rb, using the require_relative method next.

# Require Relative
# Keep in mind the folder structure above and take a look at the code we could have in each file:

# # project_root/cat.rb
# class Cat
#   def initialize(name)
#     @name = name
#   end
# end
# # project_root/other_animals/dog.rb
# class Dog
#   def initialize(name)
#     @name = name
#   end
# end
# # project_root/pet_hotel.rb

# # Let's require the last two files, by specifying their path's relative to this pet_hotel.rb file
# require_relative "./cat.rb"
# require_relative "./other_animals/dog.rb"

# class PetHotel
#   def initialize(name)
#     @name = name
#     @guests = []
#   end

#   def check_in(guest)
#     @guests << guest
#   end
# end

# hotel = PetHotel.new("Animal Inn")

# cat = Cat.new("Sennacy")
# dog = Dog.new("Fido")

# hotel.check_in(cat)
# hotel.check_in(dog)

# p hotel
# # <PetHotel:0x007ffe7f01af60
# #   @name="Animal Inn",
# #   @guests=[
# #     #<Cat:0x007ffe7f01aee8 @name="Sennacy">,
# #     #<Dog:0x007ffe7f01ae98 @name="Fido">
# #   ]
# # >
# To run our hotel, we would just need to execute ruby pet_hotel.rb. Because pet_hotel.rb requires cat.rb and dog.rb, the code in those files will also execute.

# require_relative is a method we can use to specify a path to another ruby file. As it's name suggests, we need to specify a path that is relative to our current location. So if we are at pet_hotel.rb a relative path to cat.rb is ./cat.rb. A single dot (./) denotes the current location of our file.

# dog.rb is not immediately found in our current location; it is one folder away. So the relative path from pet_hotel.rb to dog.rb is ./other_animals/dog.rb.

# require vs require_relative
# You may have noticed that in the course projects we have used require instead of require_relative in our /spec files. We use the plain require because we run the code using RSPEC via bundle exec rspec. RSPEC will automatically run the code in a certain configuration where it will automatically know to look inside of the /lib folder. In fact, RSPEC is designed to be used where you have a separate /spec and /lib folders. To get into the nitty gritty details, RSPEC will configure the $LOAD_PATH for us. But don't worry about this for now.

# As a rule of thumb, we'll use the plain require where gems are involved. In the previous sections that used the byebug gem, we had to write require "byebug" to access the debugger. It's obvious that we don't have an explicit byebug.rb file in those old projects. This is because ruby already knows where to find byebug through the $LOAD_PATH.

# User Input Notes
# ⏱ 6 minutes

# User Input
# So far in the course we have only written code that executes without any input from a user. In order to make our programs interactive, we'll need to learn how to allow the user to interact through their keyboard.

# Getting Input
# The built in method we'll use to allow a user to give input is gets. The gets method is unique in that when it is called, it will halt execution of the code and allow the user to type characters until they press enter on their keyboard. Once enter is hit, the gets method will return a string containing the user's keystrokes. Let's take a look at gets in action:

# p "Enter your name:"
# name = gets
# p "hello " + name
# The program above will ask a use to enter their name and then print "hello name". Try putting this code in a file and running it to see for yourself!

# Dealing with New Lines
# When using gets, the string returned represents the keys typed by the user. However, since the user presses enter to end their input, this will add a newline character at the end of the string. \n is how we represent the newline character in programming. You'll notice that every string returned from gets will end in \n as a result of this. We should be very aware of this extra character when using gets. Here's a common mistake:

# puts "Enter 'yes' or 'no'"

# response = gets

# if response == "yes"
#   puts "yup!"
# elsif response == "no"
#   puts "nah!"
# else
#   puts "I'm sorry, my responses are limited."
# end
# As this codes stands, if the user enters a valid response of yes the conditional would not be able to catch this. This is because gets will really return "yes\n". "yes" is not equal to "yes\n", bummer.

# Chomping New Lines
# To fix the issue in the previous code, we can use a string method, chomp to remove all newline chars (\n) at the end of a string by returning a new string. Note that chomp is just a plain string method:

# my_string = "yes\n"
# p my_string       # "yes\n"

# p my_string.chomp # "yes"
# Since gets returns a string, let's chomp it in our old example. Here is the correct code:

# puts "Enter 'yes' or 'no'"

# response = gets.chomp

# if response == "yes"
#   puts "yup!"
# elsif response == "no"
#   puts "nah!"
# else
#   puts "I'm sorry, my responses are limited."
# end
# When the user responds with yes or no, the code above will run accordingly.

# Getting Numbers
# Another common mistake happens when we try to get number input from the user. Take a look at this faulty code:

# puts "Enter a number: "
# num = gets.chomp
# puts 2 * num      #TypeError: String can't be coerced into Integer
# When the user enters a "number", the code will get an error because gets will always return a string of characters. So if the user intended to enter the number 42, num would really be the string "42".

# Converting Strings to Numbers
# To fix the previous error we'll use the to_i on strings. This method will convert a string to an integer:

# numeric_string = "42"
# p numeric_string      # "42"
# p numeric_string.to_i # 42
# Let's apply this to the last example:

# puts "Enter a number: "
# num = gets.chomp.to_i
# puts 2 * num
# If the user enters 42, the program will correctly print 84.

# Abstraction And Encapsulation Notes
# ⏱ 10 minutes

# Object Oriented Programming
# Object Oriented Programming is a design pattern developers use when building applications. You've been using this design pattern through the last few sections, but now let's truly adopt an object oriented mindset.

# The goal of OOP is to create programs using objects that interact with each other. We implement classes to create those objects. Let's take a look at 2 pillars of OOP: Abstraction and Encapsulation.

# Abstraction
# In OOP, abstraction is the process of exposing essential features of an object while hiding inner details that are not necessary to using the feature. Take this analogy: Many drivers do not understand the mechanical details of how a steering wheel works, but they can still use the steering wheel to drive a car. In a similar way, our classes should have methods that are simple to use because they hide complex logic inside of them. Let's explore some examples.

# Below is a class that does not abstract how to enroll a student into a course:

# class Course
#   def initialize(name, teachers, max_students)
#     @name = name
#     @teachers = teachers
#     @max_students = max_students
#     @students = []
#   end

#   def max_students
#     @max_students
#   end

#   def students
#     @students
#   end
# end  

# course = Course.new("Object Oriented Programming 101", ["Ada Lovelace", "Brian Kernighan"], 3)

# # Let's to enroll a student
# if course.students.length < course.max_students
#   course.students << "Alice"
# end
# Below is the class with a nicely abstracted #enroll method:

# class Course
#   def initialize(name, teachers, max_students)
#     @name = name
#     @teachers = teachers
#     @max_students = max_students
#     @students = []
#   end

#   def enroll(student)
#     @students << student if @students.length < @max_students
#   end
# end  

# course = Course.new("Object Oriented Programming 101", ["Ada Lovelace", "Brian Kernighan"], 3)

# # Let's to enroll a student
# course.enroll("Alice")
# Abstraction results in code that is readable and easy to use. There could be many steps that need to take place when a student is enrolled, and a #enroll method can take care of all of them behind the scenes, unknown to the user of the class.

# We have been using this concept of abstraction all the time! Array is a class and Array#include? is a method that we feel comfortable using although we do not know the exact implementation details within the method.

# Encapsulation
# Similar to abstraction, encapsulation closely relates methods and data attributes together with the hope of preventing misuse. For us, the goal of encapsulation is to give users access to the things that are safe for them to use. Some data we may choose to keep private or purposefully hide from outside users for the sake of security. One common way to encapsulate data attributes is by making them only accessible through methods that we explicitly design as programmers!

# Here's some food for thought: Ruby classes have some level of encapsulation by default. How so? Well, if we create a class with attributes, those attributes are inaccessible from the outside unless define getter or setter methods too!

# Design your code in a way that safeguards against misuse! Let's take a look at an example. Say we wanted a class to track the order of people waiting in a line. We call this concept a Queue. The rules of a Queue are simple: if you are the first one in, then you are also the first one out. No cutting the line! More programmatically, we remove from the front of the line, but we add to the back of the line.

# We'll use the index 0 of an array to represent what is at the front of the line.

# Let's take a look at a properly encapsulated Queue class.

# class Queue
#   def initialize
#     @line = []
#   end

#   def add(ele)
#     @line << ele # add ele to back of line
#     nil
#   end

#   def remove
#     @line.shift  # remove front ele of line
#   end
# end

# grocery_checkout = Queue.new

# grocery_checkout.add("bob")
# grocery_checkout.add("alice")
# grocery_checkout.remove          # => "bob"
# grocery_checkout.add("noam")
# grocery_checkout.add("donald")
# grocery_checkout.remove          # => "alice"
# grocery_checkout.remove          # => "noam"
# grocery_checkout.remove          # => "donald"

# # people who are added first to the line will leave first!
# You'll notice that above we decided to not include a getter for @line, that is because we shouldn't include a full getter. If we give the user full access to the @line then we can't enforce any of our rules and the result is disastrous:

# # this class fails to encapsulate
# class Queue
#   def initialize
#     @line = []
#   end

#   def line
#     @line
#   end

#   def add(ele)
#     @line << ele # add ele to back of line
#     nil
#   end

#   def remove
#     @line.shift  # remove front ele of line
#   end
# end

# grocery_checkout = Queue.new

# grocery_checkout.add("bob")
# grocery_checkout.add("alice")
# grocery_checkout.line.unshift("noam")   # noam cut the line!
# grocery_checkout.remove                 # => "noam"
# Wrapping Up
# Abstraction and Encapsulation are just two pillars of OOP. As you progress in your programming career, you'll learn how to support other pillars of object oriented programming! So stay tuned.

# Attr Methods Notes
# ⏱ 10 minutes

# Attribute Methods
# Let's learn some new methods that can clean up the way we write our classes. So far in the course, we've had to manually implement getter and setter methods for our attributes. Below is a class with some classic getter/setter methods that we'll refactor. Using what we learned so far in the course:

# class Dog
#   def initialize(name, age, favorite_food)
#     @name = name
#     @age = age
#     @favorite_food = favorite_food
#   end

#   # getters
#   def name
#     @name
#   end

#   def age
#     @age
#   end

#   # setters
#   def name=(new_name)
#     @name = new_name
#   end

#   def age=(new_age)
#     @age = new_age
#   end
# end
# attr_reader
# Creating getter methods for the attributes we want to expose is pretty repetitive. Let's use a new method attr_reader, to create the getters for name and age automatically:

# class Dog
#   # attr_reader will define #name and #age getters for us
#   attr_reader :name, :age

#   def initialize(name, age, favorite_food)
#     @name = name
#     @age = age
#     @favorite_food = favorite_food
#   end
# end

# dog = Dog.new("Fido", 3, "pizza")
# dog.name
# dog.age
# dog.favorite_food # NoMethodError: undefined method `favorite_food', because we didn't pass it to attr_reader
# Let's break down the new line above. attr_reader is a built in ruby method that we are calling inside of the Dog class. Note that we don't call it within initialize. attr_reader should be passed symbols that correspond to the names of the attributes we want to have getters for.

# In other words, when we have this call to attr_reader:

# class MyClass
#   attr_reader :attribute_1
#   # ...
# end
# It would result in this getter method being defined under the hood:

# class MyClass
#   # ...
#   def attribute_1
#     @attribute_1
#   end
# end
# Don't be thrown off by the syntax we use to call attr_reader. By convention in Ruby, we omit the parentheses for attr methods. However, attr_reader :name, :age is equivalent to the explicit attr_reader(:name, :age).

# attr_writer
# In a similar way, we can use attr_writer to define setter methods:

# class Dog
#   # attr_writer will define #name= and #age= setters for us
#   attr_writer :name, :age

#   def initialize(name, age, favorite_food)
#     @name = name
#     @age = age
#     @favorite_food = favorite_food
#   end
# end

# dog = Dog.new("Fido", 3, "pizza")

# dog.name = "Spot"
# dog.age += 1

# p dog #<Dog:0x007fd87f1144a0 @age=4, @favorite_food="pizza", @name="Spot">

# dog.favorite_food = "calzone" # NoMethodError: undefined method `favorite_food=', because we did't pass it to attr_writer
# In other words, when we have this call to attr_writer:

# class MyClass
#   attr_writer :attribute_1
#   # ...
# end
# It would result in this setter method being defined under the hood:

# class MyClass
#   # ...
#   def attribute_1=(new_val)
#     @attribute_1 = new_val
#   end
# end
# attr_accessor
# Often times we may want to both a getter and setter for an attribute. If we are in this scenario, we can use the attr_accessor method. It is a combination of attr_reader and attr_writer in that it will create both getters and setters for the specified attributes.

# class Dog
#   # attr_accessor will define #name, #name=, #age, #age= methods for us
#   attr_accessor :name, :age

#   def initialize(name, age, favorite_food)
#     @name = name
#     @age = age
#     @favorite_food = favorite_food
#   end
# end

# dog = Dog.new("Fido", 3, "pizza")

# # Let's use the setter and getter for name!
# dog.name = "Spot"
# p dog.name          # "Spot"
# Wrapping Up
# Awesome, our code looks much cleaner! However, be cautious. Like we explored in our chat about encapsulation, don't just take all your class's attributes and pass them to attr_accessor. Consider if a user of the class needs to manipulate that data with a raw getter or setter. Or more importantly consider if it is safe for a user to do so. Only use getters and setters for what you want to expose in your classes.

# Syntactic Sugar Notes
# ⏱ 5 minutes

# Syntactic Sugar
# As you've been learning with us through the course, you may have noticed we often write code in a particular way only to replace that code style with a shortcut that is more elegant and preferred later on. We introduce the longhand ways of writing things first so you have deep understanding of the underlying concepts. Once you do learn the shortcuts, you also have an appreciation of how expressive of a language Ruby is! There's a method to the madness.†

# The previous attr methods are a good example of this. The broad name for code or syntax that is a "shortcut" for other code is "Syntactic Sugar". For example, attr_reader is syntactic sugar for defining a full getter method! We use syntactic sugar to sweeten up our code, making it more readable.

# Let's explore some syntactic sugar methods we can use in our classes:

# Implementing "operator" Methods
# Like we alluded to in previous sections of the course. You can implement +, ==, >, etc.. methods on your classes. Let's say we had a Person class and we wanted to implement equality, ==, on the basis of last_name:

# class Person
#   attr_reader :first_name, :last_name

#   def initialize(first_name, last_name, age)
#     @first_name = first_name
#     @last_name = last_name
#     @age = age
#   end

#   def ==(other_person)
#     self.last_name == other_person.last_name
#   end
# end

# person_1 = Person.new("Jane", "Doe", 20)
# person_2 = Person.new("John", "Doe", 18)
# person_3 = Person.new("John", "Wayne", 18)

# # Calling Person#== without any syntactic sugar is awkward:
# p person_1.==(person_2)     # true

# # With syntactic sugar, it's much more elegant:
# p person_1 == person_2      # true
# p person_2 == person_3      # false
# As always, if you treat Person#== as a method where "==" is the name, then we can call it with person_1.==(person_2). In this context since person_1 is the object calling ==, self will refer to person_1 inside of the method. person_2 is obviously the other_person argument since it is being passed as an arg within the parens. Syntactic sugar comes in when we drop the . and (). The resulting calls are much cleaner!

# For these methods like ==, +, >, etc. you can typically identify the object to the left as what self will refer to within the method. The argument will be the object to the right. This is exactly the case in our Person#== method.

# Implementing Bracket Methods
# Let's explore how to implement a custom #[] method on our classes. We often use this method to index an Array or key a Hash.

# Say we wanted to have a Queue#[] method to return the element at the given position in the @line. Like we explored in our abstraction and encapsulation lesson, we want to avoid giving direct access to the @line array.

# class Queue
#   def initialize
#     @line = []
#   end

#   def [](position)
#     @line[position]
#   end

#   def add(ele)
#     @line << ele # add ele to back of line
#     nil
#   end

#   def remove
#     @line.shift  # remove front ele of line
#   end
# end

# grocery_checkout = Queue.new
# grocery_checkout.add("Alan")
# grocery_checkout.add("Alonzo")

# # Calling Queue#[] without any syntactic sugar is ugly:
# grocery_checkout.[](0)          # "Alan"
# grocery_checkout.[](1)          # "Alonzo"

# # With syntactic sugar, it's waaaaay better:
# grocery_checkout[0]             # "Alan"
# grocery_checkout[1]             # "Alonzo"
# Notice that the syntactic sugar when calling the #[] method is more involved than the previous examples. grocery_checkout.[](1) is equivalent to grocery_checkout[1]. Using the syntactic sugar, we can put a number between the square brackets and it will be interpreted as the first arg to the #[] method.

# Implementing #[]=
# Building off of the #[] method what if I wanted the ability to assign to a specified position by implementing a #[]= method? Let's take a look at how we can define this special setter:

# class Queue
#   def initialize
#     @line = []
#   end

#   def [](position)
#     @line[position]
#   end

#   def []=(position, ele)
#     @line[position] = ele
#   end

#   def add(ele)
#     @line << ele # add ele to back of line
#     nil
#   end

#   def remove
#     @line.shift  # remove front ele of line
#   end
# end

# grocery_checkout = Queue.new
# grocery_checkout.add("Alan")
# grocery_checkout.add("Alonzo")

# # Let's call Queue#[]= without syntactic sugar:
# grocery_checkout.[]=(0, "Grace")
# p grocery_checkout    #<Queue:0x007fe7a7a29ec8 @line=["Grace", "Alonzo"]>

# # Let's call Queue#[]= again, but with syntactic sugar:
# grocery_checkout[1] = "Grace"
# p grocery_checkout    #<Queue:0x007fe7a7a29ec8 @line=["Grace", "Grace"]>
# From the above we see that grocery_checkout.[]=(0, "Grace") is equivalent to grocery_checkout[0] = "Grace". Looking at how we defined the []= method, we can gather that when we use the syntactic sugar for calling []=, the data that we put between the brackets will be the first argument, and what comes after the equal sign will be the second argument to our method

# † pun intended