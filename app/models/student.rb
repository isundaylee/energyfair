class Student < ActiveRecord::Base
  UNIVERSITIES = ['MIT', 'Harvard']
  DEGREES = ['Undergraduate', 'Graduate']
  GRADUATION_YEARS = (2015...2020).to_a
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

  serialize :interests
  serialize :top_companies

  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates :email, presence: true, length: {minimum: 3, maximum: 50}

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
    ['', 'Apple', 'Google', 'Astray']
  end
end
