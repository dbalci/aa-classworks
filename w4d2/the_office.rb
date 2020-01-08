#Class Inheritance W4D2
class Employee
  attr_accessor :name, :salary, :title, :boss
  def initialize(name,salary,title,boss)
    @name = name
    @salary = salary
    @title = title
    @boss = boss
  end

  def bonus(multiplier)
    bonus = salary * multiplier
  end

end

class Manager < Employee
    
  attr_accessor :name, :salary, :title, :boss

  def initialize(name,salary,title,boss)
    super
    @employees = []
  end

  def add_employee(employee)
    @employees << employee 
  end

  def bonus(multiplier)
    sum = 0
    @employees.each {|emp| sum += emp.salary}
    bonus = sum * multiplier
  end
end
