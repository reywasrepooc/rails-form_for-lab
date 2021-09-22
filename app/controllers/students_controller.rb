class StudentsController < ApplicationController
  def index
    @students = Student.all
  end
  
  def show
     @student = student_params
  end
    
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_permit)
    @student.save
    redirect_to student_path(@student)
  end

  def edit
    @student = student_params
  end

  def update
    @student = student_params
    @student.update(student_permit)
    redirect_to student_path(@student)
  end

  private 
  def student_params
    Student.find(params[:id])
  end

  def student_permit
    params.require(:student).permit(:first_name, :last_name)
  end
end
