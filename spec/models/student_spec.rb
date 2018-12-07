require 'rails_helper'

RSpec.describe Student, type: :model do
  # write your student model here

     
     it { should respond_to :name } 
     it { should respond_to :student_number } 
     it { should respond_to :gpa } 


    describe "vaildations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :student_number }
      it { should validate_presence_of :gpa }
    
      it 'has a capacity lower bound' do
        should validate_numericality_of(:student_number).
        is_greater_than_or_equal_to(0)
      end
  
      it 'as a capcaity higer bound' do
        should validate_numericality_of(:student_number).
        is_less_than_or_equal_to(10000)
      end

    end

    describe "association" do
      it { should belongs_to(:school) }
    end

     describe "uniqueness" do
      Student.create!(name: 'abc', student_number: 30, gpa:4.0)
      subject { Student.new(name: 'abc', student_number: 30, gpa:4.0)}
      it { should validate_uniqueness_of(:name) }
    end

    describe "numericality" do
      before(:each) do
        @student = Student.create(name: 'abc', student_number: 30, gpa:4.0)
      end
      
       it { should validate_numericality_of(:student_number) }
    end 


end 