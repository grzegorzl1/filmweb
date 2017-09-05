class Actor < ApplicationRecord
  validates :name_surname, presence: true, length: { minimum: 3 }
  validates :date_of_birth, presence: true
  validates :country_of_origin, presence: true
  validates :biography, length: { minimum: 3 }
  validates :filmography, length: { minimum: 5 }

  def next_actor
    Actor.where("id > ?", id).order(:id).first
  end

  def previous_actor
    Actor.where("id < ?", id).order(:id).last
  end

  def capitalize_title
    self.name_surname = self.name_surname.capitalize
    self.save!
  end
end
