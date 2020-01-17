class Course < ApplicationRecord
    validates :name, presence: true
    validates :prereq_id, presence: false
    validates :instructor_id, presence: true # :created_at, :updated_at

    has_many :enrollments,
        primary_key: :id, 
        foreign_key: :course_id,
        class_name: :Enrollment

    has_many :enrolled_students,
        through: :enrollments,
        source: :user

    belongs_to :prerequisite,
        primary_key: :id,
        foreign_key: :prereq_id, 
        class_name: :Course

    belongs_to :instructor,
        primary_key: :id,     
        foreign_key: :instructor_id, 
        class_name: :User   
end
