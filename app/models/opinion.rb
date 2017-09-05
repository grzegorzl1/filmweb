class Opinion < ApplicationRecord
  validates :author, presence: true, length: { minimum: 5 }
  validates :rating, presence: true
  validates :comment, presence: true, length: { minimum: 5 }

  belongs_to :film

  def self.get_film_average(film_id)
    opinions = Opinion.where("film_id = ?", film_id)
    opinions.size == 0 ? (return 0) : (avg_rating = 0)
    opinions.each { |opinion| avg_rating += opinion.rating }
    avg_rating /= opinions.size.to_f
  end

  def self.get_film_opinions(film_id)
    Opinion.where("film_id = ?", film_id).count
  end
end
