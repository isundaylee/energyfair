class AdminController < ApplicationController
  require 'zip'

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
            zip.add("#{permission}/#{s.name} (#{s.id}).pdf", s.resume.path)
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
end
