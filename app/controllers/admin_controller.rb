class AdminController < ApplicationController
  require 'zip'
  require 'csv'

  ADMIN_USERNAME = Rails.env.production? ? ENV['ADMIN_USER'] : 'user'
  ADMIN_PASSWORD = Rails.env.production? ? ENV['ADMIN_PASS'] : 'pass'

  http_basic_authenticate_with name: ADMIN_USERNAME, password: ADMIN_PASSWORD

  def index
  end

  def resumes
    filename = 'resumes.zip'
    tempfile = Tempfile.new(filename)

    begin
      Zip::OutputStream.open(tempfile) { |zos| }

      Zip::File.open(tempfile.path, Zip::File::CREATE) do |zip|
        Student.all.each do |s|
          if s.resume.exists?
            permission = (s.resume_permission? ? 'With Permission' : 'Without Permission')
            zip.add("#{permission}/#{s.email.split('@').last} - #{s.degree}/#{s.name} (#{s.id}).pdf", s.resume.path)
          end
        end
      end

      zip_data = File.read(tempfile.path)
      send_data(zip_data, type: 'application/zip', filename: filename)
    rescue
      tempfile.close
      tempfile.unlink
    end
  end

  def students
    filename = 'students.csv'
    tempfile = Tempfile.new(filename)

    CSV.open(tempfile.path, 'w') do |csv|
      csv << [
        'Name',
        'Email',
        'Degree',
        'Major',
        'Interests',
        'Why Join',
        'Graduation Year',
        'Work Types Interested',
        'Comments'
      ]
      Student.all.each do |s|
        csv << [
          s.name,
          s.email,
          s.degree,
          s.major,
          s.interests.try(:join, ", "),
          s.join_reasons.try(:join, ", "),
          s.graduation_year == 0 ? 'Before 2000' : s.graduation_year,
          s.work_type.try(:join, ", "),
          s.comments
        ]
      end
    end

    send_data(File.read(tempfile.path), type: 'text/csv', filename: filename)
  end

  def companies
    filename = 'companies.csv'
    tempfile = Tempfile.new(filename)

    CSV.open(tempfile.path, 'w') do |csv|
      row = []
      row += ['Name', 'Description', 'Logo Permission', 'Option', 'Street Address', 'City', 'Zip Code', 'Telephone', 'Number of Attendances']

      1.upto(5) do |i|
        row += [
          'Attendee Name #' + i.to_s,
          'Attendee Email #' + i.to_s,
          'Attendee Telephone #' + i.to_s,
        ]
      end

      row += ['Additional Space/Equipment', 'Promo Items', 'Comment']
      csv << row

      Company.all.each do |c|
        row = []
        row += [
          c.name,
          c.description,
          (c.logo_permission ? 'Yes' : 'No'),
          c.gigawatt_option,
          c.street_address,
          c.city,
          c.zip_code,
          c.telephone,
          c.attendances
        ]

        1.upto(5) do |i|
          row += [
            c.attendee_names[i - 1],
            c.attendee_emails[i - 1],
            c.attendee_telephones[i - 1],
          ]
        end

        row += [
          (c.additional_needed ? c.additional : 'Not needed. '),
          c.items.try(:join, ','),
          c.comment
        ]

        csv << row
      end
    end

    send_data(File.read(tempfile.path), type: 'text/csv', filename: filename)
  end
end
