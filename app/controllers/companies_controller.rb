class CompaniesController < ApplicationController
  def new
    @current = 'Employers'
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    puts '#'*80
    puts(@company.gigawatt_option)
    puts '#'*80

    if @company.save
      redirect_to root_url, flash: {success: 'You have successfully registered. '}
    else
      render 'new'
    end
  end

  private
    def company_params
        params.require(:company).permit(:name, :description, :logo, :logo_permission, :level, :street_address, :city, :zip_code, :telephone, :attendances, :additional_needed, :additional, :networking_event, :comment, :gigawatt_option => [], :attendee_names => [], :attendee_emails => [], :attendee_telephones => [], :items => [])
    end
end
