class Bootcamp
  
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |grades, k| grades[k] = [] }
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(str)
        @teachers << str
    end

    def enroll(str)
        
        if @students.length < @student_capacity
            @students << str
            return true
        end
        false
    end

    def enrolled?(student)

        @students.include?(student)
    end

    def student_to_teacher_ratio
        @students.length / @teachers.length 
    end



    def add_grade(student, grade)
        @grades[student] << grade if enrolled?(student)
        #if student in the class then add the grade 
        enrolled?(student)
        #if student is not in the class return false
    end


    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        if enrolled?(student) and num_grades(student) != 0
            return @grades[student].sum / num_grades(student)
        end
    end


end
