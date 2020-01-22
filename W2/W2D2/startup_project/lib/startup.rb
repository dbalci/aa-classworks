require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(other_startup)
        self.funding > other_startup.funding
    end

    def hire(emp_name, title)
        if @salaries.has_key?(title)
            @employees << Employee.new(emp_name , title)
        else
            raise "Error"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        emp_title = employee.title
        if @funding > @salaries[emp_title]
            employee.pay(@salaries[emp_title])
            @funding -= @salaries[emp_title]
        else
            raise "Error"
        end
    end

    def payday
        @employees.each {|emp| pay_employee(emp)}
    end

    def average_salary
        sum = 0
        @employees.each {|emp| sum += @salaries[emp.title]  }
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |k,v|
            @salaries[k] = v if !@salaries.has_key?(k)
        end
        @employees += startup.employees
        startup.close
    end
end
