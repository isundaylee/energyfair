class StudentsController < ApplicationController
  def new
    @current = 'Students'
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to root_url, flash: {success: 'You have successfully registered. '}
    else
      render 'new'
    end
  end

  private
    def student_params
      params.require(:student).permit(:name, :email, :university, :degree,:major, :graduation_year, :graduation_month, :citizenship, :top_company_1, :top_company_2, :top_company_3, :resume, interests: [])
    end
end
