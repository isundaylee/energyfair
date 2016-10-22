class Student < ActiveRecord::Base
  UNIVERSITIES = ['MIT', 'Harvard', 'Other']

  DEGREES = ['Undergraduate', 'Graduate']

  GRADUATION_YEARS = (2000...2030).to_a

  GRADUATION_MONTHS = [
    ['January', 1],
    ['February', 2],
    ['March', 3],
    ['April', 4],
    ['May', 5],
    ['June', 6],
    ['July', 7],
    ['August', 8],
    ['September', 9],
    ['October', 10],
    ['November', 11],
    ['December', 12],
  ]

  INTERESTS = [
    'Solar',
    'Wind',
    'Storage',
    'Future Grid',
    'Bio Energy',
    'Energy & Environment',
    'Nuclear',
    'Oil & Gas',
    'Building Sustainability',
    'Other'
  ]

  JOIN_REASONS = [
    'Job opportunities',
    'To meet others interested in energy',
    'To expand knowledge of energy space',
    'Leadership opportunities',
    'Other'
  ]

  WORK_TYPES = [
    'Internship',
    'Full-time'
  ]

  serialize :interests
  serialize :join_reasons
  serialize :top_companies
  serialize :work_type

  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates :email, presence: true, length: {minimum: 3, maximum: 50}

  has_attached_file :resume

  validates_attachment_content_type :resume, content_type: ['application/pdf'], message: 'must be PDF files. '

  def top_company_1
    self.top_companies ||= ['', '', '']
    self.top_companies[0]
  end

  def top_company_2
    self.top_companies ||= ['', '', '']
    self.top_companies[1]
  end

  def top_company_3
    self.top_companies ||= ['', '', '']
    self.top_companies[2]
  end

  def top_company_1=(company)
    self.top_companies ||= ['', '', '']
    self.top_companies[0] = company
  end

  def top_company_2=(company)
    self.top_companies ||= ['', '', '']
    self.top_companies[1] = company
  end

  def top_company_3=(company)
    self.top_companies ||= ['', '', '']
    self.top_companies[2] = company
  end

  def self.top_company_options
    [''] + Company.all.map(&:name)
  end
end
