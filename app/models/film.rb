class Film < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  validates :premiere_date, presence: true
  validates :duration, presence: true
  validates :description, :country, length: { minimum: 3 }
  validates :genre, :director, :scenarist, length: { minimum: 5 }

  has_many :opinions, dependent: :destroy

  def next_film
    Film.where("id > ?", id).order(:id).first
  end

  def previous_film
    Film.where("id < ?", id).order(:id).last
  end

  def capitalize_title
    self.title = self.title.capitalize
    self.save!
  end
end
