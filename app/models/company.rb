class Company < ActiveRecord::Base
  LEVELS = [
    ['Gigawatts', 2],
    ['Megawatts', 1],
    ['Kilowatts', 0]
  ]

  GIGAWATT_OPTIONS = [
    'Information sessions during week of Energy Career Fair. ',
    'Information sessions prior to the Energy Career Fair. ',
    'Interview rooms the day after the Career Fair'
  ]

  ITEMS = [
    'Flyers/Brochures',
    'Pens',
    'T-shirts',
    'Demos',
    'Stickers/Gadgets'
  ]

  NETWORKING_EVENTS = [
    'Yes',
    'No',
    'I would like more information about this event before deciding. '
  ]

  serialize :attendee_names
  serialize :attendee_emails
  serialize :attendee_telephones
  serialize :additional
  serialize :items
  serialize :gigawatt_option

  has_attached_file :logo, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"

  validates :name, presence: true, length: {minimum: 2, maximum: 100}
  validates :description, presence: true, length: {minimum: 2, maximum: 1000}
  validates :street_address, presence: true, length: {minimum: 5, maximum: 200}
  validates :city, presence: true, length: {minimum: 2, maximum: 50}
  validates :zip_code, presence: true, length: {minimum: 5, maximum: 5}
  validates :telephone, presence: true, length: {minimum: 9, maximum: 20}
  validates_attachment_presence :logo
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  def custom_item
    items.nil? ?
      '' :
      (items.select { |a| !ITEMS.include?(a) }.first || '')
  end
end
