class Restaurant < ApplicationRecord
  validates :name, :image,:speciality, presence: true
  mount_uploader :image, ImageUploader
  has_many :zones
  belongs_to :speciality

  private
  def self.search_filter(speciality,zone,name)
    speciality = speciality.empty? ? " " : "%#{speciality}%"
    zone = zone.empty? ? " " : "%#{zone}%"
    name = name.empty? ? " " :  "%#{name}%"

    result = self.joins([:speciality,:zones]).where('restaurants.name ILIKE ? OR specialities.name ILIKE ? OR zones.address ILIKE ? ', name,speciality,zone)
  end

end
