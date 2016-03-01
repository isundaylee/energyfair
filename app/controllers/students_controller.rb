class StudentsController < ApplicationController
  def new
    redirect_to root_url, flash: {alert: 'Our resume drop has been closed. If you have any questions or concerns, please email ute-expo@mit.edu. We look forward to seeing you at the career fair.'}

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
      params.require(:student).permit(:name, :email, :university, :degree,:major, :graduation_year, :graduation_month, :citizenship, :top_company_1, :top_company_2, :top_company_3, :resume, :resume_permission, interests: [], work_type: [])
    end
end
